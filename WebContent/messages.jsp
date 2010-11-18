<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="Servlets.Client;"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat</title>
    </head>
    <body>
        <div id="display">
            <h1>Chat</h1>
            <div id="messagesboard" style="overflow: auto; border:thin solid #000000; position: fixed; top: 80px; left: 30px; width: 400px; height: 400px"></div>
        </div>
        <div id="input" style="position: fixed; top: 490px; left: 30px; width: 400px; height: 60px">
            <input id="message" type="text" size="90"/><br/>
            Send To:<br><input type="radio" onClick="radioHandler(all)" value"allusers">All Users<br><input type="radio" onClick="radioHandler(user)" >Specific User: <input type="text" id="chosenUser" width="120" name="chosenUser">
            <br><br>
            <input type="button" onClick="sendMsg()" value="Send" />
            <input type="button" onClick="quitChat();window.location='about:blank';" value="Quit" />
        </div>
    </body>
    <script type="text/javascript" src="comet.js"> </script>
    <script type="text/javascript">
		
		function radioHandler(option){
			if(option=="all"){
				document.chosenUser.disabled=true;
			} else if(option=="user"){
				document.chosenUser.disabled=false;
			}
		}
    	
    	// Initiate Comet object
    	var comet = Comet("http://localhost:8080/BetAndUin/");
    	var board = document.getElementById('messagesboard').value;
    	
    	// Register with Server for COMET callbacks.
    	comet.get("ChatServlet?type=register", function(response) {
    		// updates the message board with the new response.
    		board.innerHTML = response;
    	});
    
    	function sendMsg() {
    		var msg = document.getElementById('message').value;
    		var dest = document.getElementById('destination').value;
    		if (dest == "") {
    			msg = "allusers\n" + msg;
    		}
    		else {
    			msg = dest + "\n" + msg
    		}
    			
    		comet.post("ChatServlet", msg, function(response) {
    			// Do Nothing
    		})
    		// Clears the value of the message element
    		document.getElementById('message').value = '';
    	}
  	
    	
    	function quitChat() {
    		comet.post("ChatServlet?type=exit", '', function(response) {
    			// Exits browser
    			window.location='about:blank';
    		})
    	}
    	
    	
    	//This makes the browser call the quitChat function before unloading(or closing) the page
    	window.onunload = quitChat;
    </script>
</html>
