/*
 * Copyright 2007 The JA-SIG Collaborative. All rights reserved. See license
 * distributed with this file and available online at
 * http://www.uportal.org/license.html
 */
package org.osivia.cas.fim;

import java.util.HashMap;
import java.util.Map;

import org.jasig.cas.authentication.principal.Credentials;
import org.jasig.cas.authentication.principal.CredentialsToPrincipalResolver;
import org.jasig.cas.authentication.principal.Principal;
import org.jasig.cas.authentication.principal.SimplePrincipal;
import org.osivia.cas.fim.FimCredentials;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Implementation of CredentialsToPrincipalResolver that converts the OpenId
 * user name to a Principal.
 * 
 * @author Scott Battaglia
 * @version $Revision: 1.1 $ $Date: 2005/08/19 18:27:17 $
 * @since 3.1
 */
public final class FimCredentialsToPrincipalResolver implements
CredentialsToPrincipalResolver {

    protected final Logger log = LoggerFactory.getLogger(this.getClass());

    

    public boolean supports(final Credentials credentials) {
        return credentials instanceof FimCredentials;
    }

    
    public final Principal resolvePrincipal(final Credentials credentials) {
        if (log.isDebugEnabled()) {
            log.debug("Attempting to resolve a principal...");
        }

        FimCredentials fimCredentials=(FimCredentials) credentials;
        
        String principalId = fimCredentials.getUsername();
        
        if (principalId == null) {
            return null;
        }
        else {
        	
        	// Login toujours en minuscule (compatibilité entre comptes manuels et comptes FIM).
        	principalId = principalId.toLowerCase();
        }
        
        if (log.isDebugEnabled()) {
            log.debug("Creating SimplePrincipal for ["
                + principalId + "]");
        }


        final Map<String, Object> convertedAttributes = new HashMap<String, Object>();
        
        convertedAttributes.putAll(fimCredentials.getAttributes());
          return new SimplePrincipal(principalId, convertedAttributes);
    }
    
    
}
