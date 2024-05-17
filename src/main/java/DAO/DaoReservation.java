package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.entities.Reservation;
import utilitaire.SinglethonConnection;

public class DaoReservation {

	// sql queries
	private static final String SQL_SELECT_ALL = "SELECT * FROM reservation";
	private static final String SQL_SELECT_ONE = "SELECT * FROM reservation WHERE id_reservation = ?";
	private static final String SQL_INSERT = "INSERT INTO reservation (id_projection, id_user, nombreBillet, prixTotal, dateReservation) VALUES (?, ?, ?, ?, ?)";
	private static final String SQL_UPDATE = "UPDATE reservation SET id_projection = ?, id_user = ?, nombreBillet = ?, prixTotal = ?, dateReservation = ? WHERE id_reservation = ?";
	private static final String SQL_DELETE = "DELETE FROM reservation WHERE id_reservation = ?";

	private Connection con = SinglethonConnection.getCon();

	public ArrayList<Reservation> getReservations() {
		ArrayList<Reservation> l = new ArrayList<>();

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return l;
			}
			PreparedStatement ps = con.prepareStatement(SQL_SELECT_ALL);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				l.add(new Reservation(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5),
						rs.getDate(6)));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return l;
	}

	public Reservation getReservation(int id) {
		Reservation r = null;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return null;
			}
			PreparedStatement ps = con.prepareStatement(SQL_SELECT_ONE);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				r = new Reservation(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDouble(5),
						rs.getDate(6));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return r;
	}

	public boolean insertReservation(Reservation r) {
		boolean inserted = false;
		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return inserted;
			}
			PreparedStatement ps = con.prepareStatement(SQL_INSERT);
			ps.setInt(1, r.getId_projection());
			ps.setInt(2, r.getId_user());
			ps.setInt(3, r.getNombreBillet());
			ps.setDouble(4, r.getPrixTotal());
			ps.setDate(5, (Date) r.getDateReservation());

			inserted = ps.executeUpdate() > 0;
			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return inserted;
	}

	public boolean updateReservation(Reservation r) {
		boolean updated = false;
		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return updated;
			}
			PreparedStatement ps = con.prepareStatement(SQL_UPDATE);
			ps.setInt(1, r.getId_projection());
			ps.setInt(2, r.getId_user());
			ps.setInt(3, r.getNombreBillet());
			ps.setDouble(4, r.getPrixTotal());
			ps.setDate(5, (Date) r.getDateReservation());
			ps.setInt(6, r.getId_reservation());

			updated = ps.executeUpdate() > 0;
			ps.close();
		} catch (SQLException e) {
			// Handle SQL exception
			e.printStackTrace();
		}
		return updated;
	}

	public boolean deleteReservation(int id) {
		boolean deleted = false;
		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return deleted;
			}
			PreparedStatement ps = con.prepareStatement(SQL_DELETE);
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
