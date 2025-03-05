package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleTypeDao {

    public List<VehicleType> getAllVehicleType () {
        List<VehicleType> vehicleTypeList = new ArrayList<VehicleType>();
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from vehicletypes");){
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                VehicleType vehicleType = new VehicleType();
                vehicleType.setId(rs.getInt("id"));
                vehicleType.setName(rs.getString("name"));
                vehicleType.setBrand(rs.getString("brand"));
                vehicleType.setCategory(rs.getString("category"));
                vehicleType.setTotalPrice(rs.getInt("rentalPrice"));
                vehicleType.setDescription(rs.getString("description"));
                vehicleType.setImage(rs.getString("image"));
                vehicleType.setTotalVehicles(rs.getInt("totalVehicles"));
                vehicleType.setAvailable(rs.getInt("isAvailable"));
                vehicleTypeList.add(vehicleType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return vehicleTypeList;
    }

    public void updateVehicleType(int id, String name, String brand, String category, double totalPrice, String description, String image, int totalVehicles,  int available ) {
        String squery = "UPDATE vehicletypes set id=?, name=?, brand = ?, category = ?, rentalPrice = ?, description = ?, image = ?, totalVehicles = ?, isAvailable = ? where id = ? ";
        try(Connection conn = new DBContext().getConnection();
        PreparedStatement pre = conn.prepareStatement(squery)){
            pre.setInt(1, id);
            pre.setString(2, name);
            pre.setString(3, brand);
            pre.setString(4, category);
            pre.setDouble(5, totalPrice);
            pre.setString(6, description);
            pre.setString(7, image);
            pre.setInt(8, totalVehicles);
            pre.setInt(9, available);
            pre.setInt(10, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addVehicleType(String name, String brand, String category, double totalPrice, String description, String image, int totalVehicles, int available) {
        String squery = "INSERT INTO vehicletypes (name, brand, category, rentalPrice, description, image, totalVehicles, isAvailable) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(squery)) {
            pre.setString(1, name);
            pre.setString(2, brand);
            pre.setString(3, category);
            pre.setDouble(4, totalPrice);
            pre.setString(5, description);
            pre.setString(6, image);
            pre.setInt(7, totalVehicles);
            pre.setInt(8, available);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        VehicleTypeDao vehicleTypeDao = new VehicleTypeDao();
        for(VehicleType vehicleType : vehicleTypeDao.getAllVehicleType()) {
            System.out.println(vehicleType.getDescription());
        }
    }
}
