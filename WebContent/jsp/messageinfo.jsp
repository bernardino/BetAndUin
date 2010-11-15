<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
</head>
<body>
<jsp:useBean id="messagebean" class="Messages.MessageBean" scope="application"/>
<jsp:useBean id="infoBean" class="Messages.InfoBean" scope="request"/>
<jsp:setProperty name="infoBean" property="*"/>
<%
	Servlets.Client user = (Servlets.Client) session.getAttribute("user");

	if (user != null && infoBean.getMessage() != null)
	{
		/*TODO 3 use messagebean.setMessage(...) to set a message that includes*/
		// the users nickname and also the message sent (available at the infoBean)
		messagebean.setMessage(user.getUsername()+ " says: "+infoBean.getMessage());
	}
%>
<form name="sendMessage" action="/BetAndUin/jsp/messageinfo.jsp" method="post">
	<input type="text" name="message" id="message" size="100">
	<br>
	<select name="chosen">
		<%
		String[] result = ((Servlets.Client)session.getAttribute("user")).getOnlineUsers();
		for(int i=0;i<result.length;i++){
			out.println("<option name=\""+result[i]+"\">"+ result[i] +"</option>");
		}
		%>
	</select>
	<input type="submit" name="buttonsend" value="Send">
</form>
</body>
</html>
