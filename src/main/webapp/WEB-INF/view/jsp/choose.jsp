<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
	String serviceReport = "";
	String service = request.getParameter("service");
	if( service != null)
		serviceReport = "?service="+service;

	String chooseReport = serviceReport;
	if( chooseReport.length() == 0)
		chooseReport += "?";
	else
		chooseReport += "&";

	chooseReport += "choose=false";

%>


choisissez ..

<a href="fim<%=serviceReport%>">fim</a>
<a href="login<%=chooseReport%>">local</a>
