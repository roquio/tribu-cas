<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.net.URLEncoder"%>



<%
	String serviceReport = "";
	String service = (String) request.getAttribute("originalUrl");
	if( service != null)
		serviceReport = "?service="+URLEncoder.encode(service);

	String chooseReport = serviceReport;
	if( chooseReport.length() == 0)
		chooseReport += "?";
	else
		chooseReport += "&";

	chooseReport += "choose=false";
%>


choisissez :

<a href="fim<%=serviceReport%>">fim</a>
<a href="login<%=chooseReport%>">local</a>