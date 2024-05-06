package Model.entities;

import java.util.Date;

public class Reservation {

    private int id_reservation;
    private int id_projection;
    private int id_user;
    private int nombreBillet;
    private double prixTotal;
    private Date dateReservation;

    public Reservation(int id_projection, int id_user, int nombreBillet, double prixTotal, Date dateReservation) {
        super();
        this.id_projection = id_projection;
        this.id_user = id_user;
        this.nombreBillet = nombreBillet;
        this.prixTotal = prixTotal;
        this.dateReservation = dateReservation;
    }

    public Reservation(int id_reservation, int id_projection, int id_user, int nombreBillet, double prixTotal, Date dateReservation) {
        super();
        this.id_reservation = id_reservation;
        this.id_projection = id_projection;
        this.id_user = id_user;
        this.nombreBillet = nombreBillet;
        this.prixTotal = prixTotal;
        this.dateReservation = dateReservation;
    }


    public int getId_reservation() {
        return id_reservation;
    }
    public void setId_reservation(int id_reservation) {
        this.id_reservation = id_reservation;
    }
    public int getId_projection() {
        return id_projection;
    }
    public void setId_projection(int id_projection) {
        this.id_projection = id_projection;
    }
    public int getId_user() {
        return id_user;
    }
    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    public int getNombreBillet() {
        return nombreBillet;
    }
    public void setNombreBillet(int nombreBillet) {
        this.nombreBillet = nombreBillet;
    }
    public double getPrixTotal() {
        return prixTotal;
    }
    public void setPrixTotal(double prixTotal) {
        this.prixTotal = prixTotal;
    }
    public Date getDateReservation() {
        return dateReservation;
    }
    public void setDateReservation(Date dateReservation) {
        this.dateReservation = dateReservation;
    }

    @Override
    public String toString() {
        return "Reservation [id_reservation=" + id_reservation + ", id_projection=" + id_projection + ", id_user="
                + id_user + ", nombreBillet=" + nombreBillet + ", prixTotal=" + prixTotal + ", dateReservation="
                + dateReservation + "]";
    }

    @Override
    public boolean equals(Object o) {
        if(o instanceof Reservation)
            return id_reservation == ((Reservation) o).id_reservation;
        else 
            return false;
    }

    

}
