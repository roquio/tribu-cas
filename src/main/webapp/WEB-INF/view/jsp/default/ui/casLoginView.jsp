<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%@ page contentType="text/html; charset=UTF-8" %>


<jsp:directive.include file="includes/top.jsp" />

<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-md-offset-3 col-mg-6 col-lg-offset-4 col-lg-4">
        <p class="text-muted"><spring:message code="screen.welcome.security" /></p>
    
        <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
            <form:errors path="*" cssClass="errors" id="status" element="div" />
            <div class="panel panel-default">
                <div class="panel-heading"><spring:message code="screen.welcome.instructions" /></div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="username"><spring:message code="screen.welcome.label.netid" /></label>
                        <c:if test="${not empty sessionScope.openIdLocalId}">
                        <strong>${sessionScope.openIdLocalId}</strong>
                        <input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
                        </c:if>
    
                        <c:if test="${empty sessionScope.openIdLocalId}">
                        <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                        <form:input cssClass="form-control required" cssErrorClass="error" id="username" size="20" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" />
                        </c:if>
                    </div>
                    
                    <div class="form-group">
                        <label for="password"><spring:message code="screen.welcome.label.password" /></label>
                        <%--
                        NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
                        "autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
                        information, see the following web page:
                        http://www.geocities.com/technofundo/tech/web/ie_autocomplete.html
                        --%>
                        <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
                        <form:password cssClass="form-control required" cssErrorClass="error" id="password" size="20" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                    </div>
                    
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
                                <spring:message code="screen.welcome.label.warn" />
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="hidden" name="lt" value="${flowExecutionKey}" />
                        <input type="hidden" name="_eventId" value="submit" />
    
                        <input class="btn btn-primary" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                        <input class="btn btn-default" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                    </div>
                </div>
            </div>
        </form:form>
        
        <c:if test="${forums}">
            <c:url value="${cnsPublicUrl}/login" var="url">
                <c:param name="cns" value="true" />
                <c:param name="service" value="${service}" />
            </c:url>
        
            <p>
                <a href="${url}" class="btn btn-link">Membre du CNS&nbsp;? Cliquez ici pour vous authentifier</a>
            </p>
        </c:if>
    </div>
</div>
         
<jsp:directive.include file="includes/bottom.jsp" />
