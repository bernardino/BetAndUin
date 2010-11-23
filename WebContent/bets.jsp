<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="Servlets.Client;"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="bets.css" />
<script language="javascript">
	function changeBG(idName){
		var temp = new Array();
		temp = idName.split(" ");
		document.getElementById("row"+temp[0]+"-").style.visibility='visible';
		
		for(var i=1;i<4;i++){
			document.getElementById(idName.substring(0,idName.length-1)+i).style.backgroundColor='#666';
			document.getElementById(idName.substring(0,idName.length-1)+i).style.color='#FC3';
		}
		
		document.getElementById(idName).style.backgroundColor='#FFF';
		document.getElementById(idName).style.color='#000';
	}
	
	function hideThis(idName){
		for(var i=1;i<4;i++){
			document.getElementById(idName.charAt(3)+" "+i).style.backgroundColor='#666';
			document.getElementById(idName.charAt(3)+" "+i).style.color='#FC3';
		}
		document.getElementById(idName).style.visibility='collapse';
	}
</script>
</head>

<body>
<h2 style="font-family:Tahoma, Geneva, sans-serif">Bets</h2>

<div id="bets" align="center" style="background-color:#000; color:#FFF;">
<br />
<br />
	<table border="0">
    	<tr>
        	<td style="font-family:Tahoma, Geneva, sans-serif; color:#FFF;" width="200">Home Team</td>
            <td style="font-family:Tahoma, Geneva, sans-serif; color:#FFF;" width="200" align="right">Away Team</td>
        </tr>
    </table>
    <br />
    <table id="games" cellpadding="10" cellspacing="5">
    <% 
    String[] games = new String[0];
    try{
    	Client user = (Client)session.getAttribute("user");
    	games = user.getGames();
    } catch(NullPointerException e){
    	System.out.println("ups bets");
    }
    	
    	String[] game;
    	String numGame;
    	int numGames = games.length;
    	for(int i=1; i<= numGames; i++){
    		game = games[i-1].split(" ");
    		numGame=game[1];
    		game = games[i-1].split(" vs ");
    		game[0] = game[0].substring(2+numGame.length()); %>
<tr class="gamesOp">
<td width="50" align="center" id="<%=i%> 0"><%= numGame %></td>
<td onClick="changeBG(this.id)" width="160" align="center" id="<%= i %> 1"><%= game[0] %></td>
<td onClick="changeBG(this.id)" width="80" align="center" id="<%= i %> 2">Tie</td>
<td onClick="changeBG(this.id)" width="160" align="center" id="<%= i %> 3"><%= game[1] %></td></tr>
<tr class="appear" id="row<%= i %>-" style="visibility:collapse">
<td colspan="3" align="center">Credits: <input type="text" size="10" /><input type="button" value="BET"/></td>
<td style="cursor:pointer;" onClick="hideThis(this.parentNode.id)">hide</td></tr>
<%}%>
    	<!--
    	<tr class="gamesOp">
        	<td onClick="changeBG(this.id)" width="160" align="center" id="1 1">as</td>
            <td onClick="changeBG(this.id)" width="80" align="center" id="1 2">Tie</td>
            <td onClick="changeBG(this.id)" width="160" align="center" id="1 3">cs</td>
        </tr>
        
        <tr class="appear" id="row1-"style="visibility:collapse">
        	<td colspan="2" align="center">Credits: <input type="text" size="10" /><input type="button" value="BET"/></td>
            <td onClick="hideThis(this.parentNode.id)">hide</td>
        </tr>
        <tr class="gamesOp">
        	<td onClick="changeBG(this.id)" align="center" id="2 1">as</td>
            <td onClick="changeBG(this.id)" align="center" id="2 2">Tie</td>
            <td onClick="changeBG(this.id)" align="center" id="2 3">cs</td>
        </tr>
        <tr class="appear" id="row2-" style="visibility:collapse">
        	<td colspan="2" align="center">Credits: <input type="text" size="10" /><input type="button" value="BET"/></td>
            <td onClick="hideThis(this.parentNode.id)">hide</td>
        </tr>
        <tr class="gamesOp">
        	<td onClick="changeBG(this.id)" align="center" id="3 1">as</td>
            <td onClick="changeBG(this.id)" align="center" id="3 2">Tie</td>
            <td onClick="changeBG(this.id)" align="center" id="3 3">cs</td>
        </tr>
        <tr class="appear" id="row3-" style="visibility:collapse">
        	<td colspan="2" align="center">Credits: <input type="text" size="10" /><input type="button" value="BET"/></td>
            <td onClick="hideThis(this.parentNode.id)">hide</td>
        </tr>
        <tr class="gamesOp">
        	<td onClick="changeBG(this.id)" align="center" id="4 1">as</td>
            <td onClick="changeBG(this.id)" align="center" id="4 2">Tie</td>
            <td onClick="changeBG(this.id)" align="center" id="4 3">cs</td>
        </tr>
        <tr class="appear" id="row4-" style="visibility:collapse">
        	<td colspan="2" align="center">Credits: <input type="text" size="10" /><input type="button" value="BET"/></td>
            <td onClick="hideThis(this.parentNode.id)">hide</td>
        </tr>
        -->
    </table>
    <br />
    <br />
</div>
<input type="button" value="REFRESH" onClick="location.reload(true);">
</body>
</html>