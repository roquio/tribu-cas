package org.osivia.cas.adaptors.ldap;

import java.text.ParseException;
import java.util.Date;

import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;

import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.directory.api.util.GeneralizedTime;
import org.jasig.cas.adaptors.ldap.AbstractLdapUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.handler.AuthenticationException;
import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;
import org.jasig.cas.util.LdapUtils;

/**
 * Username / password authentification handler.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractLdapUsernamePasswordAuthenticationHandler
 */
public class UsernamePasswordAuthenticationHandler extends AbstractLdapUsernamePasswordAuthenticationHandler {

    /**
     * Constructor.
     */
    public UsernamePasswordAuthenticationHandler() {
        super();
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
                externalAttribute = attributes.get("portalPersonExternal");
            }            

            // If person has external account, no login allowed
            if(externalAttribute != null && externalAttribute.get() != null && BooleanUtils.toBoolean(externalAttribute.get().toString())) {
            	result = false;
            	
            }
            else {
            
	            // Account validity date attribute
	            Attribute validityAttribute;
	            if (attributes == null) {
	                validityAttribute = null;
	            } else {
	                validityAttribute = attributes.get("portalPersonValidity");
	            }
	
	            // Account validity date
	            Date validity;
	            if (validityAttribute == null) {
	                validity = null;
	            } else {
	                String validityValue = (String) validityAttribute.get();
	                try {
	                	GeneralizedTime generalizedTime = new GeneralizedTime(validityValue);
	                    validity = generalizedTime.getDate();
	                } catch (ParseException e) {
	                    validity = null;
	                }
	            }
	
	            // Check validity date
	            if (validity == null) {
	                result = true;
	            } else {
	                result = validity.after(new Date());
	            }
            }
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
