<%@page import="Servlets.Client"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>


<html>
<!--
<META HTTP-EQUIV=Refresh CONTENT="1; URL=http://localhost:8080/BetAndUin/usersonline.jsp">
-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>

<script language="javascript">
	function toMessage(id){
		var user = document.getElementById(id).innerHTML;
		parent.messages.document.getElementById("destination").value=user;
	}
	
</script>

</head>

<body style="background-color:#eee;">
	<h2 align="center" style="font-family:Tahoma, Geneva, sans-serif;font-size:25px;" >online users</h2>
		<table>
	    	<% 
	    	String[] result = null;
	    	try{
	    		Client user = (Client)session.getAttribute("user");
	    		result = user.getOnlineUsers();
	    	} catch(Exception e){
	    		result=null;
	    	}
	
	if(result!=null){
		for(int i=0;i<result.length;i++){%>
			<tr><td id="<%=i%>" style="cursor:pointer;" align="center" width="100" onClick="toMessage(this.id)"><%=result[i] %></td></tr>
		<% }
	} else {
		out.println("An Error Occurred!");
	}
	%>
		</table>
		<br />
   		<input type="button" value="REFRESH" onClick="location.reload(true);">
</body>
</html>
