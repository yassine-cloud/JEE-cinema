package Model.metiers;

import java.util.ArrayList;

import DAO.DaoHall;
import Model.entities.Hall;

public class ModelHall {
	
	DaoHall d = new DaoHall();
	
	public ArrayList<Hall> getHalls(){
		return d.getHalls();
	}

}
