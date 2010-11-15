<%@page import="Messages.InfoBean"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<html>
<META HTTP-EQUIV=Refresh CONTENT="1; URL=http://localhost:8080/BetAndUin/jsp/messageboard.jsp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Messages</title>
</head>

<body>
<jsp:useBean id="messagebean" class="Messages.MessageBean" scope="application"/>
<br>
<%
List<String> messages = messagebean.getMessages();
for (Iterator<String> i= messages.iterator(); i.hasNext();)
{
	out.println(i.next());
	out.println("<br>");
}
%>
</body>
</html>
