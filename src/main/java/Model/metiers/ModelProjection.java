package Model.metiers;

import java.util.ArrayList;

import DAO.DaoProjection;
import Model.entities.Projection;

public class ModelProjection {

    DaoProjection daoProjection = new DaoProjection();

    public ArrayList<Projection> getProjections(){
        return daoProjection.getProjections();
    }

    public Projection getProjection(int id) {
        return daoProjection.getProjection(id);
    }

    public boolean insertProjection(Projection projection) {
        return daoProjection.insertProjection(projection);
    }

    public boolean updateProjection(Projection projection) {
        return daoProjection.updateProjection(projection);
    }

    public boolean deleteProjection(int id) {
        return daoProjection.deleteProjection(id);
    }

}
