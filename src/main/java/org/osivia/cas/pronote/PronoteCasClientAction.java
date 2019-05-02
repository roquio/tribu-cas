/**
 * 
 */
package org.osivia.cas.pronote;

import org.apache.commons.lang3.StringUtils;
import org.jasig.cas.CentralAuthenticationService;
import org.jasig.cas.authentication.Credential;
import org.jasig.cas.web.flow.AbstractNonInteractiveCredentialsAction;
import org.springframework.webflow.execution.RequestContext;

/**
 * 
 * Action appelée si le portail indique une URL avec des paramètres :
 * - urlCAS (lien vers le serviceValidate), ticket et service
 * Renseigne un Credential avec ces paramètres gérés par le handler
 * 
 * @author Loïc Billon
 *
 */
public class PronoteCasClientAction extends AbstractNonInteractiveCredentialsAction {

	/**
	 * 
	 */
	public PronoteCasClientAction(CentralAuthenticationService theCentralAuthenticationService) {
				
		this.setCentralAuthenticationService(theCentralAuthenticationService);
	}
	
	/* (non-Javadoc)
	 * @see org.jasig.cas.web.flow.AbstractNonInteractiveCredentialsAction#constructCredentialsFromRequest(org.springframework.webflow.execution.RequestContext)
	 */
	@Override
	protected Credential constructCredentialsFromRequest(RequestContext context) {
		
		String serviceTicket = context.getRequestParameters().get("ticket");
		String casServiceValidateUrl = context.getRequestParameters().get("urlCAS");
		String serviceUrl = context.getRequestParameters().get("service");

		
		if(logger.isDebugEnabled()) {
			logger.debug("About to validate serviceTickat "+serviceTicket+" for "+serviceUrl+" to "+casServiceValidateUrl);
		}
		
		PronoteCasClientCredential credential = null;
		if(StringUtils.isNotBlank(casServiceValidateUrl) && StringUtils.isNotBlank(serviceTicket)) {
		
			credential = new PronoteCasClientCredential();
			credential.setServiceTicket(serviceTicket);
			credential.setCasServiceValidateUrl(casServiceValidateUrl);
			credential.setServiceUrl(serviceUrl);;
		}
		else {
			logger.error("urlCAS, ticket and service url are mandatory.");
		}
		
		return credential;
	}


	
}
