package fr.gouv.education.cns.cas.authentication.principal;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.authentication.principal.Credentials;
import org.jasig.cas.authentication.principal.CredentialsToPrincipalResolver;
import org.jasig.cas.authentication.principal.Principal;
import org.jasig.cas.authentication.principal.SimplePrincipal;

/**
 * Username / password credentials to principal resolver.
 * 
 * @author Cédric Krommenhoek
 * @see CredentialsToPrincipalResolver
 */
public class UsernamePasswordCredentialsToPrincipalResolver implements CredentialsToPrincipalResolver {

    /**
     * Constructor.
     */
    public UsernamePasswordCredentialsToPrincipalResolver() {
        super();
    }


    /**
     * {@inheritDoc}
     */
    public Principal resolvePrincipal(Credentials credentials) {
        // Username password credentials
        AbstractUsernamePasswordCredentials usernamePasswordCredentials = (AbstractUsernamePasswordCredentials) credentials;
        
        // Principal identifier
        String id = StringUtils.lowerCase(usernamePasswordCredentials.getUsername());
        
        // Principal attributes
        Map<String, Object> attributes = new HashMap<String, Object>();
        attributes.put("external", usernamePasswordCredentials.isExternal());
        
        return new SimplePrincipal(id, attributes);
    }


    /**
     * {@inheritDoc}
     */
    public boolean supports(Credentials credentials) {
        return credentials != null && AbstractUsernamePasswordCredentials.class.isAssignableFrom(credentials.getClass());
    }

}
