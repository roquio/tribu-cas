<jsp:directive.include file="includes/top.jsp" />

<c:if test="${not pageContext.request.secure}">
    <div id="msg" class="errors">
        <h2><spring:message code="screen.nonsecure.title" /></h2>
        <p><spring:message code="screen.nonsecure.message" /></p>
    </div>
</c:if>

<div id="cookiesDisabled" class="errors" style="display:none;">
    <h2><spring:message code="screen.cookies.disabled.title" /></h2>
    <p><spring:message code="screen.cookies.disabled.message" /></p>
</div>


<c:out value="${portalLinks.registerUrl}"></c:out>


<!-- Content header -->
<div class="content-header-container">
    <div class="content-header-navbar">
        <h2 class="content-title"><spring:message code="screen.welcome.instructions" /></h2>
    </div>
</div>


<div class="tiles">
    <div class="panel panel-default">
        <div class="panel-body">
            <form:form method="post" id="fm1" cssClass="form-horizontal" commandName="${commandName}" htmlEscape="true" role="form">
                <form:errors path="*" cssClass="alert alert-danger" id="status" element="div" />
                
                <div class="clearfix" id="login">
                    <spring:bind path="username">
                        <div class="form-group required ${status.error ? 'has-error has-feedback' : ''}">
                            <form:label path="username" cssClass="col-sm-3 col-lg-2 control-label"><spring:message code="screen.welcome.label.netid" /></form:label>
                            
                            <div class="col-sm-9 col-lg-10">
                                <c:if test="${not empty sessionScope.openIdLocalId}">
                                    <strong>${sessionScope.openIdLocalId}</strong>
                                    <input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
                                </c:if>
                    
                                <c:if test="${empty sessionScope.openIdLocalId}">
                                    <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                                    <form:input cssClass="form-control" id="username" size="20" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" />
                                </c:if>
                                
                                <form:errors path="username" cssClass="help-block" />
                            </div>
                        </div>
                    </spring:bind>
                    
                    <spring:bind path="password">
                        <div class="form-group required ${status.error ? 'has-error has-feedback' : ''}">
                            <form:label path="password" cssClass="col-sm-3 col-lg-2 control-label"><spring:message code="screen.welcome.label.password" /></form:label>
                            <%--
                            NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
                            "autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
                            information, see the following web page:
                            http://www.geocities.com/technofundo/tech/web/ie_autocomplete.html
                            --%>
                            <div class="col-sm-9 col-lg-10">
                                <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
                                <form:password cssClass="form-control" id="password" size="20" tabindex="2" path="password" accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                                <form:errors path="password" cssClass="help-block" />
                            </div>
                        </div>
                    </spring:bind>
                    
                    <div class="form-group">
                        <input type="hidden" name="lt" value="${loginTicket}" />
                        <input type="hidden" name="execution" value="${flowExecutionKey}" />
                        <input type="hidden" name="_eventId" value="submit" />
                        
                        <div class="col-sm-offset-3 col-sm-9 col-lg-offset-2 col-lg-10">
                            <input class="btn btn-primary" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                            <input class="btn btn-default" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                        </div>
                    </div>

                    <div>


                    </div>

                    <div class="col-sm-offset-3 col-sm-9 col-lg-offset-2 col-lg-10">
                        <a class="btn btn-link" href="${selectorForm.pwmReinitAccountUrl}"  target="_blank">
                            <span><spring:message code="screen.choose.reiniAccount" /></span>
                        </a>
                        <a class="btn btn-link" href="${selectorForm.pwmCreateAccountUrl}"  target="_blank">
                            <span><spring:message code="screen.choose.createAccount" /></span>
                        </a>
                        <a class="btn btn-link" href="${selectorForm.pwmReactivateAccountUrl}"  target="_blank">
                            <span><spring:message code="screen.choose.reactivateAccount" /></span>
                        </a>
                    </div>
                </div>
            </form:form>

        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <a class="btn btn-default" href="javascript:history.back()">
                <span><spring:message code="screen.welcome.button.back" /></span>
            </a>
        </div>
    </div>
</div>


<jsp:directive.include file="includes/bottom.jsp" />
