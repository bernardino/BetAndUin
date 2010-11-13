<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="Servlets.Client;"%>

<jsp:include page="jsp/auth_verification.jsp"></jsp:include>

<html>

<frameset rows="75%,30%">
  <frame src="/BetAndUin/jsp/messageboard.jsp">
  <frame src="/BetAndUin/jsp/messageinfo.jsp">
</frameset>


</html>