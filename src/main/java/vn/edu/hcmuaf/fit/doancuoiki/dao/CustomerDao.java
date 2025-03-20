package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerDao {
    public static void deleteCustomer(int customerId){
        String sql = "DELETE FROM userdetails WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, customerId);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateCustomer(int id, int customerId, String fullName, String phoneNumber, Date birthDay, String email, String address, int roleId, int isActive) {
        // SQL để cập nhật thông tin đơn hàng
        String sql1 = "UPDATE userdetails SET userId = ?, fullName = ?, phoneNumber = ?, birthDay = ?, email = ?, address = ? WHERE id = ?";
        // SQL để cập nhật thông tin chi tiết đơn hàng
        String sql2 = "UPDATE users SET email = ?, roleId =, isActive = ? WHERE id = ?";

        try (Connection conn = new DBContext().getConnection()) {
            // Cập nhật đơn hàng
            try (PreparedStatement pre1 = conn.prepareStatement(sql1)) {
                pre1.setInt(1, customerId);
                pre1.setString(2, fullName);
                pre1.setString(3, phoneNumber);
                pre1.setDate(4, birthDay);
                pre1.setString(5, email);
                pre1.setString(6, address);
                pre1.setInt(7, id);  // Sử dụng customerId làm khóa để tìm đơn hàng cần cập nhật
                pre1.executeUpdate();

                // Cập nhật chi tiết đơn hàng
                try (PreparedStatement pre2 = conn.prepareStatement(sql2)) {
                    pre2.setString(1, email);
                    pre2.setInt(2, roleId);
                    pre2.setInt(3, isActive);// Cập nhật order details dựa trên orderId
                    pre2.setInt(4, id);
                    pre2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
