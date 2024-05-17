package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import Model.entities.Film;
import Model.metiers.ModelFilm;

/**
 * Servlet implementation class ServletFilm
 */
@WebServlet("/admin/film/*")
public class ServletFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletFilm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pathInfo = request.getPathInfo();
		//System.out.println(pathInfo);

		if( pathInfo == null ) {
			ArrayList<Film> films ;

			ModelFilm daoFilm = new ModelFilm();
			films = daoFilm.getFilms();

			System.out.println(films);

			request.setAttribute("films", films);

			request.getRequestDispatcher("/Film/afficherFilm.jsp").forward(request, response);
		}
		
		else if( pathInfo.equals("/add") ) {

			if( request.getParameter("titre") != null && request.getParameter("description") != null && request.getParameter("duration") != null && request.getParameter("genre") != null && request.getParameter("directeur") != null && request.getParameter("img") != null  ) {

				String titre = request.getParameter("titre");
				String description = request.getParameter("description");
				int duration = Integer.parseInt(request.getParameter("duration"));
				String genre = request.getParameter("genre");
				String directeur = request.getParameter("directeur");
				String img = request.getParameter("img");
				ModelFilm daoFilm = new ModelFilm();
				
				daoFilm.insertFilm(new Film(titre, description, duration, genre, directeur , img));
				System.out.println(new Film(titre, description, duration, genre, directeur , img));

				response.sendRedirect(request.getContextPath()+"/admin/film");			

				}
			else
			request.getRequestDispatcher("/Film/addFilm.jsp").forward(request, response);
		}
		
		else if( pathInfo.equals("/edit") ) {

			if( request.getParameter("id") != null ) {
				int id = Integer.parseInt(request.getParameter("id"));
				ModelFilm daoFilm = new ModelFilm();
				Film film = daoFilm.getFilm(id);
				request.setAttribute("film", film);
				request.getRequestDispatcher("/Film/editFilm.jsp").forward(request, response);
			}
			else if(request.getParameter("idfilm") != null  && request.getParameter("titre") != null && request.getParameter("description") != null && request.getParameter("duration") != null && request.getParameter("genre") != null && request.getParameter("directeur") != null && request.getParameter("img") != null ){
				int id = Integer.parseInt(request.getParameter("idfilm"));
				String titre = request.getParameter("titre");
				String description = request.getParameter("description");
				int duration = Integer.parseInt(request.getParameter("duration"));
				String genre = request.getParameter("genre");
				String directeur = request.getParameter("directeur");
				String img = request.getParameter("img");
				ModelFilm daoFilm = new ModelFilm();
				daoFilm.updateFilm(new Film(id, titre, description, duration, genre, directeur, img));
				response.sendRedirect(request.getContextPath()+"/admin/film");
			}
			else
			response.sendRedirect(request.getContextPath()+"/admin/film");
			// request.getRequestDispatcher("/Film/editFilm.jsp").forward(request, response);
		}
		
		else if( pathInfo.equals("/del") ) {
			if(request.getParameter("id") != null){
				int id = Integer.parseInt(request.getParameter("id"));
				ModelFilm daoFilm = new ModelFilm();
				Film film = daoFilm.getFilm(id);
				request.setAttribute("film", film);
				request.getRequestDispatcher("/Film/deleteFilm.jsp").forward(request, response);

			}
			else if( request.getParameter("idfilm") != null ) {
				int id = Integer.parseInt(request.getParameter("idfilm"));
				ModelFilm daoFilm = new ModelFilm();
				daoFilm.deleteFilm(id);
				response.sendRedirect(request.getContextPath()+"/admin/film");
			}
			else
			request.getRequestDispatcher("/Film/deleteFilm.jsp").forward(request, response);
		}
		
		else {

			request.getRequestDispatcher("/Film/afficherFilm.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
