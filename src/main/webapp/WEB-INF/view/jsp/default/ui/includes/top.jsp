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

<title>Authentification - Tribu</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="application-name" content="Tribu">
<meta http-equiv="default-style" content="FOAD">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="icon" href="<c:url value="/img/favicon.ico" />" />
<link rel="stylesheet" href="<c:url value="/css/osivia.min.css" />" />
<link rel="stylesheet" href="<c:url value="/css/foad.min.css" />" title="FOAD" />
</head>


<body class="fixed-layout">
    <!-- Toolbar -->
    <div class="toolbar">
        <nav class="navbar navbar-default navbar-fixed-top">
            <h2 class="sr-only">Barre d'outils</h2>

            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- Brand -->
                    <a href="#" class="navbar-brand">
                        <img src="<c:url value="/img/logo-tribu.png" />" alt="Tribu">
                    </a>
                </div>
            </div>
        </nav>
    </div>
    
    <!-- Header -->
    <header class="banner hidden-xs">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <!-- Logo -->
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="logo">
                                <!-- FOAD -->
                                <img src="<c:url value="/img/logo-foad.png" />" alt="FOAD, Formation Ouverte &Agrave; Distance">

                                <!-- Ministère -->
                                <img src="<c:url value="/img/logo-ministere.png" />" alt="Minist&egrave;re de l'&eacute;ducation Nationale, de l'Enseignement sup&eacute;rieur et de la Recherche">
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <h1 class="logo">
                                <a href="#"> 
                                    <img src="<c:url value="/img/logo-tribu.png" />" alt="Tribu">
                                </a>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="background-fading"></div>
    </header>
    
    <main>
        <div class="container scrollbox">