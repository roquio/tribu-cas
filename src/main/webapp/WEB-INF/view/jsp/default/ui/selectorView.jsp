<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<%@ page pageEncoding="UTF-8" isELIgnored="false" %>

<c:url value="/login" var="localUrl">
    <c:param name="s" value="local" />
    <c:param name="service" value="${service}" />
</c:url>


<jsp:directive.include file="includes/top.jsp" />

<div class="clearfix">
</div>
<div id="maintenance" class="alert bg-warning">
    <h2 class="text-warning">Maintenance du 30 juillet</h2>
    <p>Une intervention est en cours sur la plateforme Tribu.
    <br />En cas de difficultés, veuillez renouveler votre tentative de connexion ultérieurement.</p>
</div>



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
		        <p class="text-muted"><strong><spring:message code="screen.choose.useraca" /></strong></p>    
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
