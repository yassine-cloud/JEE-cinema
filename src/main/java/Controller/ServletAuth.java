package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Model.entities.User;
import Model.metiers.ModalUser;

/**
 * Servlet implementation class ServletAuth
 */
@WebServlet("/login")
public class ServletAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			if(user.getRole().equals("admin")) {
				response.sendRedirect(request.getContextPath()+"/admin/hall");
				return ;
			}
			else {
				response.sendRedirect(request.getContextPath()+"/client/film");
				return ;
			}
		}
				
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        if(email != null && password != null) {
        	ModalUser utilDao = new ModalUser();
        	User u = utilDao.authentifier(email, password);
			
            if( u !=null )
            {
				session.setAttribute("user", u);
            	if(u.getRole().equals("admin") ) {
        			response.sendRedirect(request.getContextPath()+"/admin/hall");			
            	}
            	else {
            		response.sendRedirect(request.getContextPath()+"/client/film");	
//            		request.setAttribute("username",email);
//                    request.getRequestDispatcher("Bienvenue.jsp").forward(request, response);
            	}            
           }
            else
            {
            	response.sendRedirect("Error.html");
            }
        }
        
        else {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
    		dispatcher.forward(request, response);
    		
        }
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
