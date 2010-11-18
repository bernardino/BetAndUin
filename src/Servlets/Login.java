package Servlets;
import java.io.IOException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Server.CMInterface;
import Server.MMInterface;
import Server.MenuInterface;


public class Login extends HttpServlet{
	
	private static final long serialVersionUID = -8608034654794572382L;	
	
	MenuInterface m = null;
	CMInterface cc = null;
	MMInterface mm = null;
	
	
	public void init(){
		try {
			m = (MenuInterface)LocateRegistry.getRegistry("localhost", 7000).lookup("Menu");
			cc = (CMInterface)LocateRegistry.getRegistry("localhost", 7000).lookup("ClientManager");
			mm = (MMInterface)LocateRegistry.getRegistry("localhost", 7000).lookup("MessageManager");
		} catch (NotBoundException e) {
		} catch (RemoteException e) {
			
		}
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		/* Get parameters from the post */
		String user = request.getParameter("username");
		String pass = request.getParameter("passcode");
		String email = request.getParameter("email");
		String login = "";
		boolean loggedIn = false;
		RequestDispatcher dispatcher = null;
	    HttpSession session;
		Client client = new Client(user,pass,m,cc,mm);
		/* TODO: NÃO DEIXAR QUE O CLIENTE SE REGISTE SEM EMAIL*/
		if(email==null){
			/* Attempt to login */
			login = client.login(user, pass);
			
			if(login.equals("User successfully authenticated.")){
				session = request.getSession(true);
				session.setAttribute("user",client);
				client.subscribe(user, client);
				loggedIn = true;
			}
			
		}else{
			login = m.register(user, pass, email);
			if(login.equals("Registration was successful")){
				session = request.getSession(true);
				session.setAttribute("user",client);
				client.subscribe(user, client);
				loggedIn = true;
			}
		}
		if(loggedIn){
			dispatcher = request.getRequestDispatcher("/home.jsp");
		}else if(!loggedIn && email==null){
			dispatcher = request.getRequestDispatcher("/invalidlogin.html");
		}else if(login.equals("Username already in use!")){
			dispatcher = request.getRequestDispatcher("/invalidregister.html");
		}
		
		dispatcher.forward(request, response);
		
	}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    	
    	doGet(request, response);
    }

}
