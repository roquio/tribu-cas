<jsp:directive.include file="includes/top.jsp"/>


<c:if test="${not pageContext.request.secure}">
    <div id="msg" class="alert alert-danger">
        <h2><spring:message code="screen.nonsecure.title"/></h2>
        <p><spring:message code="screen.nonsecure.message"/></p>
    </div>
</c:if>

<div id="cookiesDisabled" class="alert alert-danger" style="display:none;">
    <h2><spring:message code="screen.cookies.disabled.title"/></h2>
    <p><spring:message code="screen.cookies.disabled.message"/></p>
</div>


<c:out value="${portalLinks.registerUrl}"/>


<h2><spring:message code="screen.welcome.instructions"/></h2>


<div class="card mb-3">
    <div class="card-body">
        <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true" role="form">
            <input type="hidden" name="lt" value="${loginTicket}"/>
            <input type="hidden" name="execution" value="${flowExecutionKey}"/>
            <input type="hidden" name="_eventId" value="submit"/>

            <form:errors path="*" cssClass="alert alert-danger" id="status" element="div" />

            <spring:bind path="username">
                <div class="mb-3">
                    <form:label path="username" cssClass="form-label" cssErrorClass="form-label is-invalid">
                        <span><spring:message code="screen.welcome.label.netid"/></span>
                    </form:label>
                    <c:choose>
                        <c:when test="${empty sessionScope.openIdLocalId}">
                            <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey"/>
                            <form:input path="username" cssClass="form-control" cssErrorClass="form-control is-invalid"
                                        tabindex="1" accesskey="${userNameAccessKey}" autocomplete="false"
                                        htmlEscape="true"/>
                        </c:when>

                        <c:otherwise>
                            <div class="form-control-plaintext">${sessionScope.openIdLocalId}</div>
                            <input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}"/>
                        </c:otherwise>
                    </c:choose>
                    <form:errors path="username" cssClass="invalid-feedback"/>
                </div>
            </spring:bind>

            <spring:bind path="password">
                <div class="mb-3">
                    <form:label path="password" cssClass="form-label" cssErrorClass="form-label is-invalid">
                        <span><spring:message code="screen.welcome.label.password"/></span>
                    </form:label>
                    <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey"/>
                    <form:password path="password" cssClass="form-control" cssErrorClass="form-control is-invalid" tabindex="2" accesskey="${passwordAccessKey}"
                                   htmlEscape="true" autocomplete="off"/>
                    <form:errors path="password" cssClass="invalid-feedback"/>
                </div>
            </spring:bind>

            <div class="d-flex gap-3 mb-3">
                <button type="submit" name="submit" class="btn btn-primary" accesskey="l" tabindex="4">
                    <span><spring:message code="screen.welcome.button.login"/></span>
                </button>
                <button type="reset" name="reset" class="btn btn-secondary" accesskey="c" tabindex="5">
                    <span><spring:message code="screen.welcome.button.clear" /></span>
                </button>
            </div>

            <div class="d-flex gap-3">
                <a class="link" href="${selectorForm.pwmReinitAccountUrl}" target="_blank">
                    <span><spring:message code="screen.choose.reiniAccount"/></span>
                </a>

                <a class="link" href="${selectorForm.pwmCreateAccountUrl}" target="_blank">
                    <span><spring:message code="screen.choose.createAccount"/></span>
                </a>

                <a class="link" href="${selectorForm.pwmReactivateAccountUrl}" target="_blank">
                    <span><spring:message code="screen.choose.reactivateAccount"/></span>
                </a>
            </div>
        </form:form>
    </div>
</div>


<div>
    <a class="btn btn-secondary" href="javascript:history.back()">
        <span><spring:message code="screen.welcome.button.back"/></span>
    </a>
</div>


<jsp:directive.include file="includes/bottom.jsp"/>
