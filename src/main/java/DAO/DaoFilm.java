package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.entities.Film;
import utilitaire.SinglethonConnection;

public class DaoFilm {

	// sql statements
	private static final String Select_Films = "SELECT * FROM film";
	private static final String Select_Film = "SELECT * FROM film WHERE id_film = ?";
	private static final String Insert_Film = "INSERT INTO film (title, description, duration, genre, directeur, img) VALUES (?, ?, ?, ?, ? , ?)";
	private static final String Update_Film = "UPDATE film SET title = ?, description = ?, duration = ?, genre = ?, directeur = ? , img = ? WHERE id_film = ?";
	private static final String Delete_Film = "DELETE FROM film WHERE id_film = ?";

	private Connection con = SinglethonConnection.getCon();

	public ArrayList<Film> getFilms() {
		ArrayList<Film> l = new ArrayList<>();

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return l;
			}
			PreparedStatement ps = con.prepareStatement(Select_Films);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				l.add(new Film(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return l;
	}

	public Film getFilm(int id) {
		Film f = null;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return null;
			}
			PreparedStatement ps = con.prepareStatement(Select_Film);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				f = new Film(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return f;
	}

	public boolean insertFilm(Film f) {
		boolean inserted = false;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return false;
			}
			PreparedStatement ps = con.prepareStatement(Insert_Film);
			ps.setString(1, f.getTitle());
			ps.setString(2, f.getDescription());
			ps.setInt(3, f.getDuration());
			ps.setString(4, f.getGenre());
			ps.setString(5, f.getDirecteur());
			ps.setString(6, f.getImg());

			inserted = ps.executeUpdate() > 0;
			System.out.println("Inserted " + inserted);

			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return inserted;
	}

	public boolean updateFilm(Film f) {
		boolean updated = false;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return false;
			}
			PreparedStatement ps = con.prepareStatement(Update_Film);
			ps.setString(1, f.getTitle());
			ps.setString(2, f.getDescription());
			ps.setInt(3, f.getDuration());
			ps.setString(4, f.getGenre());
			ps.setString(5, f.getDirecteur());
			ps.setString(6, f.getImg());
			ps.setInt(7, f.getId_film());

			updated = ps.executeUpdate() > 0;

			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return updated;
	}

	public boolean deleteFilm(int id) {
		boolean deleted = false;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return false;
			}
			PreparedStatement ps = con.prepareStatement(Delete_Film);
			ps.setInt(1, id);

			deleted = ps.executeUpdate() > 0;

			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return deleted;
	}

}
