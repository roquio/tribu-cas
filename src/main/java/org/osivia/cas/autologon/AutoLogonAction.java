package org.osivia.cas.autologon;

import org.apache.commons.lang3.StringUtils;
import org.jasig.cas.authentication.Credential;
import org.jasig.cas.web.flow.AbstractNonInteractiveCredentialsAction;
import org.springframework.webflow.execution.RequestContext;

/**
 * 
 * Auto logon on CAS with specific url
 * 
 * @author Loïc Billon
 *
 */
public class AutoLogonAction extends AbstractNonInteractiveCredentialsAction {

	
	@Override
	protected Credential constructCredentialsFromRequest(RequestContext context) {


		String serviceUrl = context.getRequestParameters().get("service");
		String login = context.getRequestParameters().get("login");
		
		AutoLogonCredential credentials = null;

		if(StringUtils.isNotBlank(serviceUrl) && StringUtils.isNotBlank(login)) {
			credentials = new AutoLogonCredential();
			credentials.setServiceUrl(serviceUrl);
			credentials.setLogin(login);

		}
		else {
			logger.error("login and service url are mandatory.");
		}
		
		
		
		return credentials;
	}

}
