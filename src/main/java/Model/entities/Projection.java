package Model.entities;

import java.time.LocalDateTime;

public class Projection {

    private int id_projection;
    private LocalDateTime date;
    private int id_film;
    private int id_hall;
    private float prix;

    public Projection(LocalDateTime date, int id_film, int id_hall , float prix) {
        super();
        this.date = date;
        this.id_film = id_film;
        this.id_hall = id_hall;
        this.prix = prix;
    }

    public Projection(int id_projection, LocalDateTime date, int id_film, int id_hall  , float prix) {
        super();
        this.id_projection = id_projection;
        this.date = date;
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

    public LocalDateTime getdate() {
        return date;
    }

    public void setdate(LocalDateTime date) {
        this.date = date;
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
        return "Projection [id_projection=" + id_projection + ", date=" + date + ", id_film=" + id_film + ", id_hall="
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
