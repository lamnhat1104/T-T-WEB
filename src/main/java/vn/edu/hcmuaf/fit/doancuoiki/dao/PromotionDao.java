package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Promotion;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PromotionDao {
    public List<Promotion> getAllPromotion () {
        List<Promotion> promotionList = new ArrayList<Promotion>();
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from promotions");){
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Promotion promotion = new Promotion();
                promotion.setId(rs.getInt("id"));
                promotion.setPromotionName(rs.getString("promotionName"));
                promotion.setDescription(rs.getString("description"));
                promotion.setDiscountValue(rs.getDouble("discountValue"));
                promotion.setDiscountType(rs.getString("discountType"));
                promotion.setStartDate(rs.getDate("startDate"));
                promotion.setEndDate(rs.getDate("endDate"));
                promotion.setIsActive(rs.getInt("isActive"));
                promotionList.add(promotion);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return promotionList;
    }

    public void deleteVehicleType(int id){
        String sql = "DELETE FROM vehicletypes WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
}
