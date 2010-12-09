package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Bets
 */
@WebServlet("/Bets")
public class Bets extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Bets() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reset=request.getParameter("type");
		Client user = (Client)request.getSession().getAttribute("user");
		if(reset!=null){
			user.resetCredits();
			response.sendRedirect("/BetAndUin/menu.jsp");
			return;
		}
		String numGame = request.getParameter("numGame");
		String result = request.getParameter("result");
		String credits = request.getParameter("credits");
		int creditsInt = Integer.parseInt(credits);
		
		if(result.equals("2")){
			result="X";
		} else if(result.equals("3"))
			result="2";
		
		System.out.println(numGame+" "+result+" "+credits);
		
		if(user!=null){ //user logged in
			String aux=user.bet(Integer.parseInt(numGame), result, creditsInt);
			Messages.sendMessage(aux, user.getUser());
			response.sendRedirect("/BetAndUin/bets.jsp?refresh=true");
		} else {
			response.sendRedirect("/BetAndUin/index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
