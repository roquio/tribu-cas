<!DOCTYPE html>

<%@ page session="true" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page import="java.net.URLEncoder" %>


<c:set var="service" value="${param['service']}" scope="request"/>


<html lang="fr">

<head>
    <meta charset="UTF-8">

    <title>Authentification - Tribu</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="application-name" content="Tribu">
    <meta http-equiv="default-style" content="FOAD">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <link rel="icon" href="<c:url value="/img/favicon.ico" />"/>
    <link rel="stylesheet" href="<c:url value="/css/cas.css" />"/>
</head>


<body>

<header>
    <nav class="navbar navbar-expand-lg">
        <div class="container-lg align-items-lg-end">
            <div class="header-brand">
                <p class="logo">
                    <span>Minist&egrave;re</span>
                    <br>
                    <span>de l&rsquo;&Eacute;ducation</span>
                    <br>
                    <span>Nationale</span>
                    <br>
                    <span>et de la Jeunesse</span>
                </p>

                <div>
                    <img src="<c:url value="/img/logo-tribu-large.png" />" alt="Tribu" class="img-fluid">
                </div>
            </div>

            <div class="collapse navbar-collapse justify-content-end">
                <div class="tribu-dots mb-2">
                    <span class="tribu-dot tribu-dot-blue"></span>
                    <span class="tribu-dot tribu-dot-green"></span>
                    <span class="tribu-dot tribu-dot-yellow"></span>
                    <span class="tribu-dot tribu-dot-orange"></span>
                    <span class="tribu-dot tribu-dot-pink"></span>
                    <span class="tribu-dot tribu-dot-violet"></span>
                </div>
            </div>
        </div>
    </nav>
</header>

<main class="d-flex">
    <div class="container-lg d-flex flex-column flex-grow-1 py-5">
