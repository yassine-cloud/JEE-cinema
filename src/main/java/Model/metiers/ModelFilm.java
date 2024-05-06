package Model.metiers;

import java.util.ArrayList;

import DAO.DaoFilm;
import Model.entities.Film;

public class ModelFilm {

    DaoFilm daoFilm = new DaoFilm();

    public ArrayList<Film> getFilms(){
		return daoFilm.getFilms();
	}

    public Film getFilm(int id) {
        return daoFilm.getFilm(id);
    }

    public boolean insertFilm(Film film) {
        return daoFilm.insertFilm(film);
    }

    public boolean updateFilm(Film film) {
        return daoFilm.updateFilm(film);
    }

    public boolean deleteFilm(int id) {
        return daoFilm.deleteFilm(id);
    }

}
