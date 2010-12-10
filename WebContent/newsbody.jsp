<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Hashtable"%>
<%@page import="java.util.Enumeration" %>
<%@ page import="Servlets.SoccerReader;"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>BetAndUin News</title>
	<link rel="stylesheet" type="text/css" href="css/news.css" />
	<script type="text/javascript" src="comet.js"> </script>
</head>

	<% 
	SoccerReader reader = new SoccerReader(); 
	String [][] headlines = reader.latestHeadlines("Benfica","football");
	%>

<body>
	<%	
		
		if(headlines==null){
			%>
			<br/>
			<div align="center" style="font-family:Trebuchet MS, Arial, Helvetica, sans-serif;"> The REST API @theguardian.co.uk is not available, please try again later
			<br></br>
			<img src="images/twitter_fail_whale.png" 
				width="530" height="398"></img>
			</div>
			<%
		}
		else {
			%>
			<div style="width:55%;float:right">
			<%
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
	
	</div>
	<div style="width:40%;float:left">
		<h1 align="left" class="top">Top News</h1>
			<table class="content">
			<%
				for(i=0;i<headlines.length;i++){
					out.println("<tr><td id=\""+i+"\" onclick=\"showContent(this.id)\" align=\"left\" width=\"1000\">"+headlines[i][1]+"</td></tr>");
				}
			}
			%>
			</table>
	</div>
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
			<% if(headlines!=null){ %> 
				for(i;i<<%=headlines.length %>;i++){
					document.getElementById(i+" news").style.display='none';
				}
			<% } %>
			document.getElementById(id+" news").style.display='inherit';
				
		}
		
		function quitChat() {
			comet.post("Messages?type=exit", '', function(response) {
				// Exits browser
				window.location='about:blank';
			});
		}
		
		window.onunload = quitChat;
	</script>
</html>