package fr.gouv.education.cns.cas.authentication.principal;

/**
 * Forums username / password credentials.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractUsernamePasswordCredentials
 */
public class ForumsUsernamePasswordCredentials extends AbstractUsernamePasswordCredentials {

    /** Default serial version identifier. */
    private static final long serialVersionUID = 1L;


    /**
     * Constructor.
     */
    public ForumsUsernamePasswordCredentials() {
        super();
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isExternal() {
        return false;
    }

}
