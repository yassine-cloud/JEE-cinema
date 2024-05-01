package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.entities.User;
import utilitaire.SinglethonConnection;

public class DaoUser {
	
	
	// sql Statements
		private final String Select_Users = "SELECT `id_user`, `nom`, `prenom`, `email`, `password`, `role` FROM `user`";
		private final String Select_User = "SELECT `id_user`, `nom`, `prenom`, `email`, `password`, `role` FROM `user` WHERE `id_user` = ?";
		private final String Select_User_Email = "SELECT `id_user`, `nom`, `prenom`, `email`, `password`, `role` FROM `user` WHERE `email` = ?";
		private final String Insert_User = "INSERT INTO `user`(`nom`, `prenom`, `email`, `password`, `role`) VALUES ( ? , ? , ? , ? , ? )";
		private final String Update_User = "UPDATE `user` SET `nom`= ? ,`prenom`= ? ,`email`= ? ,`password`= ? ,`role`= ?  WHERE id_user = ? ";
		private final String Delete_User = "DELETE FROM `user` WHERE id_user = ?  ";
		
		
		private Connection con = SinglethonConnection.getCon();
		
		public ArrayList<User> getUsers(){
			ArrayList<User> l = new ArrayList<>();
			
			try {
				if (con == null) {
	                // Handle null connection
	                System.err.println("Connection is null.");
	                return l;
	            }
				PreparedStatement ps = con.prepareStatement(Select_Users);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					l.add(new User(rs.getInt("id_user"),rs.getString("nom"),rs.getString("prenom") , rs.getString("email") , rs.getString("password") , rs.getString("role")));
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return l;
		}
		
		public User getUser(int id){
			User u = null;
			
			try {
				if (con == null) {
	                // Handle null connection
	                System.err.println("Connection is null.");
	                return null;
	            }
				PreparedStatement ps = con.prepareStatement(Select_User);
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					u=new User(rs.getInt("id_user"),rs.getString("nom"),rs.getString("prenom") , rs.getString("email") , rs.getString("password") , rs.getString("role"));
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return u;
		}
		
		
		public boolean insertUser( String nom , String prenom , String email , String password , String role){
			boolean rowUpdate = false;
			
			try {
				if (con == null) {
	                // Handle null connection
	                System.err.println("Connection is null.");
	                return false;
	            }
				PreparedStatement ps = con.prepareStatement(Insert_User);
				ps.setString(1, nom);
				ps.setString(2, prenom);
				ps.setString(3, email);
				ps.setString(4, password);
				ps.setString(5, role);
				
				rowUpdate = ps.executeUpdate() > 0;
				
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return rowUpdate;
		}
		
		
		public boolean updateUser(int id , String nom , String prenom , String email , String password , String role){
			boolean rowUpdate = false;
			
			try {
				if (con == null) {
	                // Handle null connection
	                System.err.println("Connection is null.");
	                return false;
	            }
				PreparedStatement ps = con.prepareStatement(Update_User);
				ps.setInt(6, id);
				ps.setString(1, nom);
				ps.setString(2, prenom);
				ps.setString(3, email);
				ps.setString(4, password);
				ps.setString(5, role);
				
				rowUpdate = ps.executeUpdate() > 0;
				
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return rowUpdate;
		}
		
		
		public boolean deleteUser(int id) {
			boolean rowUpdate = false;
			
			try {
				if (con == null) {
	                // Handle null connection
	                System.err.println("Connection is null.");
	                return false;
	            }
				PreparedStatement ps = con.prepareStatement(Delete_User);
				ps.setInt(1, id);
							
				rowUpdate = ps.executeUpdate() > 0;
				
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return rowUpdate;
		}
		
		
		public User getUserByEmail(String email ){
			User u = null;
			
			try {
				if (con == null) {
	                // Handle null connection
	                System.err.println("Connection is null.");
	                return null;
	            }
				PreparedStatement ps = con.prepareStatement(Select_User_Email);
				ps.setString(1, email);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					u=new User(rs.getInt("id_user"),rs.getString("nom"),rs.getString("prenom") , rs.getString("email") , rs.getString("password") , rs.getString("role"));
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return u;
		}

	
	

}
