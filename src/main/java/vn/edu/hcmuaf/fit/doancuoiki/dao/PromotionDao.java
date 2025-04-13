package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Promotion;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
                promotion.setDiscountType(rs.getInt("discountType"));
                promotion.setStartDate(rs.getDate("startDate"));
                promotion.setEndDate(rs.getDate("endDate"));
                promotion.setIsActive(rs.getInt("isActive"));
                promotionList.add(promotion);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return promotionList;
    }

    public void deletePromotion(int id){
        String sql = "DELETE FROM promotions WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updatePromotion(int id, String promotionName, String description, double discountValue, Date startDate, Date endDate, int isActive, int discountType) {
        String squery = "UPDATE promotions set promotionName=?, description = ?, discountValue = ?, startDate = ?, endDate = ?, isActive = ?, discountType = ? where id = ? ";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(squery)){
            pre.setString(1, promotionName);
            pre.setString(2, description);
            pre.setDouble(3, discountValue);
            pre.setDate(4, new java.sql.Date(startDate.getTime()));
            pre.setDate(5, new java.sql.Date(endDate.getTime()));
            pre.setInt(6, isActive);
            pre.setInt(7, discountType);
            pre.setInt(8, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addPromotion(String promotionName, String description, double discountValue, int discountType, Date startDate, Date endDate, int isActive) {
        String squery = "INSERT INTO promotions (promotionName, description, discountValue, startDate, endDate, isActive, discountType) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(squery)) {
            pre.setString(1, promotionName);
            pre.setString(2, description);
            pre.setDouble(3, discountValue);
            pre.setDate(4, (java.sql.Date) startDate);
            pre.setDate(5, (java.sql.Date) endDate);
            pre.setInt(6, isActive);
            pre.setInt(7, discountType);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updatePromotionStatus(int id, int isActive) {
        String sql = "UPDATE promotions SET isActive = ? WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, isActive);
            pre.setInt(2, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Promotion getPromotionByCode(int id) {
        String sql = "SELECT * FROM promotions WHERE id = ? AND isActive = 1";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Promotion promo = new Promotion();
                promo.setId(rs.getInt("id"));
                promo.setPromotionName(rs.getString("promotion-name"));
                promo.setDiscountValue(rs.getInt("discount-value"));
                promo.setStartDate(rs.getDate("start_date"));
                promo.setEndDate(rs.getDate("end_date"));
                promo.setIsActive(rs.getInt("is-active"));
                return promo;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public int getIdByCode(String code) {
        String sql = "SELECT id FROM promotions WHERE promotionName = ? AND isActive = 1 "
                + "AND startDate <= CURDATE() AND endDate >= CURDATE()";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("id");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Not found
    }


}
