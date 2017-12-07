<!DOCTYPE html>
<%@ page session="true"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.net.URL"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<spring:message code="application.title" var="title" />

<c:set var="brand">OSIVIA</c:set>

<c:set var="service" value="${param['service']}" />


<html>

<head>
<meta charset="UTF-8">

<title>${title}</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="icon" href="<c:url value="/img/favicon.png" />" />
<link rel="stylesheet" href="<c:url value="/css/osivia.min.css" />" />
<link rel="stylesheet" href="<c:url value="/css/glyphicons.min.css" />" />
<link rel="stylesheet" href="<c:url value="/css/demo.min.css" />" />

</head>


<body class="editorial">
    <!-- Toolbar -->
    <div class="toolbar">
        <nav class="navbar navbar-default navbar-fixed-top">
            <h2 class="sr-only">Barre d'outils</h2>

            <div class="container-fluid">
                <div class="navbar-header">
                    <div class="visible-xs">
                        <!-- Title -->
                        <div class="clearfix">
                            <p class="navbar-text text-overflow">${title}</p>
                        </div>
                    </div>

                    <!-- Brand -->
                    <a href="${service}" class="navbar-brand hidden-xs"> 
                        <img alt="${brand}" src="<c:url value="/img/favicon.png" />">
                    </a>
                </div>
            </div>
        </nav>
    </div>

    
    <!-- Header -->
    <header class="hidden-xs">
        <div class="container">
            <!-- Title -->
            <div class="jumbotron">
                <h1 class="text-center">${title}</h1>
            </div>
        </div>
    </header>


    <!-- Main -->
    <main>
        <div class="container">
            <section>