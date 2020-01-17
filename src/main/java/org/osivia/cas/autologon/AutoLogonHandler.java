package org.osivia.cas.autologon;

import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.login.FailedLoginException;

import org.apache.commons.lang3.BooleanUtils;
import org.jasig.cas.MessageDescriptor;
import org.jasig.cas.authentication.AbstractAuthenticationHandler;
import org.jasig.cas.authentication.BasicCredentialMetaData;
import org.jasig.cas.authentication.Credential;
import org.jasig.cas.authentication.CredentialMetaData;
import org.jasig.cas.authentication.DefaultHandlerResult;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.principal.Principal;
import org.jasig.services.persondir.IPersonAttributes;
import org.jasig.services.persondir.support.ldap.LdaptivePersonAttributeDao;
import org.osivia.cas.adaptors.ldap.AccountValidityHandler;
import org.springframework.beans.factory.annotation.Value;

/**
 * 
 * Handler for autologon : users should have local account, with validity date and
 * and specific profile
 * 
 * @author Loïc Billon
 *
 */
public class AutoLogonHandler extends AbstractAuthenticationHandler {

	private final LdaptivePersonAttributeDao dao;
	
	private AccountValidityHandler validityHandler;
	
	private String authorizedProfile;
	
	public AutoLogonHandler(LdaptivePersonAttributeDao dao) {
		this.dao = dao;
	}
	
	
	@Override
	public HandlerResult authenticate(Credential credential) throws GeneralSecurityException, PreventedException {

		AutoLogonCredential creds = (AutoLogonCredential) credential;
	
		IPersonAttributes person = null;
		try {
			person = dao.getPerson(creds.getLogin());
		}
		catch(Exception e) {
			throw new GeneralSecurityException(e);

		}
		
		if(person != null) {
			
			Object portalPersonExternal = person.getAttributeValue("portalpersonexternal");
			Object portalPersonValidity = person.getAttributeValue("portalPersonValidity");
			Boolean external = BooleanUtils.toBooleanObject(portalPersonExternal.toString());
			
			// check validity
			validityHandler.checkValidity(external, portalPersonValidity);
			
			// check ability to autologin
			boolean autolog = false;
			List<Object> attributeValues = person.getAttributeValues("portalpersonprofile");
			for(Object obj : attributeValues) {
				String profile = obj.toString();
				
				if(profile.equalsIgnoreCase(getAuthorizedProfile())) {
					autolog = true;
				}
			}
			
			if(autolog) {
				Principal principal = principalFactory.createPrincipal(creds.getLogin());
				
				CredentialMetaData metaData = new BasicCredentialMetaData(credential);
				List<MessageDescriptor> warnings = new ArrayList<MessageDescriptor>();
				return new DefaultHandlerResult(this, metaData, principal, warnings);
			}
			else {
				throw new FailedLoginException("Invalid account (external)");

			}
		}
		else {
			throw new FailedLoginException("Invalid account (external)");
		}
		
	}

	@Override
	public boolean supports(Credential credential) {
		return credential instanceof AutoLogonCredential;
	}


	public AccountValidityHandler getValidityHandler() {
		return validityHandler;
	}


	public void setValidityHandler(AccountValidityHandler validityHandler) {
		this.validityHandler = validityHandler;
	}


	public String getAuthorizedProfile() {
		return authorizedProfile;
	}

	@Value(value="${autologon.authorizedProfile}")
	public void setAuthorizedProfile(String authorizedProfile) {
		this.authorizedProfile = authorizedProfile;
	}
	

}
