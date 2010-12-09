package Servlets;
import java.io.IOException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;

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
			m = null;
			cc = null;
			mm = null;
			System.out.println("AAAA");
		}
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		/* Get parameters from the post */
		String user = request.getParameter("username");
		String pass = request.getParameter("passcode");
		String email = request.getParameter("email");
		String login = "";
		boolean loggedIn = false;
	    HttpSession session;
	    System.out.println("aaaaa:" +pass);
	    String type=request.getParameter("type");
		if(type!=null && type.equals("logout")){
			((Client)request.getSession().getAttribute("user")).logout();
			request.getSession().invalidate();
			response.sendRedirect("/BetAndUin/index.jsp");
			return;
		}
		
		Client client = new Client(user,pass, m, cc, mm);
		
		if(m!=null){
			if(email==null){
				/* Attempt to login */
				login = m.login(user, pass);

				if(login != null && login.equals("User successfully authenticated.")){
					m.subscribe(user, client);
					session = request.getSession(true);
					session.setAttribute("user",client);

					loggedIn = true;
				}
				else{
					session = request.getSession(true);
					session.setAttribute("status message",login);
				}


			}else{
				login = m.register(user, pass, email);
				if(login != null && login.equals("Registration was successful")){
					m.subscribe(user, client);
					session = request.getSession(true);
					session.setAttribute("user",client);

					loggedIn = true;
				}
			}
			if(loggedIn){
				response.sendRedirect("/BetAndUin/home.jsp");
			}else if(!loggedIn && email==null){
				response.sendRedirect("/BetAndUin/invalidlogin.jsp");
			}else if(login.equals("Username already in use!")){
				response.sendRedirect("/BetAndUin/invalidregister.jsp");
			}
		}
		else{
			session = request.getSession(true);
			session.setAttribute("status message", "The System is down, please try to login later");
			response.sendRedirect("/BetAndUin/invalidlogin.jsp");
		}
		
		
	}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    	
    	doGet(request, response);
    }

}
