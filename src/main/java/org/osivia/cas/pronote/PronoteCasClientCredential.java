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

	private String serviceTicket;
	
	private String serviceUrl;

	private String casName;
	
	/* (non-Javadoc)
	 * @see org.jasig.cas.authentication.Credential#getId()
	 */
	@Override
	public String getId() {
		return serviceTicket + "@" + casName;	
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
	 * @return the casName
	 */
	public String getCasName() {
		return casName;
	}

	/**
	 * @param serviceUrl the serviceUrl to set
	 */
	public void setServiceUrl(String serviceUrl) {
		this.serviceUrl = serviceUrl;
	}

	/**
	 * @param casName
	 */
	public void setCasName(String casName) {
		this.casName = casName;
		
	}

}
