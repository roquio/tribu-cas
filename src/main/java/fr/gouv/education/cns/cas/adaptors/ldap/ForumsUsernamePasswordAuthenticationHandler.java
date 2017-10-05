package fr.gouv.education.cns.cas.adaptors.ldap;

import fr.gouv.education.cns.cas.authentication.principal.ForumsUsernamePasswordCredentials;

/**
 * Forums username / password authentication handler.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractUsernamePasswordAuthenticationHandler
 */
public class ForumsUsernamePasswordAuthenticationHandler extends AbstractUsernamePasswordAuthenticationHandler {

    /**
     * Constructor.
     */
    public ForumsUsernamePasswordAuthenticationHandler() {
        super(ForumsUsernamePasswordCredentials.class);
    }

}
