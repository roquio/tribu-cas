<%@ page language="java"  session="false" %>
<%
String url = request.getContextPath() + "/login" ;

if (request.getParameter("service") != null) {
	url += "?service="+request.getParameter("service");
}

response.sendRedirect(response.encodeURL(url));%>
