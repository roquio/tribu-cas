<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>


<%
	String serviceReport = "";
	String service = request.getParameter("service");
	if( service != null)
		serviceReport = "&service="+service;

%>


<%
	// Récupération header et copie en session
	// puis redirection vers cas

	String uid = "demo2";

	request.getSession().setAttribute("fim_Uid",uid );
	request.getSession().setAttribute("fim_attr_sn",uid + "Sn");
	request.getSession().setAttribute("fim_attr_cn",uid + "Cn");
	request.getSession().setAttribute("fim_attr_displayName",uid + "displayName");
	request.getSession().setAttribute("fim_attr_mail",uid + ".mail@osivia.com");

	response.sendRedirect("/cas/login?fim=true"+ serviceReport);

%>



