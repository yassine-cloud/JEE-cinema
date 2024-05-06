package Model.entities;

import java.time.LocalDateTime;

public class Projection {

    private int id_projection;
    private LocalDateTime debut;
    private int id_film;
    private int id_hall;
    private float prix;

    public Projection(LocalDateTime debut, int id_film, int id_hall , float prix) {
        super();
        this.debut = debut;
        this.id_film = id_film;
        this.id_hall = id_hall;
        this.prix = prix;
    }

    public Projection(int id_projection, LocalDateTime debut, int id_film, int id_hall  , float prix) {
        super();
        this.id_projection = id_projection;
        this.debut = debut;
        this.id_film = id_film;
        this.id_hall = id_hall;
        this.prix = prix;
    }

    public int getId_projection() {
        return id_projection;
    }

    public void setId_projection(int id_projection) {
        this.id_projection = id_projection;
    }

    public LocalDateTime getDebut() {
        return debut;
    }

    public void setDebut(LocalDateTime debut) {
        this.debut = debut;
    }

    public int getId_film() {
        return id_film;
    }

    public void setId_film(int id_film) {
        this.id_film = id_film;
    }

    public int getId_hall() {
        return id_hall;
    }

    public void setId_hall(int id_hall) {
        this.id_hall = id_hall;
    }

    public float getPrix() {
        return prix;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    @Override
    public String toString() {
        return "Projection [id_projection=" + id_projection + ", debut=" + debut + ", id_film=" + id_film + ", id_hall="
                + id_hall + ", prix=" + prix + "]";
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof Projection)
            return id_projection == ((Projection) o).id_projection;
        else
            return false;
    }



}
