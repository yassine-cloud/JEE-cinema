package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.entities.Projection;
import utilitaire.SinglethonConnection;

public class DaoProjection {

    // sql statements
    private static final String Select_Projections = "SELECT * FROM projection";
    private static final String Select_Projection = "SELECT * FROM projection WHERE id_projection = ?";
    private static final String Insert_Projection = "INSERT INTO projection (debut, id_film, id_hall, prix) VALUES (?, ?, ?, ?)";
    private static final String Update_Projection = "UPDATE projection SET debut = ?, id_film = ?, id_hall = ?, prix = ? WHERE id_projection = ?";
    private static final String Delete_Projection = "DELETE FROM projection WHERE id_projection = ?";

    private Connection con = SinglethonConnection.getCon();

    public ArrayList<Projection> getProjections() {
        ArrayList<Projection> l = new ArrayList<>();

        try {
            if (con == null) {
                // Handle null connection
                System.err.println("Connection is null.");
                return l;
            }
            PreparedStatement ps = con.prepareStatement(Select_Projections);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                l.add(new Projection(rs.getInt(1), rs.getTimestamp(2).toLocalDateTime(), rs.getInt(3), rs.getInt(4), rs.getFloat(5)));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        }
        return l;
    }

    public Projection getProjection(int id) {
        Projection p = null;

        try {
            if (con == null) {
                // Handle null connection
                System.err.println("Connection is null.");
                return null;
            }
            PreparedStatement ps = con.prepareStatement(Select_Projection);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Projection(rs.getInt(1), rs.getTimestamp(2).toLocalDateTime(), rs.getInt(3), rs.getInt(4), rs.getFloat(5));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        }
        return p;
    }

    public boolean insertProjection(Projection p) {
        boolean inserted = false;

        try {
            if (con == null) {
                // Handle null connection
                System.err.println("Connection is null.");
                return false;
            }
            PreparedStatement ps = con.prepareStatement(Insert_Projection);
            ps.setTimestamp(1, java.sql.Timestamp.valueOf(p.getDebut()));
            ps.setInt(2, p.getId_film());
            ps.setInt(3, p.getId_hall());
            ps.setFloat(4, p.getPrix());

            inserted = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        }
        return inserted;
    }

    public boolean updateProjection(Projection p) {
        boolean updated = false;

        try {
            if (con == null) {
                // Handle null connection
                System.err.println("Connection is null.");
                return false;
            }
            PreparedStatement ps = con.prepareStatement(Update_Projection);
            ps.setTimestamp(1, java.sql.Timestamp.valueOf(p.getDebut()));
            ps.setInt(2, p.getId_film());
            ps.setInt(3, p.getId_hall());
            ps.setFloat(4, p.getPrix());
            ps.setInt(5, p.getId_projection());

            updated = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        }
        return updated;
    }

    public boolean deleteProjection(int id) {
        boolean deleted = false;

        try {
            if (con == null) {
                // Handle null connection
                System.err.println("Connection is null.");
                return false;
            }
            PreparedStatement ps = con.prepareStatement(Delete_Projection);
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
