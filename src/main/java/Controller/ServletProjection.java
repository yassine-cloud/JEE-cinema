package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import Model.entities.Film;
import Model.entities.Hall;
import Model.entities.Projection;
import Model.entities.User;
import Model.metiers.ModelFilm;
import Model.metiers.ModelHall;
import Model.metiers.ModelProjection;

/**
 * Servlet implementation class ServletProjection
 */
@WebServlet("/admin/projection/*")
public class ServletProjection extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletProjection() {
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
		String pathInfo = request.getPathInfo();
		// System.out.println(pathInfo);

		if (pathInfo == null) {
			ArrayList<Projection> projections;

			ModelProjection daoProjection = new ModelProjection();
			projections = daoProjection.getProjections();
			ModelHall daoHall = new ModelHall();
			ArrayList<Hall> halls = daoHall.getHalls();
			ModelFilm daoFilm = new ModelFilm();
			ArrayList<Film> films = daoFilm.getFilms();

			request.setAttribute("projections", projections);
			request.setAttribute("halls", halls);
			request.setAttribute("films", films);

			request.getRequestDispatcher("/Projection/AfficherProjection.jsp").forward(request, response);
		}

		else if (pathInfo.equals("/add")) {

			if (request.getParameter("numhall") != null && request.getParameter("numfilm") != null
					&& request.getParameter("date") != null && request.getParameter("heure") != null
					&& request.getParameter("prix") != null) {

				int numhall = Integer.parseInt(request.getParameter("numhall"));
				int numfilm = Integer.parseInt(request.getParameter("numfilm"));
				String date = request.getParameter("date");
				String heure = request.getParameter("heure");
				float prix = Float.parseFloat(request.getParameter("prix"));
				LocalDateTime dateProjection = LocalDateTime.parse(date + "T" + heure);
				ModelProjection daoProjection = new ModelProjection();

				Projection projection = new Projection(dateProjection, numfilm, numhall, prix);
				daoProjection.insertProjection(projection);

				response.sendRedirect(request.getContextPath() + "/admin/projection");
			} else {
				ModelHall daoHall = new ModelHall();
				ArrayList<Hall> halls = daoHall.getHalls();
				ModelFilm daoFilm = new ModelFilm();
				ArrayList<Film> films = daoFilm.getFilms();
				request.setAttribute("halls", halls);
				request.setAttribute("films", films);

				request.getRequestDispatcher("/Projection/addProjection.jsp").forward(request, response);
			}
		}

		else if (pathInfo.equals("/edit")) {
			if (request.getParameter("numprojection") != null && request.getParameter("numhall") != null
					&& request.getParameter("numfilm") != null && request.getParameter("date") != null
					&& request.getParameter("heure") != null && request.getParameter("prix") != null) {

				int id = Integer.parseInt(request.getParameter("numprojection"));
				int numhall = Integer.parseInt(request.getParameter("numhall"));
				int numfilm = Integer.parseInt(request.getParameter("numfilm"));
				String date = request.getParameter("date");
				String heure = request.getParameter("heure");
				float prix = Float.parseFloat(request.getParameter("prix"));
				LocalDateTime dateProjection = LocalDateTime.parse(date + "T" + heure);
				ModelProjection daoProjection = new ModelProjection();

				Projection projection = new Projection(id, dateProjection, numfilm, numhall, prix);
				daoProjection.updateProjection(projection);

				response.sendRedirect(request.getContextPath() + "/admin/projection");
			} else if (request.getParameter("id") != null) {
				int id = Integer.parseInt(request.getParameter("id"));
				ModelProjection daoProjection = new ModelProjection();
				Projection projection = daoProjection.getProjection(id);
				ModelHall daoHall = new ModelHall();
				ArrayList<Hall> halls = daoHall.getHalls();
				ModelFilm daoFilm = new ModelFilm();
				ArrayList<Film> films = daoFilm.getFilms();
				request.setAttribute("projection", projection);
				request.setAttribute("halls", halls);
				request.setAttribute("films", films);

				request.getRequestDispatcher("/Projection/editProjection.jsp").forward(request, response);
			} else {

				response.sendRedirect(request.getContextPath() + "/admin/projection");
			}
		}

		else if (pathInfo.equals("/del")) {
			if (request.getParameter("numprojection") != null) {

				int id = Integer.parseInt(request.getParameter("numprojection"));
				ModelProjection daoProjection = new ModelProjection();
				daoProjection.deleteProjection(id);

				response.sendRedirect(request.getContextPath() + "/admin/projection");

			}

			else if (request.getParameter("id") != null) {

				int id = Integer.parseInt(request.getParameter("id"));
				ModelProjection daoProjection = new ModelProjection();
				Projection projection = daoProjection.getProjection(id);
				ModelHall daoHall = new ModelHall();
				ArrayList<Hall> halls = daoHall.getHalls();
				ModelFilm daoFilm = new ModelFilm();
				ArrayList<Film> films = daoFilm.getFilms();
				request.setAttribute("projection", projection);
				request.setAttribute("halls", halls);
				request.setAttribute("films", films);

				request.getRequestDispatcher("/Projection/deleteProjection.jsp").forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/admin/projection");

			}

		}

		else {
			response.sendRedirect(request.getContextPath() + "/admin/projection");
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
