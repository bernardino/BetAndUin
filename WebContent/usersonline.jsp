<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>


<html>
<!--
<META HTTP-EQUIV=Refresh CONTENT="1; URL=http://localhost:8080/BetAndUin/usersonline.jsp">
-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>

<script language="javascript">
	function toMessage(user){
		//parent.messages.messageinfo.sendMessage.chosen=user;
	}
	
</script>

</head>

<body>
<h1>online users</h1>

	<table>
    	<%
String[] result = ((Servlets.Client)session.getAttribute("user")).getOnlineUsers();
if(result!=null){
	for(int i=0;i<result.length;i++){
		out.println("<tr align=\"center\" width\"50\" onClick=\"toMessage(this.value)\"><td>"+result[i]+"</td></tr>");
	}
} else {
	out.println("An Error Occurred!");
}
%>
	</table>
	<br />
    <input type="button" value="REFRESH" onClick="location.reload(true);">
</body>
</html>
