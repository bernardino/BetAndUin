<%@page import="Servlets.Client"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

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
		document.getElementById("row"+temp[0]+"-").style.display='table-row';
		
		for(var i=1;i<4;i++){
			document.getElementById(idName.substring(0,idName.length-1)+i).style.backgroundColor='#666';
			document.getElementById(idName.substring(0,idName.length-1)+i).style.color='#FC3';
			document.getElementById(idName).name="not selected";
		}
		
		document.getElementById(idName).style.backgroundColor='#FFF';
		document.getElementById(idName).style.color='#000';
		document.getElementById(idName).name="selected";
	}
	
	function hideThis(idName){
		for(var i=1;i<4;i++){
			document.getElementById(idName.charAt(3)+" "+i).style.backgroundColor='#666';
			document.getElementById(idName.charAt(3)+" "+i).style.color='#FC3';
		}
		document.getElementById(idName).style.display='none';
	}
	
	function bet(id){
		var numGame = document.getElementById(id+" 0").innerHTML;
		var credits = document.getElementById(id+" 4").value;
		numGame = numGame.substring(1,numGame.length-1);
		
		for(var i=1;i<4;i++){
			if(document.getElementById(id+" "+i).name=="selected"){
				break;
			}
		}
		if(!isNaN(parseInt(credits))){
			window.location = "Servlets.Bets?numGame="+numGame+"&credits="+credits+"&result="+i;
		}
		else{
			alert("Credits must be an Integer");
		}
	}
	<% if(request.getParameter("refresh")!=null){ %>
	function refreshmenu(){
		parent.parent.menu.window.location.reload();
	}
	refreshmenu();
	<%}else{}%>
	
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
<tr class="appear" id="row<%= i %>-" style="display:none">
<td colspan="3" align="center">Credits: <input type="text" id="<%= i %> 4" size="10" /><input type="button" id="<%= i %>" onClick="bet(this.id)") value="BET"/></td>
<td style="cursor:pointer;" onClick="hideThis(this.parentNode.id)"">hide</td></tr>
<%}%>
    </table>
    <br />
    <br />
</div>
<input type="button" value="REFRESH" onClick="location.reload(true);">
</body>
</html>