<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page pageEncoding="UTF-8" isELIgnored="false" %>


<jsp:directive.include file="includes/top.jsp" />

<p>
	<fieldset>
	    <legend>Choisissez votre mode d'authentification</legend>
	</fieldset>
</p>

<!-- FIM -->
<div class="panel panel-default">
    <div class="panel-body">
        <p class="text-muted"><strong>Je suis un utilisateur acad&eacute;mique ou de l'administration centrale.</strong></p>    
        <p class="h3">
            <a class="btn btn-primary" href="/cas/login?s=fim&amp;service=${service}">Se connecter</a>
        </p>
    </div>
</div>

<!-- Authentification locale -->
<div class="panel panel-default">
    <div class="panel-body">
    	<p class="text-muted">Je suis un utilisateur externe, je poss&egrave;de un compte de type : prenom.nom@tribu.local</p>
        <p class="h3">
            <a class="btn btn-default" href="/cas/login?s=local&amp;service=${service}">Se connecter</a>
        </p>
    </div>
</div>

<jsp:directive.include file="includes/bottom.jsp" />
