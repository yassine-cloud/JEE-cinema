package utilitaire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SinglethonConnection {
	
	 private static Connection con;

	    static {
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jee_cinema", "root", "");
	            System.out.println("Database connection established successfully.");
	        } catch (ClassNotFoundException e) {
	            System.err.println("Failed to load JDBC driver: " + e.getMessage());
	        } catch (SQLException e) {
	            System.err.println("Failed to establish database connection: " + e.getMessage());
	        }
	    }

	    public static Connection getCon() {
	        return con;
	    }

}
