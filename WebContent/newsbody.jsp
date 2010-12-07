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
	<script type="text/javascript" src="comet.js"> </script>
</head>

<body>
	<%	
		SoccerReader reader = new SoccerReader(); 
		Hashtable<String,String> headlines = reader.latestHeadlines("Benfica", "sport");
		Enumeration<String> it = headlines.keys();
		String aux = "";
		int i = 0;
		while(it.hasMoreElements()){
			aux=it.nextElement();
			String [] array = reader.recentBody(aux);
			%>
		<div id="<%=i%> news" style="display:none">
			<h1 align="center" class="headline"> <%=array[0] %></h1>
			<p align="center"><img src="<%=array[2]%>"/></p>
			<p align="left" class="content"><%=array[1] %></p>
			<a align="left" class ="content" href=<%=array[3] %> target="_blank">Go to source</a>
		</div>
			<%
			i++;
		}		
		
	%>
	<br></br>
	<%/* TODO: Present errors in the news page if theguardian.uk not available */ %>
	<h1 align="left" class="top">Top News</h1>
		<table>
		<%
			it = headlines.keys();
			i =0;
			while(it.hasMoreElements()){
				out.println("<tr><td id=\""+i+"\" onclick=\"showContent(this.id)\" align=\"left\" width=\"1000\">"+headlines.get((aux=it.nextElement()))+"</td></tr>");
				i++;
			}
		%>
		</table>
</body>
<script type="text/javascript">
	//Initiate Comet object
	var comet = Comet("http://localhost:8080/BetAndUin/");
	var i=0;
	comet.get("Messages?type=register", function(response) {
    	// updates the message board with the new response.
    	var msg = new Array();
    	msg = response.split("<br/>");
    	
    	alert(msg[i]);
    	i++;
    });
	
	function showContent(id){
		var i = 0;
		for(i;i<10;i++){
			document.getElementById(i+" news").style.display='none';
		}
		document.getElementById(id+" news").style.display='inherit';
			
	}
</script>
</html>