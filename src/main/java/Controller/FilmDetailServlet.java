package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import Model.entities.Film;
import Model.entities.Hall;
import Model.entities.Projection;
import Model.entities.User;
import Model.metiers.ModelFilm;
import Model.metiers.ModelHall;
import Model.metiers.ModelProjection;

@WebServlet("/film/detail")
public class FilmDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null || !((User) session.getAttribute("user")).getRole().equals("client") ) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        
        if (request.getParameter("id") == null) {
            response.sendRedirect(request.getContextPath() + "/client/film");
            return;
        }
        
        int filmId = Integer.parseInt(request.getParameter("id"));

        ModelFilm daoFilm = new ModelFilm();
        ModelProjection daoProjection = new ModelProjection();
        
        ModelHall daoHall = new ModelHall();
        ArrayList<Hall> halls = daoHall.getHalls();
        
        
        Film film = daoFilm.getFilm(filmId);
        ArrayList<Projection> projections = daoProjection.getProjections();

        // Utilisation d'un Iterator pour éviter ConcurrentModificationException
        Iterator<Projection> iterator = projections.iterator();
        while (iterator.hasNext()) {
            Projection projection = iterator.next();
            if (projection.getId_film() != filmId) {
                iterator.remove();
            }
        }

        request.setAttribute("film", film);
        request.setAttribute("projections", projections);
        request.setAttribute("halls", halls);

        request.getRequestDispatcher("/Film/afficherFilmDetail.jsp").forward(request, response);
    }
}
