/**
 * 
 */
package org.osivia.cas.pronote;

import java.io.IOException;
import java.io.StringReader;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jasig.cas.MessageDescriptor;
import org.jasig.cas.authentication.AbstractAuthenticationHandler;
import org.jasig.cas.authentication.BasicCredentialMetaData;
import org.jasig.cas.authentication.Credential;
import org.jasig.cas.authentication.CredentialMetaData;
import org.jasig.cas.authentication.DefaultHandlerResult;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.principal.Principal;
import org.ldaptive.LdapException;
import org.ldaptive.auth.DnResolver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * Authentification dans le CAS Pronote
 * 
 * @author Loïc Billon
 *
 */
public class PronoteCasClientHandler extends AbstractAuthenticationHandler {

	/** The logger instance. */
	protected final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	/** Pour vérifier que le login pronote est présent dans l'annuaire cloud-ens */
	private final DnResolver dnResolverForClient;
	
	/** Pronote CAS url validate */
	private String casValidateUrl;

	
	public PronoteCasClientHandler(DnResolver dnResolverForClient) {
		this.dnResolverForClient = dnResolverForClient;
		
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.jasig.cas.authentication.AuthenticationHandler#authenticate(org.jasig.cas
	 * .authentication.Credential)
	 */
	@Override
	public HandlerResult authenticate(Credential credential) throws GeneralSecurityException, PreventedException {

        if (logger.isDebugEnabled()) {
            logger.debug("authenticate");
        }
	    
	    
		PronoteCasClientCredential pronoteCredential = null;
		if (credential != null) {
			pronoteCredential = (PronoteCasClientCredential) credential;
		} else {
			logger.error("credential is null");
			throw new GeneralSecurityException("credential is null");
		}

		CloseableHttpClient client ;
		try {
			
			if(!pronoteCredential.getCasName().equals("pronote")) {
				throw new GeneralSecurityException("Upstream Cas name "+pronoteCredential.getCasName()+" unknown");
			}
			
			
			client = HttpClientBuilder.create().build();
			
			URIBuilder builder = new URIBuilder(casValidateUrl);
			builder.setParameter("ticket", pronoteCredential.getServiceTicket());
			builder.setParameter("service", pronoteCredential.getServiceUrl());

			HttpGet request = new HttpGet(builder.build());
			// add request header
			request.addHeader("User-Agent", "Cloud-ens");

			HttpResponse response = client.execute(request);
			int statusCode = response.getStatusLine().getStatusCode();

			if (logger.isDebugEnabled()) {
				logger.debug("GET " + request.getURI().toASCIIString() + " returned HTTP " + statusCode);
			}

            if (logger.isDebugEnabled()) {
                logger.debug("analyse response ");
            }
			
			if (statusCode == 200) {

				DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
				String xml = EntityUtils.toString(response.getEntity());
				
				
		        if (logger.isDebugEnabled()) {
		            logger.debug("response " + xml);
		        }

				Document casResponse = docBuilder.parse(new InputSource(new StringReader(xml)));
//				XPath xPath = XPathFactory.newInstance().newXPath();
				Element root = casResponse.getDocumentElement();
				
				String casUser = null;

				for (int i = 0; i < root.getChildNodes().getLength(); i++) {
					Node item = root.getChildNodes().item(i);

					if(item.getNodeType() == Node.ELEMENT_NODE && item.getNodeName().equals("cas:authenticationSuccess")) {
						for (int j = 0; j < item.getChildNodes().getLength(); j++) {
							
							Node item2 = item.getChildNodes().item(j);
							
							if(item2.getNodeType() == Node.ELEMENT_NODE && item2.getNodeName().equals("cas:user")) {

								for (int k = 0; k < item2.getChildNodes().getLength(); k++) {
									Node item3 = item2.getChildNodes().item(k);
									casUser = item3.getNodeValue();	
									
								}
							}
						}
					}
					
				}
				

				if (logger.isDebugEnabled()) {
					logger.debug("Response :  " + docBuilder.toString());
				}
				
				// check existance of account in ldap
				String resolve = dnResolverForClient.resolve(casUser);
				
				if(resolve != null) {
				
					Principal principal = principalFactory.createPrincipal(casUser);
	
					CredentialMetaData metaData = new BasicCredentialMetaData(credential);
					List<MessageDescriptor> warnings = new ArrayList<MessageDescriptor>();
					return new DefaultHandlerResult(this, metaData, principal, warnings);
				}
				else {
					throw new GeneralSecurityException(
							"Unknown user " + casUser);
				}

			} else {
				throw new GeneralSecurityException(
						"Server returned a non-ok response " + response.getEntity().toString());
			}


		} catch (UnsupportedOperationException | IOException | URISyntaxException | ParserConfigurationException
				| SAXException | LdapException e) {
			throw new PreventedException(e);
		}


	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.jasig.cas.authentication.AuthenticationHandler#supports(org.jasig.cas.
	 * authentication.Credential)
	 */
	@Override
	public boolean supports(Credential credential) {

		return credential instanceof PronoteCasClientCredential;

	}

	/**
	 * @return the casValidateUrl
	 */
	public String getCasValidateUrl() {
		return casValidateUrl;
	}

	/**
	 * @param casValidateUrl the casValidateUrl to set
	 */
	public void setCasValidateUrl(String casValidateUrl) {
		this.casValidateUrl = casValidateUrl;
	}
	
	

}
