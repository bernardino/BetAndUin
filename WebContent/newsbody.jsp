<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Hashtable"%>
<%@page import="java.util.Enumeration" %>
<%@ page import="Servlets.SoccerReader;"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>BetAndUin News</title>
	<link rel="stylesheet" type="text/css" href="news.css" />
	<script language="javascript">
		function showContent(id){
			var i = 0;
			for(i;i<10;i++){
				document.getElementById(i+" news").style.display='none';
			}
			document.getElementById(id+" news").style.display='inherit';
			
		}
	
	</script>
</head>

<body>
	<%	
		SoccerReader reader = new SoccerReader(); 
		String [][] headlines = reader.latestHeadlines("Portugal","sport");
		
		if(headlines==null){
			%><p align="left"> The REST API @theguardian.co.uk is not available, please try again later</p>
			<%
		}
		else {
			int i = 0;
			for(i=0;i<headlines.length;i++){
				String [] array = reader.recentBody(headlines[i][0]);
				%>
			<div id="<%=i%> news" style="display:none">
				<h1 align="center" class="headline"> <%=array[0] %></h1>
				<p align="center"><img src="<%=array[2]%>"/></p>
				<p align="left" class="content"><%=array[1] %></p>
				<a align="left" class ="content" href=<%=array[3] %> target="_blank">Go to source</a>
			</div>
				<%
			}
		
		
	%>
	<br></br>
	<h1 align="left" class="top">Top News</h1>
		<table class="content">
		<%
			for(i=0;i<headlines.length;i++){
				out.println("<tr><td id=\""+i+"\" onclick=\"showContent(this.id)\" align=\"left\" width=\"1000\">"+headlines[i][1]+"</td></tr>");
			}
		}
		%>
		</table>
</body>
</html>