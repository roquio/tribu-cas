/*
 * Copyright 2007 The JA-SIG Collaborative. All rights reserved. See license
 * distributed with this file and available online at
 * http://www.uportal.org/license.html
 */
package org.osivia.cas.fim;

import java.util.Map;

import org.jasig.cas.authentication.principal.Credentials;

/**
 * 
 * @author Scott Battaglia
 * @version $Revision: 1.1 $ $Date: 2005/08/19 18:27:17 $
 * @since 3.1
 *
 */
public final class FimCredentials implements Credentials {

    /**
     * Unique Id for Serialization
     */
    private static final long serialVersionUID = -6535869729412406133L;


    private final String username;
    private final Map<String, Object> attributes;    
    

    
    public Map<String, Object> getAttributes() {
        return attributes;
    }


    public FimCredentials( final String username, Map<String, Object> attributes) {

        this.username = username;
        this.attributes = attributes;
    }
    

    public String getUsername() {
        return this.username;
    }
    
    public String toString() {
        return "username: " + this.username;
    }
    
}
