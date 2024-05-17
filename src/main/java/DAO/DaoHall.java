package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.entities.Hall;
import utilitaire.SinglethonConnection;

public class DaoHall {

	// sql Statements
	private final String Select_Halls = "SELECT id_hall , num_hall , capacity from hall";
	private final String Select_Hall = "SELECT id_hall , num_hall , capacity from hall WHERE id_hall = ?";
	private final String Insert_Hall = "INSERT into hall( num_hall , capacity) values( ? , ? )  ";
	private final String Update_Hall = "UPDATE hall SET num_hall = ? , capacity = ? WHERE id_hall = ? ";
	private final String Delete_Hall = "DELETE from hall WHERE id_hall = ?";

	private Connection con = SinglethonConnection.getCon();

	public ArrayList<Hall> getHalls() {
		ArrayList<Hall> l = new ArrayList<>();

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return l;
			}
			PreparedStatement ps = con.prepareStatement(Select_Halls);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				l.add(new Hall(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return l;
	}

	public Hall getHall(int id) {
		Hall h = null;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return null;
			}
			PreparedStatement ps = con.prepareStatement(Select_Hall);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				h = new Hall(rs.getInt(1), rs.getInt(2), rs.getInt(3));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return h;
	}

	public boolean insertHall(int num, int cap) {
		boolean rowUpdate = false;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return false;
			}
			PreparedStatement ps = con.prepareStatement(Insert_Hall);
			ps.setInt(1, num);
			ps.setInt(2, cap);

			rowUpdate = ps.executeUpdate() > 0;

			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowUpdate;
	}

	public boolean updateHall(int id, int num, int cap) {
		boolean rowUpdate = false;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return false;
			}
			PreparedStatement ps = con.prepareStatement(Update_Hall);
			ps.setInt(3, id);
			ps.setInt(1, num);
			ps.setInt(2, cap);

			rowUpdate = ps.executeUpdate() > 0;

			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowUpdate;
	}

	public boolean deleteHall(int id) {
		boolean rowUpdate = false;

		try {
			if (con == null) {
				// Handle null connection
				System.err.println("Connection is null.");
				return false;
			}
			PreparedStatement ps = con.prepareStatement(Delete_Hall);
			ps.setInt(1, id);

			rowUpdate = ps.executeUpdate() > 0;

			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowUpdate;
	}

}
