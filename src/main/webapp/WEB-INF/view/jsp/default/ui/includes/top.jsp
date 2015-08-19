<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="java.net.URL"%>
<%@ page session="true"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<spring:theme code="mobile.custom.css.file" var="mobileCss" text="" />

<%
	String baseUrl = "http://".concat(request.getServerName()); // Par défaut, retour au root du domaine associé à CAS
	if(request.getParameter("service") != null) {
	    // Si possible utiliser le service en paramètre
		URL serviceUrl = new URL(request.getParameter("service"));
		baseUrl = serviceUrl.getProtocol().concat("://").concat(serviceUrl.getHost());
	}
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="fr">



<head>
	<title>Authentification</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <link rel="stylesheet" href="<c:url value="/css/proto-cns.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/css/tiles.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/css/theme-default.min.css" />" />
    <link rel="stylesheet" href="<c:url value="/css/osivia.min.css"/>" />
    <link rel="stylesheet" href="<c:url value="/css/glyphicons-halflings.css"/>" />

	<link rel="stylesheet" href="<c:url value="/css/cas.css"/>" />

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<c:url value="/js/cas.js" />"></script>
	<link rel="icon" href="<c:url value="/css/images/favicon.ico" />"
		type="image/x-icon" />

</head>

<body id="cas">


	
	
	<div class="toolbar">
	    <div class="navbar navbar-default navbar-fixed-top">
	        <div class="container-fluid">
	            <div class="navbar-header">
	                <div class="visible-xs">
	                    <!-- Menu -->
	                    <button type="button" onclick="toggleDrawer()" data-toggle="drawer" class="btn btn-link navbar-btn pull-left">
	                        <span>
	                            <i class="halflings halflings-menu-hamburger"></i>
	                            <i class="halflings halflings-arrow-right"></i>
	                        </span>
	                    </button>
	                    
	                    <!-- State items -->
	                    
	
	                    <!-- Title -->
	                    <div class="clearfix">
	                        <p class="navbar-text text-overflow">Connexion</p>
	                    </div>
	                </div>
	                
	                
	                <!-- Brand -->
	                <a href="#" class="navbar-brand hidden-xs">OSIVIA</a>
	            </div>
	        </div>
	    </div>
	</div>
	
	
	<header class="container-fluid hidden-xs">
	    <!-- Banner -->
		<div class="banner clearfix">
			<!-- Logo -->
			<div class="logo">
				<div id="logo">
					<div class="">
	
						<div class="pull-left">
							<h1 class="h3">
								<a href="<%=baseUrl%>"> <img
									src="<c:url value="/images/logo_MENESR.png" />"
									alt="Centre National de Services" /> <span>Portail
											documentaire du CNS</span></a>
							</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Onglets -->
	    <div id="tabs">
	    	<div class="">
	
				<!-- Fixed nav -->
				
				<nav class="tabs tabs-default" role="navigation">
				    <!-- Title -->
				    <h2 class="hidden">Onglets de navigation</h2>
				    
				    
				    <!-- Home -->
				    
				    
				    
				    <!-- Tabs -->
				    <div class="fixed-tabs-container">
				        <ul class="">
				            
				        </ul>
				    </div>
				</nav>
			</div>
		</div>
	</header>
	
	
	
	<div class="wrapper-outer">
		<div class="wrapper-inner">
		    <div id="page-content" class="container-fluid">
		        <!-- Content navbar -->
		            
		
		
				<div class="content-navbar">
				    <!-- Breadcrumb -->
				    <div class="content-navbar-breadcrumb">
				        <div id="breadcrumb">
				        	<div class="">
				
								<nav>
								    <h2 class="hidden">Fil d'Ariane</h2>
								    <ol class="breadcrumb hidden-xs">
								        
								            <li>
								                <a href="#">Authentification</a>
								            </li>
								        
								    </ol>
								</nav>
							</div>
						</div>
					</div>
		
				</div>
	
