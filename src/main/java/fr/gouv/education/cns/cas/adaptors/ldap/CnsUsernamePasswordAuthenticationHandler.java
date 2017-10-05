package fr.gouv.education.cns.cas.adaptors.ldap;

import fr.gouv.education.cns.cas.authentication.principal.CnsUsernamePasswordCredentials;

/**
 * CNS username / password authentification handler.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractUsernamePasswordAuthenticationHandler
 */
public class CnsUsernamePasswordAuthenticationHandler extends AbstractUsernamePasswordAuthenticationHandler {

    /**
     * Constructor.
     */
    public CnsUsernamePasswordAuthenticationHandler() {
        super(CnsUsernamePasswordCredentials.class);
    }

}
