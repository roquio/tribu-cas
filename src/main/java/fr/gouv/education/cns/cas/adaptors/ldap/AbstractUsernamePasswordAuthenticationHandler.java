package fr.gouv.education.cns.cas.adaptors.ldap;

import java.util.regex.Matcher;

import javax.naming.directory.DirContext;
import javax.naming.ldap.Rdn;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.adaptors.ldap.AbstractLdapUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.handler.AuthenticationException;
import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;
import org.jasig.cas.util.LdapUtils;

/**
 * Username / password authentication handler abstract super-class.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractLdapUsernamePasswordAuthenticationHandler
 */
public abstract class AbstractUsernamePasswordAuthenticationHandler extends AbstractLdapUsernamePasswordAuthenticationHandler {

    /**
     * Constructor.
     */
    public AbstractUsernamePasswordAuthenticationHandler(Class<? extends UsernamePasswordCredentials> type) {
        super();
        this.setClassToSupport(type);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    protected boolean authenticateUsernamePasswordInternal(UsernamePasswordCredentials credentials) throws AuthenticationException {
        // Authentication result
        boolean result;

        credentials.setUsername(StringUtils.lowerCase(credentials.getUsername()));

        // LDAP directory context
        DirContext dirContext = null;
        try {
            // Transformed username
            String transformedUsername = Rdn.escapeValue(getPrincipalNameTransformer().transform(credentials.getUsername()));
            // Bind DN
            String bindDn = getFilter().replaceAll("%u", Matcher.quoteReplacement(transformedUsername));

            dirContext = this.getContextSource().getContext(bindDn, credentials.getPassword());

            result = (dirContext != null);
        } catch (Exception e) {
            result = false;
        } finally {
            if (dirContext != null) {
                LdapUtils.closeContext(dirContext);
            }
        }

        return result;
    }
    
}
