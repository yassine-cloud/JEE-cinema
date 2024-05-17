package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import Model.entities.User;
import Model.metiers.ModalUser;

/**
 * Servlet implementation class ServletUser
 */
@WebServlet("/admin/user/*")
public class ServletUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUser() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				HttpSession session = request.getSession();
        if (session.getAttribute("user") == null || !((User) session.getAttribute("user")).getRole().equals("admin") ) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
		String pathInfo = request.getPathInfo();

		if (pathInfo == null) {
			ArrayList<User> users;
			ModalUser daoUser = new ModalUser();
			users = daoUser.getUsers();
			request.setAttribute("users", users);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/User/afficherUser.jsp");
			System.out.println("users: " + users);
			System.out.println("request: " + requestDispatcher.toString());
			requestDispatcher.forward(request, response);
			// request.getRequestDispatcher("/User/afficherUser.jsp").forward(request,
			// response);
		} else if (pathInfo.equals("/add")) {
			if (request.getParameter("nom") != null && request.getParameter("prenom") != null
					&& request.getParameter("email") != null && request.getParameter("password") != null
					&& request.getParameter("role") != null) {
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String role = request.getParameter("role");
				ModalUser daoUser = new ModalUser();
				daoUser.insertUser(nom, prenom, email, password, role);
				response.sendRedirect(request.getContextPath() + "/admin/user");
			} else {
				request.getRequestDispatcher("/User/addUser.jsp").forward(request, response);
			}
		} else if (pathInfo.equals("/edit")) {
			if (request.getParameter("id") != null) {
				int id = Integer.parseInt(request.getParameter("id"));
				ModalUser daoUser = new ModalUser();
				User user = daoUser.getUser(id);
				request.setAttribute("user", user);
				request.getRequestDispatcher("/User/editUser.jsp").forward(request, response);
			} else if (request.getParameter("id_user") != null && request.getParameter("nom") != null
					&& request.getParameter("prenom") != null && request.getParameter("email") != null
					&& request.getParameter("password") != null && request.getParameter("role") != null) {
				int id = Integer.parseInt(request.getParameter("id_user"));
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String role = request.getParameter("role");
				ModalUser daoUser = new ModalUser();
				daoUser.updateUser(id, nom, prenom, email, password, role);
				response.sendRedirect(request.getContextPath() + "/admin/user");
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/user");
			}
		} else if (pathInfo.equals("/del")) {
			if (request.getParameter("id") != null) {
				int id = Integer.parseInt(request.getParameter("id"));
				ModalUser daoUser = new ModalUser();
				User user = daoUser.getUser(id);
				request.setAttribute("user", user);
				request.getRequestDispatcher("/User/deleteUser.jsp").forward(request, response);
			} else if (request.getParameter("id_user") != null) {
				int id = Integer.parseInt(request.getParameter("id_user"));
				ModalUser daoUser = new ModalUser();
				daoUser.deleteUser(id);
				response.sendRedirect(request.getContextPath() + "/admin/user");
			} else {
				request.getRequestDispatcher("/User/deleteUser.jsp").forward(request, response);
			}
		} else {
			request.getRequestDispatcher("/User/afficherUser.jsp").forward(request, response);
		}
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
