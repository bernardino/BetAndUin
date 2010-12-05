<%@page import="Servlets.Client"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>BetAndUin</title>
		<link rel="stylesheet" type="text/css" href="menu.css" />
		
	</head>
	<body>
		<div>
			<span class="client"><%= session.getAttribute("user").toString()  %></span>
			<span class="reset" onClick="window.location='Servlets.Bets?type=reset'">reset</span>
			<span class="right" onClick="redirect('Servlets.Login?type=logout')">Logout</span>
		</div>
		<div style="text-align:center">
		
			<span class="home" onclick="redirect('home.jsp');">Home</span>
			<span class="home" onclick="redirect('news.jsp');">News</span>
		</div>
	</body>
	<script type="text/javascript">
			function redirect(dest){
				parent.window.location=dest;
			}
	</script>
</html>
