package Model.metiers;

import java.util.ArrayList;

import DAO.DaoReservation;
import Model.entities.Reservation;

public class ModelReservation {

    DaoReservation daoReservation = new DaoReservation();

    public ArrayList<Reservation> getReservations(){
        return daoReservation.getReservations();
    }

    public Reservation getReservation(int id) {
        return daoReservation.getReservation(id);
    }

    public boolean insertReservation(Reservation reservation) {
        return daoReservation.insertReservation(reservation);
    }

    public boolean updateReservation(Reservation reservation) {
        return daoReservation.updateReservation(reservation);
    }

    public boolean deleteReservation(int id) {
        return daoReservation.deleteReservation(id);
    }

}
