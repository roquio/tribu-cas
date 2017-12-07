<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

<%@ page contentType="text/html; charset=UTF-8"%>


<jsp:directive.include file="includes/top.jsp" />

<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-md-offset-3 col-mg-6 col-lg-offset-4 col-lg-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <form:form method="post" commandName="${commandName}" htmlEscape="true">
                    <fieldset>
                        <legend><spring:message code="screen.welcome.instructions" /></legend>
                    
                        <form:errors path="*" cssClass="alert alert-danger" element="div" />
                    
                        <!-- Username -->
                        <spring:bind path="username">
                            <div class="form-group required ${status.error ? 'has-error has-feedback' : ''}">
                                <form:label path="username" cssClass="control-label"><spring:message code="screen.welcome.label.netid" /></form:label>
                                <c:choose>
                                    <c:when test="${empty sessionScope.openIdLocalId}">
                                        <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                                        <form:input path="username" cssClass="form-control" tabindex="1" accesskey="${userNameAccessKey}" autocomplete="false" htmlEscape="true" />
                                        <c:if test="${status.error}">
                                            <span class="form-control-feedback">
                                                <i class="glyphicons glyphicons-remove"></i>
                                            </span>
                                        </c:if>
                                        <form:errors path="username" cssClass="help-block"/>
                                    </c:when>
                                    
                                    <c:otherwise>
                                        <p class="form-control-static">
                                            <strong>${sessionScope.openIdLocalId}</strong>
                                        </p>
                                        
                                        <input type="hidden" name="username" value="${sessionScope.openIdLocalId}" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </spring:bind>
                        
                        <!-- Password -->
                        <spring:bind path="password">
                            <div class="form-group required ${status.error ? 'has-error has-feedback' : ''}">
                                <form:label path="password" cssClass="control-label"><spring:message code="screen.welcome.label.password" /></form:label>
                                <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
                                <form:password path="password" cssClass="form-control" tabindex="2" accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                                <c:if test="${status.error}">
                                    <span class="form-control-feedback">
                                        <i class="glyphicons glyphicons-remove"></i>
                                    </span>
                                </c:if>
                                <form:errors path="password" cssClass="help-block"/>
                            </div>
                        </spring:bind>
                        
                        
                        <!-- Buttons -->
                        <div class="form-group">
                            <input type="hidden" name="lt" value="${flowExecutionKey}" />
                            <input type="hidden" name="_eventId" value="submit" />
                            
                            <input type="submit" name="submit" value="<spring:message code="screen.welcome.button.login" />" class="btn btn-primary" accesskey="l" tabindex="4"  />
                            <input type="reset" name="reset" value="<spring:message code="screen.welcome.button.clear" />" class="btn btn-link" accesskey="c" tabindex="5" />
                        </div>
                    </fieldset>
                </form:form>
            </div>
        </div>
    </div>
</div>


<!-- Security message -->
<p class="text-center text-muted"><spring:message code="screen.welcome.security" /></p>


<jsp:directive.include file="includes/bottom.jsp" />
