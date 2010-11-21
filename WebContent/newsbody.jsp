<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Hashtable"%>
<%@page import="java.util.Enumeration" %>
<%@ page import="Servlets.SoccerReader;"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
	<h1 align="left">Top News</h1>
	<table>
		<%	
			SoccerReader reader = new SoccerReader(); 
			Hashtable<String,String> headlines = reader.latestHeadlines("Portugal", "sport");
			Enumeration<String> it = headlines.keys();
			int i=0;
			String aux = "";
			while(it.hasMoreElements()){
				out.println("<tr><td id=\""+i+"\" align=\"left\" width=\"1000\">"+headlines.get((aux=it.nextElement()))+"</td></tr>");
				i++;
			}
		%>
	</table>
<%
	String [] array = reader.recentBody(aux);
	
%>

<h1 align="left" > <%=array[0] %></h1>
<p><img src="<%=array[2]%>"/></p>
<p><%=array[1] %></p>
</body>
</html>