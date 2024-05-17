package Model.entities;

public class Film {

    private int id_film;
    private String title;
    private String description;
    private int duration;
    private String genre;
    private String directeur;
    private String img;


    public Film(String title, String description, int duration, String genre, String directeur , String img) {
        super();
        this.title = title;
        this.description = description;
        this.duration = duration;
        this.genre = genre;
        this.directeur = directeur;
        this.img = img;
    }

    public Film(int id_film, String title, String description, int duration, String genre, String directeur , String img) {
        super();
        this.id_film = id_film;
        this.title = title;
        this.description = description;
        this.duration = duration;
        this.genre = genre;
        this.directeur = directeur;
        this.img = img;
    }

    public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getId_film() {
        return id_film;
    }

    public void setId_film(int id_film) {
        this.id_film = id_film;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDirecteur() {
        return directeur;
    }

    public void setDirecteur(String directeur) {
        this.directeur = directeur;
    }

    @Override
    public String toString() {
        return "Film [id_film=" + id_film + ", title=" + title + ", description=" + description + ", duration="
                + duration + ", genre=" + genre + ", directeur=" + directeur +", img=" + img + "]";
    }

    @Override
    public boolean equals(Object o) {
        if (o instanceof Film)
            return id_film == ((Film) o).id_film;
        else
            return false;
    }

    

}
