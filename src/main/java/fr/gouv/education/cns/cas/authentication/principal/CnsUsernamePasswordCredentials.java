package fr.gouv.education.cns.cas.authentication.principal;

/**
 * CNS username / password credentials.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractUsernamePasswordCredentials
 */
public class CnsUsernamePasswordCredentials extends AbstractUsernamePasswordCredentials {

    /** Default serial version identifier. */
    private static final long serialVersionUID = 1L;


    /**
     * Constructor.
     */
    public CnsUsernamePasswordCredentials() {
        super();
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public boolean isExternal() {
        return true;
    }

}
