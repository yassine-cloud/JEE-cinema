package Model.metiers;

import java.util.ArrayList;

import DAO.DaoHall;
import Model.entities.Hall;

public class ModelHall {

	DaoHall d = new DaoHall();

	public ArrayList<Hall> getHalls() {
		return d.getHalls();
	}

	public Hall getHall(int id) {
		return d.getHall(id);
	}

	public boolean addHall(int num, int cap) {
		return d.insertHall(num, cap);
	}

	public boolean delHall(int id) {
		return d.deleteHall(id);
	}

	public boolean editHall(int id, int num, int cap) {
		return d.updateHall(id, num, cap);
	}

}
