package fr.gouv.education.cns.cas.web.flow;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.BooleanUtils;
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

    /** CNS CAS public URL. */
    private final String publicUrl;


    /**
     * Constructor.
     * 
     * @param publicUrl CNS CAS public URL
     */
    public SetupAction(String publicUrl) {
        super();
        this.publicUrl = publicUrl;
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
        // Force CNS authentication indicator
        boolean cns = BooleanUtils.toBoolean(request.getParameter("cns"));
        // Service
        String service = request.getParameter("service");

        // Flow scope
        MutableAttributeMap flowScope = context.getFlowScope();

        // Forums indicator
        boolean forums = !cns && (StringUtils.contains(host, "forums") || StringUtils.contains(service, "forums"));
        flowScope.put("forums", forums);

        // CNS CAS public URL
        flowScope.put("cnsPublicUrl", this.publicUrl);

        return success();
    }

}
