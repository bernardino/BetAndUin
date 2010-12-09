<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Welcome to BetAndUin</title>
<link rel="stylesheet" type="text/css" href="login.css" />
<script language="javascript">
	function passMatch(){
		var firstPass=document.registerForm.passcode.value;
		var secondPass=document.registerForm.passcode1.value;
		
		if(firstPass==secondPass && firstPass!=""){
			document.getElementById("error").style.visibility='hidden';
			if(document.registerForm.email.value!=""){
				document.registerForm.submit_btn.disabled=false;
			} else {
				document.registerForm.submit_btn.disabled=true;
			}
		}
		else{
			document.getElementById("error").style.visibility='visible';
			document.registerForm.submit_btn.disabled=true;
		}
	}
	
	function emailField(){
		var email = document.registerForm.email.value;
		if(email==""){
			document.getElementById("error2").style.visibility='visible';
			document.registerForm.submit_btn.disabled=true;
		} else {
			document.getElementById("error2").style.visibility='hidden';
			if(document.registerForm.passcode.value==document.registerForm.passcode1.value){
				document.registerForm.submit_btn.disabled=false;
			} else {
				document.registerForm.submit_btn.disabled=true;
			}
		}
	}
</script>
</head>
<body onload="emailField(); passMatch();">
<h1>Welcome to BetAndUin!</h1><br />
<div align="center">
<form name="registerForm" class="registerForm" action="Servlets.Login" method="post">
<table cellspacing="5" onkeyup="emailField()">
	<tr >
    	<td width="130">Username</td>
        <td><input type="text" name="username" /></td>
    </tr>
    <tr>
    	<td>Password</td>
        <td onkeyup="passMatch()" id="firstPass"><input type="password" name="passcode"/></td>
    </tr>
    <tr>
    	<td>Confirm Password</td>
        <td id="secondPass" onkeyup="passMatch()"><input type="password" name="passcode1"/></td>
    </tr>
    <tr>
    	<td>Email</td>
        <td id="email"><input type="text" name="email" /></td>
    </tr>
</table>
<br />

<input type="submit" value="Register" name="submit_btn"/>
<p id="error" style="visibility:hidden"><b>ERROR: The passwords do not match!</b></p>
<p id="error2" style="visibility:hidden"><b>ERROR: The Email field is empty!</b></p>

</form>
</div>
<p>Username already in use, please choose another one</p>
</body>
</html>
