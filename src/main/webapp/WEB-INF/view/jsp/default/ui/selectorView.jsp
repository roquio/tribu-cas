<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<%@ page pageEncoding="UTF-8" isELIgnored="false" %>

<c:url value="/login" var="localUrl">
    <c:param name="s" value="local" />
    <c:param name="service" value="${service}" />
</c:url>


<jsp:directive.include file="includes/top.jsp" />


<p>
	<fieldset>
	    <legend><spring:message code="screen.choose.title" /></legend>
	</fieldset>
</p>

<div class="row">

	<div class="col-lg-6">
		<!-- FIM aca -->
		<div class="panel panel-default">
		    <div class="panel-body">
		        <p class="text-muted"><strong><spring:message code="screen.choose.useraca" /></strong>
		        	<br />&nbsp;</p>    
		        <p class="h3">
		            <a class="btn btn-primary" href="${selectorForm.acaUrl}"><spring:message code="screen.choose.connect" /></a>
		        </p>
		    </div>
		</div>
	</div>
	<div class="col-lg-2">
	
	</div>
	<div class="col-lg-6">
		<!-- FIM sup -->
		<div class="panel panel-default">
		    <div class="panel-body">
		        <p class="text-muted"><strong><spring:message code="screen.choose.usersup" /></strong></p>    
		        <p class="h3">
		            <a class="btn btn-primary" href="${selectorForm.supUrl}"><spring:message code="screen.choose.connect" /></a>
		        </p>
		    </div>
		</div>
	</div>
</div>


<!-- Authentification locale -->
<div class="panel panel-default">
    <div class="panel-body">
    	<p class="text-muted"><spring:message code="screen.choose.userlocal" /></p>
        <p class="h3">
            <a class="btn btn-default" href="${localUrl}"><spring:message code="screen.choose.connect" /></a>
        </p>
    </div>
</div>

<jsp:directive.include file="includes/bottom.jsp" />
