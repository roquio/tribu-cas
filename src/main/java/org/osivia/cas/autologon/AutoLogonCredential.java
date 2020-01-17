package org.osivia.cas.autologon;

import org.jasig.cas.authentication.Credential;

/**
 * Autologon form
 * @author Loïc Billon
 *
 */
public class AutoLogonCredential implements Credential{

	private String serviceUrl;
	private String login;

	@Override
	public String getId() {
		return login + "/autologin";
	}

	public String getServiceUrl() {
		return serviceUrl;
	}


	public String getLogin() {
		return login;
	}

	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
		
	}

	public void setLogin(String login) {
		this.login = login;
		
	}

}
