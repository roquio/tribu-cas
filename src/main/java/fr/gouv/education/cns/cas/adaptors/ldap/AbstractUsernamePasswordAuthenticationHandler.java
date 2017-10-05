package fr.gouv.education.cns.cas.adaptors.ldap;

import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;

import org.apache.commons.lang.BooleanUtils;
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
            String transformedUsername = getPrincipalNameTransformer().transform(credentials.getUsername());
            // Bind DN
            String bindDn = LdapUtils.getFilterWithValues(getFilter(), transformedUsername);

            dirContext = this.getContextSource().getContext(bindDn, credentials.getPassword());

            // LDAP attributes
            Attributes attributes;
            if (dirContext == null) {
                attributes = null;
            } else {
                attributes = dirContext.getAttributes(bindDn);
            }

            // Account external only
            Attribute externalAttribute;
            if (attributes == null) {
                externalAttribute = null;
            } else {
                externalAttribute = attributes.get("GEDPersonExternal");
            }

            // If person has external account, no login allowed
            result = !(externalAttribute != null && externalAttribute.get() != null && BooleanUtils.toBoolean(externalAttribute.get().toString()));
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
