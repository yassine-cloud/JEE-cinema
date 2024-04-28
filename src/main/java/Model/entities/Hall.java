package Model.entities;

public class Hall {
	
	
	private int id_hall;
	private int num_hall;
	private int capacity;
	public Hall(int num_hall, int capacity) {
		super();
		this.num_hall = num_hall;
		this.capacity = capacity;
	}
	public Hall(int id_hall, int num_hall, int capacity) {
		super();
		this.id_hall = id_hall;
		this.num_hall = num_hall;
		this.capacity = capacity;
	}
	public int getId_hall() {
		return id_hall;
	}
	public void setId_hall(int id_hall) {
		this.id_hall = id_hall;
	}
	public int getNum_hall() {
		return num_hall;
	}
	public void setNum_hall(int num_hall) {
		this.num_hall = num_hall;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	@Override
	public String toString() {
		return "Hall [id_hall=" + id_hall + ", num_hall=" + num_hall + ", capacity=" + capacity + "]";
	}
	@Override
	public boolean equals(Object o) {
		if(o instanceof Hall)
			return id_hall == ((Hall) o).id_hall;
		else 
			return false;
	}
	
	
	

}
