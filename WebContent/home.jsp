<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>

<jsp:include page="jsp/auth_home.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>BetAndUin - Home</title>
	<frameset rows="10%,*" border="0" >
		<frame src="menu.jsp" name="menu" noresize scrolling=no />
		<frameset cols="45%,40%,15%" border="0">
			<frame src="bets.jsp" name="bets" />
		    <frame src="messages.jsp" name="messages" />
			<frame src="usersonline.jsp" name="usersonline"/>
		</frameset>
	</frameset>
</head>

</html>