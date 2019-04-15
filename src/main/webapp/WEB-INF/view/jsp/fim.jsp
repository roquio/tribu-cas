<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.net.URLEncoder"%>

<%
	String serviceReport = "";
	String service = request.getParameter("service");
	if( service != null)
		serviceReport = "&service="+URLEncoder.encode(service);

%>


<%

	if( request.getHeader("ctemail") != null)	{

		String uid = request.getHeader("ctemail");
		String prenom = request.getHeader("ctfn");
		String nom = request.getHeader("ctln");
		String displayName = concat( prenom, nom);
		String cn = concat( nom, prenom);


		request.getSession().setAttribute("fim_Uid",uid );

		if( nom != null)
			request.getSession().setAttribute("fim_attr_sn", nom);

		if( displayName != null)
			request.getSession().setAttribute("fim_attr_displayName", displayName);

		if( cn != null)
			request.getSession().setAttribute("fim_attr_cn", cn);

		if( prenom != null)
			request.getSession().setAttribute("fim_attr_givenName", prenom);

		request.getSession().setAttribute("fim_attr_mail", uid);

		response.sendRedirect("/cas/login?fim=true"+ serviceReport);
	}	else	{
%>

	Authentification impossible

<%

	}

%>





<%!
private String concat(String s1, String s2)   {

	String res = "";
	
	if( s1 != null)
		res += s1;

	if( s2 != null)	{
		if( s1.length() > 0)
			res += " ";
		res += s2;
	}

	if( res.length() == 0)
		res = null;

	return res;
}


%>
