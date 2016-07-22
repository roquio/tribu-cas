<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

ACCES FIM

<%
	String serviceReport = "";
	String service = request.getParameter("service");
	if( service != null)
		serviceReport = "&service="+service;

%>


<%
	// Récupération header et copie en session
	// puis redirection vers cas

	request.getSession().setAttribute("fim_id","demo");
	request.getSession().setAttribute("fim_name","fim name");

	response.sendRedirect("/cas/login?fim=true"+ serviceReport);

%>



