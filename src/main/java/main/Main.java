package main;

import DAO.DaoHall;
import Model.entities.Hall;

public class Main {

	public static void main(String[] args) {
		DaoHall d = new DaoHall();
		Hall u = d.getHall(1);
		System.out.println(u);
	}
}
