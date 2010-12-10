<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<jsp:include page="jsp/auth_index.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to BetAndUin</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>
<body>
<h1>Welcome to BetAndUin!</h1>
<div class="loginPrompt" align="center" id="loginDiv">
<br />
<form class="registerForm" action="Servlets.Login" method="post">
<table>
	<tr >
    	<td>Username</td>
        <td><input type="text" name="username" /></td>
    </tr>
    <tr>
    	<td>Password</td>
        <td><input type="password" name="passcode" /></td>
    </tr>
</table>
<br />
<input type="submit" value="Submit" />
</form>
<br />
<a href="register.html">Not Registered?</a>
</div>
</body>
</html>
