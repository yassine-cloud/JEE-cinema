package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import DAO.DaoHall;
import Model.entities.Hall;
import Model.entities.User;
import Model.metiers.ModelHall;

/**
 * Servlet implementation class ServletHall
 */
@WebServlet("/admin/hall/*")
public class ServletHall extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletHall() {
		super();
		// TODO Auto-generated constructor stub
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
        
		// TODO Auto-generated method stub
		String pathInfo = request.getPathInfo();
		// System.out.println(pathInfo);

		if (pathInfo == null) {
			ArrayList<Hall> halls;

			ModelHall daoHall = new ModelHall();
			halls = daoHall.getHalls();

			System.out.println(halls);

			request.setAttribute("halls", halls);

			request.getRequestDispatcher("/Hall/afficherHall.jsp").forward(request, response);
		}

		else if (pathInfo.equals("/add")) {

			if (request.getParameter("numhall") != null && request.getParameter("capacity") != null) {

				int num = Integer.parseInt(request.getParameter("numhall"));
				int cap = Integer.parseInt(request.getParameter("capacity"));
				ModelHall daoHall = new ModelHall();
				daoHall.addHall(num, cap);

				response.sendRedirect(request.getContextPath() + "/admin/hall");

			} else {
				request.getRequestDispatcher("/Hall/addHall.jsp").forward(request, response);
			}
		} else if (pathInfo.equals("/del")) {

			if (request.getParameter("idhall") != null) {

				int id = Integer.parseInt(request.getParameter("idhall"));
				ModelHall daoHall = new ModelHall();
				daoHall.delHall(id);

				response.sendRedirect(request.getContextPath() + "/admin/hall");

			}

			else if (request.getParameter("id") != null) {

				int id_hall = Integer.parseInt(request.getParameter("id"));
				// System.out.println("deleting : "+id_hall);

				request.setAttribute("id", id_hall);

				request.getRequestDispatcher("/Hall/deleteHall.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/hall");
			}
		} else if (pathInfo.equals("/edit")) {

			if (request.getParameter("idhall") != null) {

				DaoHall daoHall = new DaoHall();
				int id_hall = Integer.parseInt(request.getParameter("idhall"));
				int num = Integer.parseInt(request.getParameter("numhall"));
				int cap = Integer.parseInt(request.getParameter("capacity"));
				daoHall.updateHall(id_hall, num, cap);
				response.sendRedirect(request.getContextPath() + "/admin/hall");

			}

			else if (request.getParameter("id") != null) {
				DaoHall daoHall = new DaoHall();
				int id_hall = Integer.parseInt(request.getParameter("id"));
				Hall h = daoHall.getHall(id_hall);

				// System.out.println("editing : "+h);

				// System.out.println(request.getContextPath());
				request.setAttribute("id", h.getId_hall());
				request.setAttribute("num", h.getNum_hall());
				request.setAttribute("cap", h.getCapacity());

				request.getRequestDispatcher("/Hall/editHall.jsp").forward(request, response);

			} else {
				response.sendRedirect(request.getContextPath() + "/admin/hall");
			}

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);

	}

}
