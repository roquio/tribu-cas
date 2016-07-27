/*
 * Copyright 2007 The JA-SIG Collaborative. All rights reserved. See license
 * distributed with this file and available online at
 * http://www.uportal.org/license.html
 */
package org.osivia.cas.fim;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasig.cas.authentication.principal.Credentials;
import org.jasig.cas.authentication.principal.Service;

import org.jasig.cas.web.flow.AbstractNonInteractiveCredentialsAction;
import org.jasig.cas.web.support.WebUtils;
import org.springframework.webflow.execution.RequestContext;


public final class FimSingleSignOnAction extends AbstractNonInteractiveCredentialsAction {

    private String FIM_PREFIX = "fim_attr_";

    @Override
    protected Credentials constructCredentialsFromRequest(final RequestContext context) {


        Map<String, Object> attributes = new HashMap<String, Object>();

        String userId = (String) context.getExternalContext().getSessionMap().get("fim_Uid");


        Map<String, Object> sessionMap = context.getExternalContext().getSessionMap().asMap();
        for (String key : sessionMap.keySet()) {
            if (key.startsWith(FIM_PREFIX)) {
                String name = key.substring(FIM_PREFIX.length());
                String value = (String) context.getExternalContext().getSessionMap().get(key);
                attributes.put(name, value);
            }

        }


        return new FimCredentials(userId, attributes);
    }
}
