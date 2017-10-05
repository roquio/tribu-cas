package fr.gouv.education.cns.cas.web.flow;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.jasig.cas.web.support.WebUtils;
import org.springframework.webflow.action.AbstractAction;
import org.springframework.webflow.core.collection.MutableAttributeMap;
import org.springframework.webflow.execution.Event;
import org.springframework.webflow.execution.RequestContext;

/**
 * CNS setup action.
 * 
 * @author Cédric Krommenhoek
 * @see AbstractAction
 */
public class SetupAction extends AbstractAction {

    /**
     * Constructor.
     */
    public SetupAction() {
        super();
    }


    /**
     * {@inheritDoc}
     */
    @Override
    protected Event doExecute(RequestContext context) throws Exception {
        // HTTP servlet request
        HttpServletRequest request = WebUtils.getHttpServletRequest(context);
        // Host
        String host = request.getHeader("x-forwarded-host");

        // Flow scope
        MutableAttributeMap flowScope = context.getFlowScope();

        flowScope.put("forums", StringUtils.contains(host, "forums"));

        return success();
    }

}
