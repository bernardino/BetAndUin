<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="Servlets.Client;"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Untitled Document</title>
		<link rel="stylesheet" type="text/css" href="menu.css" />
		<script type="text/javascript">
			function redirect(home){
				parent.window.location=home;
			}
		</script>
	</head>
	<body>
		<div>
			<span class="client"><%=((Client)session.getAttribute("user")).toString()%></span>
			<span class="client" onclick="<%((Client)session.getAttribute("user")).resetCredits();%>" onmouseup="location.reload();">reset</span>
			<span class="right" onclick="<% session.invalidate();%>" onmouseup="parent.window.location.reload();">Logout</span>
			<!-- <span class="right" onclick="redirect('index.jsp');">Logout</span> -->
		</div>
		<div style="text-align:center">
		
			<span class="home" onclick="redirect('home.jsp');">Home</span>
			<span class="home" onclick="redirect('news.jsp');">News</span>
		</div>
	</body>
</html>


