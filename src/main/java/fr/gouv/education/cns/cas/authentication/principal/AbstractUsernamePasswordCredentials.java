package fr.gouv.education.cns.cas.authentication.principal;

import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;

/**
 * Username / password credentials abstract super-class.
 * 
 * @author Cédric Krommenhoek
 * @see UsernamePasswordCredentials
 */
public abstract class AbstractUsernamePasswordCredentials extends UsernamePasswordCredentials {

    /** Default serial version identifier. */
    private static final long serialVersionUID = 1L;


    /**
     * Constructor.
     */
    public AbstractUsernamePasswordCredentials() {
        super();
    }


    /**
     * Get external indicator.
     * 
     * @return external indicator
     */
    public abstract boolean isExternal();

}
