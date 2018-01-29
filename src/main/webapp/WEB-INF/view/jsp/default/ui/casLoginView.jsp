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

<c:out value="${portalLinks.registerUrl}"></c:out>

<form:form method="post" id="fm1" cssClass="form-horizontal" commandName="${commandName}" htmlEscape="true" role="form">
    <form:errors path="*" cssClass="alert alert-danger" id="status" element="div" />
    
    <div class="clearfix" id="login">
        <fieldset>
            <legend>
                <spring:message code="screen.welcome.instructions" />
            </legend>
            
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
                <input type="hidden" name="lt" value="${flowExecutionKey}" />
                <input type="hidden" name="_eventId" value="submit" />
                
                <div class="col-sm-offset-3 col-sm-9 col-lg-offset-2 col-lg-10">
                    <input class="btn btn-primary" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                    <input class="btn btn-default" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                </div>
            </div>
        </fieldset>
    </div>
</form:form>

<div class="row">
    <div class="col-sm-offset-3 col-sm-9 col-lg-offset-2 col-lg-10">
        <a onclick="history.back()">Retour</a>
    </div>
</div>

<jsp:directive.include file="includes/bottom.jsp" />
