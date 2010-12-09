<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="Servlets.Client;"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
        <script type="text/javascript" src="comet.js"> </script>
    </head>
    <body style="background-color:#eee;">
        <div id="display">
            <h2 style="font-family:Tahoma, Geneva, sans-serif">Chat</h2>
			<div id="messagesboard" style="overflow: auto; border:thin solid #000000; position: fixed; top: 70px; left: 30px; width: 400px; height: 400px"></div>
        	<div id="input" style="position: fixed; top: 480px; left: 30px; width: 400px; height: 60px">
            <input id="message" type="text" size="70"/><br/>
            Send To:<br><input type="radio" id="allusers" name="group" onClick="radioHandler('all')" value="allusers">All Users<br>
            <input type="radio" id="specUser" name="group" onClick="radioHandler('user')" >Specific User: <input type="text" id="destination" width="120" name="chosenUser">
            <br>
            <input type="button" onClick="sendMsg()" value="Send" />
            <input type="button" onClick="quitChat();window.location='about:blank';" value="Quit" />
        </div></div>
    </body>
    <script type="text/javascript">
    	
    	// Initiate Comet object
    	var comet = Comet("http://localhost:8080/BetAndUin/");
    	var board = document.getElementById('messagesboard');
    	var i=0;
    	
    	// Register with Server for COMET callbacks.
    	comet.get("Messages?type=register", function(response) {
    		// updates the message board with the new response.
    		board.innerHTML = response;
    		var msg = new Array();
        	msg = response.split("<br/>");
        	
        	if(msg[i].indexOf('Congratulations! ')!=-1){
        		parent.parent.menu.window.location.reload();
        	}
        	
        	i++;
    	});
    
    	function sendMsg() {
    		var msg = document.getElementById('message').value;
    		var dest = document.getElementById('destination').value;
    		var allusers = document.getElementById('allusers');
    		var specUser = document.getElementById('specUser');
    		
    		if (allusers.checked && msg!="") {
    			msg = "allusers\n" + msg;
    		}
    		else if(specUser.checked && msg!="") {
    			msg = dest + "\n" + msg;
    		}
    		
    		if((allusers.checked && msg!="") || (specUser.checked && dest!="" && msg!="")){
    			comet.post("Messages", msg, function(response) {
    				// Do Nothing
    			})
    			// Clears the value of the message element
    			document.getElementById('message').value = '';
    		}
    	}
  	
    	
    	function quitChat() {
    		comet.post("Messages?type=exit", '', function(response) {
    			// Exits browser
    			window.location='about:blank';
    		});
    	}
    	
    	function radioHandler(option){
			if(option=="all"){
				document.getElementById("destination").disabled=true;
				document.getElementById("destination").value="";
			} else if(option=="user"){
				document.getElementById("destination").disabled=false;
			}
		}
    	
    	
    	//This makes the browser call the quitChat function before unloading(or closing) the page
    	window.onunload = quitChat();
    </script>
    
</html>
