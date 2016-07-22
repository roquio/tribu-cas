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


    @Override
    protected Credentials constructCredentialsFromRequest(final RequestContext context) {

        String userName = "demo";

//        final String ticketGrantingTicketId = WebUtils.getTicketGrantingTicketId(context);
//        final Service service = WebUtils.getService(context);


        // context.getExternalContext().getSessionMap().put("openIdLocalId", userName);

        // clear the service because otherwise we can fake the username
        // if (service instanceof OpenIdService && userName == null) {
        // context.getFlowScope().remove("service");
        // }

        // if (ticketGrantingTicketId == null || userName == null) {
        // return null;
        // }

        Map<String, Object> attributes = new HashMap<String, Object>();
        
        String name = (String) context.getExternalContext().getSessionMap().get("fim_name");
        
        attributes.put("name", name);

        return new FimCredentials(userName, attributes);
    }

}
