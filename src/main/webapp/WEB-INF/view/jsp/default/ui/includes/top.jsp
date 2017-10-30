<!DOCTYPE html>
<%@ page session="true"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page import="java.net.URLEncoder"%>


<c:set var="service" value="${param['service']}" scope="request" />


<html>

<head>
<meta charset="UTF-8">

<title>Authentification</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="application-name" content="CNS">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="<c:url value="/js/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-ui.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/cas.js" />"></script>

<link rel="icon" href="<c:url value="/img/favicon.ico" />" />
<link rel="stylesheet" href="<c:url value="/css/osivia.min.css" />" />
<c:choose>
    <c:when test="${forums}">
        <link rel="stylesheet" href="<c:url value="/css/forums/forums.min.css" />" />
    </c:when>
    
    <c:otherwise>
        <link rel="stylesheet" href="<c:url value="/css/cns/cns.min.css" />" />
        <link rel="stylesheet" href="<c:url value="/css/cns/theme-default.min.css" />" />
    </c:otherwise>
</c:choose>

</head>


<body>
    <!-- Toolbar -->
    <div class="toolbar">
        <nav class="navbar navbar-default navbar-fixed-top">
            <h2 class="sr-only">Barre d'outils</h2>

            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- Brand -->
                    <a href="<c:url value="/" />" class="navbar-brand">
                        <c:choose>
                            <c:when test="${forums}">CNS - Forums</c:when>
                            <c:otherwise>CNS</c:otherwise>
                        </c:choose>
                    </a>
                </div>
            </div>
        </nav>
    </div>
    
    <!-- Header -->
    <c:choose>
        <c:when test="${forums}">
            <header class="jumbotron hidden-xs">
                <div class="container">
                    <p class="text-center">
                        <img src="<c:url value="/img/forums/logo-men.png" />" alt="Logo du Minit&egrave;re de l'&Eacute;ducation Nationale">
                    </p>
                
                    <h1 class="text-center">Forums du CNS</h1>
                </div>
            </header>
        </c:when>
        
        <c:otherwise>
            <header class="hidden-xs">
                <div class="container-fluid">
                    <!-- Banner -->
                    <div class="banner clearfix">
                        <!-- Logo -->
                        <div class="logo">
                            <div class="pull-left">
                                <h1 class="h3">
                                    <a href="<c:url value="/" />">
                                        <img src="<c:url value="/img/cns/logo_MENESR.png" />" alt="Centre National de Services">
                                        <span>Portail documentaire du CNS</span>
                                    </a>
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </c:otherwise>
    </c:choose>
    
    <main>
        <div class="container scrollbox">