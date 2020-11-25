<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@ page pageEncoding="UTF-8" isELIgnored="false" %>


<c:url value="/login" var="localUrl">
    <c:param name="s" value="local" />
    <c:param name="service" value="${service}" />
</c:url>


<jsp:directive.include file="includes/top.jsp" />


<!-- Content header -->
<div class="content-header-container">
    <div class="content-header-navbar">
        <h2 class="content-title"><spring:message code="screen.choose.title" /></h2>
    </div>
</div>


<div class="tiles">
    <div class="row">
    	<div class="col-md-6">
    		<!-- FIM aca -->
    		<div class="panel panel-default">
    		    <div class="panel-body">
    		        <p class="text-min-height">
                        <strong><spring:message code="screen.choose.useraca" /></strong>
                    </p>
    		        
                    <div>
    		            <a class="btn btn-primary" href="${selectorForm.acaUrl}">
                            <span><spring:message code="screen.choose.connect" /></span>
                        </a>
    		        </div>
    		    </div>
    		</div>
    	</div>
    
    	<div class="col-md-6">
    		<!-- FIM sup -->
    		<div class="panel panel-default">
    		    <div class="panel-body">
    		        <p class="text-min-height">
                        <strong><spring:message code="screen.choose.usersup" /></strong>
                    </p>
                    
    		        <div>
    		            <a class="btn btn-primary" href="${selectorForm.supUrl}">
                            <span><spring:message code="screen.choose.connect" /></span>
                        </a>
    		        </div>
    		    </div>
    		</div>
    	</div>
    </div>
    
    
    <!-- Authentification locale -->
    <div class="panel panel-default">
        <div class="panel-body">
        	<p class="text-min-height">
                <span><spring:message code="screen.choose.userlocal" /></span>
            </p>
            
            <div>
                <a class="btn btn-default" href="${localUrl}">
                    <span><spring:message code="screen.choose.connect" /></span>
                </a>
            </div>
        </div>
    </div>
</div>


<jsp:directive.include file="includes/bottom.jsp" />
