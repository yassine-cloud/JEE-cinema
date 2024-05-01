package Model.metiers;

import java.util.ArrayList;

import DAO.DaoUser;
import Model.entities.User;

public class ModalUser {
	
	DaoUser daoUser = new DaoUser();
	
	public ArrayList<User> getUsers(){
		return daoUser.getUsers();
	}
	
	public User getUser(int id) {
		return daoUser.getUser(id);
	}
	
	public boolean insertUser(String nom , String prenom , String email , String password , String role) {
		return  daoUser.insertUser(nom, prenom, email, password, role);
	}
	
	public boolean updateUser(int id , String nom , String prenom , String email , String password , String role) {
		return daoUser.updateUser(id, nom, prenom, email, password, role);
	}
	
	public boolean deleteUser(int id) {
		return daoUser.deleteUser(id);
	}
	
	public User authentifier(String email , String password) {
		User u = daoUser.getUserByEmail(email);
		if( u != null ) {
			if( u.getEmail().equals(email) && u.getPassword().equals(password)) {
				return u;
			}
			else {
				return null;
			}
		}		
		return null;
	}
	
	

}
