<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder"%>

<%
	String serviceReport = "";
	String service = (String) request.getAttribute("originalUrl");
	if( service != null)
		serviceReport = "?service="+URLEncoder.encode(service);

	response.sendRedirect("/cas/fim"+ serviceReport);
%>
