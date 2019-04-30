/**
 * 
 */
package org.osivia.cas.pronote;

import org.jasig.cas.authentication.Credential;

/**
 * Modèle de Credential pour le login vers le CAS Pronote
 * @author Loîc Billon
 *
 */
public class PronoteCasClientCredential implements Credential {

	private String casServiceValidateUrl;
	
	private String serviceTicket;
	
	private String serviceUrl;
	
	/* (non-Javadoc)
	 * @see org.jasig.cas.authentication.Credential#getId()
	 */
	@Override
	public String getId() {
		return serviceTicket + "@" + casServiceValidateUrl;	
	}

	/**
	 * @return the casServiceValidateUrl
	 */
	public String getCasServiceValidateUrl() {
		return casServiceValidateUrl;
	}

	/**
	 * @param casServiceValidateUrl the casServiceValidateUrl to set
	 */
	public void setCasServiceValidateUrl(String casServiceValidateUrl) {
		this.casServiceValidateUrl = casServiceValidateUrl;
	}

	/**
	 * @return the serviceTicket
	 */
	public String getServiceTicket() {
		return serviceTicket;
	}

	/**
	 * @param serviceTicket the serviceTicket to set
	 */
	public void setServiceTicket(String serviceTicket) {
		this.serviceTicket = serviceTicket;
	}

	/**
	 * @return the serviceUrl
	 */
	public String getServiceUrl() {
		return serviceUrl;
	}

	/**
	 * @param serviceUrl the serviceUrl to set
	 */
	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

}
