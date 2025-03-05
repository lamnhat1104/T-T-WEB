package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Vehicle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VehicleDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs    = null;
    public List<Vehicle> getALL() {
        List<Vehicle> list = new ArrayList<Vehicle>();
        String sql = "select * from vehicles";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Vehicle(
                        rs.getString("id"),
                        rs.getInt("typeId"),
                        rs.getString("licensePlate"),
                        rs.getString("status"),
                        rs.getInt("rentalCount"),
                        rs.getInt("isInUse")

                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        VehicleDao dao = new VehicleDao();
        List<Vehicle> list = dao.getALL();
        for (Vehicle vehicle : list) {
            System.out.println(vehicle);
        }
    }
}