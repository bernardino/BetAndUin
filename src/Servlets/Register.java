package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class Register extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		/* Get parameters from the post */
		String user = request.getParameter("username");
		String pass = request.getParameter("passcode");
		String email = request.getParameter("email");
		String register = "";
		RequestDispatcher dispatcher;
	    HttpSession session;
		//Client client = new Client(user,pass,);
		/* Attempt to login */
		//register = client.register(user, pass,email);
		
		/*if(register.equals("User successfully authenticated.")){
			session = request.getSession(true);
			
		    //dispatcher = request.getRequestDispatcher("/chat_bean.jsp");
			//dispatcher.forward(request, response);
		}*/
		
	}
	
public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    	
    	doGet(request, response);
    }
	

}
