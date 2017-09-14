<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page pageEncoding="UTF-8" isELIgnored="false" %>


<jsp:directive.include file="includes/top.jsp" />

<fieldset>
    <legend>Choisissez votre mode d'authentification</legend>
</fieldset>

<!-- FIM -->
<div class="panel panel-default">
    <div class="panel-body">
        <p class="h4">
            <a href="/cas/login?s=fim&amp;service=${service}">Se connecter via le portail ARENA</a>
        </p>
        <p class="text-muted">Utilisez vos identifiants acad&eacute;miques pour vous connecter.</p>
    </div>
</div>

<!-- Authentification locale -->
<div class="panel panel-default">
    <div class="panel-body">
        <p class="h4">
            <a href="/cas/login?s=local&amp;service=${service}">Se connecter via un compte externe</a>
        </p>
        <p class="text-muted">Utilisez les donn&eacute;es de connexion qui vous ont &eacute;t&eacute; transmises par le p&ocirc;le FOAD.</p>
    </div>
</div>

<jsp:directive.include file="includes/bottom.jsp" />
