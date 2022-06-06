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


<html lang="fr">

<head>
<meta charset="UTF-8">

<title>Authentification - Tribu</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="application-name" content="Tribu">
<meta http-equiv="default-style" content="FOAD">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="icon" href="<c:url value="/img/favicon.ico" />" />
<link rel="stylesheet" href="<c:url value="/css/cas.css" />" />
<link rel="stylesheet" href="<c:url value="/css/osivia.min.css" />" />
<link rel="stylesheet" href="<c:url value="/css/foad.min.css" />" title="FOAD" />
</head>


<body>
    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <!-- Logo EN -->
                    <div class="logo-en hidden-xs">
                        <img src="<c:url value="/img/logo-en.png" />" alt="Minist&egrave;re de l'&Eacute;ducation nationale et de la jeunesse">
                    </div>
                </div>

                <div class="col"></div>
            </div>

            <div class="row hidden-xs">
                <div class="col"></div>

                <div class="col">
                    <div class="dots">
                        <span class="dot-blue"></span>
                        <span class="dot-green"></span>
                        <span class="dot-yellow"></span>
                        <span class="dot-orange"></span>
                        <span class="dot-pink"></span>
                        <span class="dot-violet"></span>
                    </div>
                </div>
            </div>

            <!-- Logo Tribu large -->
            <h1 class="logo-tribu-large">
                <img src="<c:url value="/img/logo-tribu-large.png" />" alt="Tribu">
            </h1>
        </div>
    </header>
    
    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-offset-1 col-sm-10 col-lg-offset-2 col-lg-8">