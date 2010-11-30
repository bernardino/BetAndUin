<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="Servlets.Client;"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>BetAndUin</title>
		<link rel="stylesheet" type="text/css" href="menu.css" />
		<script type="text/javascript">
			function redirect(home){
				parent.window.location=home;
			}
		</script>
	</head>
	<body>
		<table >
				<td width="20%">
					<span class="client"><%=((Client)session.getAttribute("user")).toString()%></span>
					<span class="reset" onClick="" onMouseUp="location.reload();">reset</span>
				</td>
				<td width="*"></td>
				<td width="7%" align="center">
					<span class="home" onclick="redirect('home.jsp');">Home</span>
				</td>
				<td width="7%" align="center">
					<span class="home" onclick="redirect('news.jsp');">News</span>
				</td>
				<td width="15%">
					<form action="Servlets.Login?type=logout" id="logoutForm"><span class="right" onClick="document.getElementById('logoutForm').submit();">Logout</span></form>
				</td>
					
				<!--<span class="right" onClick="" onMouseUp="parent.window.location.reload();">Logout</span>
				<!-- <span class="right" onclick="redirect('index.jsp');">Logout</span> -->
		</table>
	</body>
</html>


