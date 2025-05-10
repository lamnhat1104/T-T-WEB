package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import vn.edu.hcmuaf.fit.doancuoiki.model.Order;
import vn.edu.hcmuaf.fit.doancuoiki.model.OrderDetail;
import vn.edu.hcmuaf.fit.doancuoiki.model.Promotion;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public boolean createOrder(int id, String location, Date rentalStartDate, Date expectedReturnDate, String licensePlate, double priceAtOrder, int promotionId) {
        String sql1 = "INSERT INTO orders (customerId, rentalStartDate, expectedReturnDate, deliveryAddress, promotionId) VALUES (?, ?, ?, ?, ?)";
        String sql2 = "INSERT INTO orderdetails (orderId, licensePlate, priceAtOrder) VALUES (?, ?, ?)";
        if (licensePlate.equals("")) return false;

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS)) {
            pre.setInt(1, id);
            pre.setDate(2, rentalStartDate);
            pre.setDate(3, expectedReturnDate);
            pre.setString(4, location);

            if (promotionId != -1) {
                pre.setInt(5, promotionId);
            } else {
                pre.setNull(5, java.sql.Types.INTEGER);
            }

            int rowsAffected1 = pre.executeUpdate();

            int orderId = 0;
            if (rowsAffected1 > 0) {
                try (ResultSet rs = pre.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    }
                }
            }

            int rowsAffected2;
            try (PreparedStatement pre2 = conn.prepareStatement(sql2)) {
                pre2.setInt(1, orderId);
                pre2.setString(2, licensePlate);
                pre2.setDouble(3, priceAtOrder);
                rowsAffected2 = pre2.executeUpdate();
            }

            return rowsAffected1 > 0 && rowsAffected2 > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getLicensePlate(int vehicleType, Date rentalStartDate, Date expectedReturnDate) {
        String sql = "SELECT v.licensePlate\n" +
                "FROM vehicles v\n" +
                "WHERE v.typeId = ? and v.isInUse = 1 -- Điều kiện typeId được áp dụng ở truy vấn ngoài\n" +
                "  AND v.licensePlate NOT IN (\n" +
                "    SELECT od.licensePlate\n" +
                "    FROM orderDetails od\n" +
                "    JOIN orders o ON od.orderId = o.id\n" +
                "    WHERE (o.rentalStartDate <= ?) \n" +
                "      AND (o.expectedReturnDate BETWEEN ? AND ? \n" +
                "           OR o.expectedReturnDate > ?) \n" +
                "     AND o.status NOT LIKE \"Đã huỷ\"\n" +
                ");";
        String licensePlate = "";
        try(Connection conn = new DBContext().getConnection();
        PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, vehicleType);
            pre.setDate(2, expectedReturnDate);
            pre.setDate(3, rentalStartDate);
            pre.setDate(4,expectedReturnDate);
            pre.setDate(5, expectedReturnDate);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                licensePlate = rs.getString("licensePlate");
            }
            pre.executeQuery();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return licensePlate;
    }

    public List<Order> getAllOrder() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT orders.*, orderdetails.*, vehicles.*, vehicletypes.*, promotions.id AS promo_id, " +
                "promotions.promotionName, promotions.discountType, promotions.discountValue\n " +
                "FROM orders " +
                "JOIN orderdetails ON orders.id = orderdetails.orderId " +
                "JOIN vehicles ON orderdetails.licensePlate = vehicles.licensePlate " +
                "JOIN vehicletypes ON vehicletypes.id = vehicles.typeId " +
                "LEFT JOIN promotions ON promotions.id = orders.promotionId";

        try (Connection con = new DBContext().getConnection();
             PreparedStatement pre = con.prepareStatement(sql)) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                // Lấy order detail
                OrderDetail orderDetail = new OrderDetail(
                        rs.getInt("orderId"),
                        rs.getString("licensePlate"),
                        rs.getString("name"),
                        rs.getDouble("priceAtOrder")
                );

                // Lấy vehicle type
                VehicleType vehicleType = new VehicleType(
                        rs.getInt("id"),
                        rs.getString("image")
                );

                // Lấy promotion nếu có
                Promotion promotion = null;
                int promoId = rs.getInt("promo_id");
                if (promoId > 0) {
                    promotion = new Promotion();
                    promotion.setId(promoId);
                    promotion.setPromotionName(rs.getString("promotionName"));
                    promotion.setDiscountType(rs.getInt("discountType"));
                    promotion.setDiscountValue(rs.getDouble("discountValue"));
                }

                // Tạo đối tượng Order
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCustomerId(rs.getInt("customerId"));
                order.setDeliveryAddress(rs.getString("deliveryAddress"));
                order.setCreatedDate(rs.getDate("createdDate"));
                order.setExpectedReturnDate(rs.getDate("expectedReturnDate"));
                order.setRetalStarDate(rs.getDate("rentalStartDate"));
                order.setStatus(rs.getInt("status"));
                order.setOrderDetail(orderDetail);
                order.setVehicleType(vehicleType);
                order.setPromotion(promotion);

                orders.add(order);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }


    public void deleteOrder(int orderId){
        String sql = "DELETE FROM orders WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, orderId);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateOrder(int id, int customerId, String location, Date rentalStartDate, Date expectedReturnDate, String licensePlate, double priceAtOrder, int status) {
        // SQL để cập nhật thông tin đơn hàng
        String sql1 = "UPDATE orders SET customerId = ?, rentalStartDate = ?, expectedReturnDate = ?, deliveryAddress = ?, status = ? WHERE id = ?";
        // SQL để cập nhật thông tin chi tiết đơn hàng
        String sql2 = "UPDATE orderdetails SET licensePlate = ?, priceAtOrder = ? WHERE orderId = ?";

        try (Connection conn = new DBContext().getConnection()) {
            // Cập nhật đơn hàng
            try (PreparedStatement pre1 = conn.prepareStatement(sql1)) {
                pre1.setInt(1, customerId);
                pre1.setDate(2, rentalStartDate);
                pre1.setDate(3, expectedReturnDate);
                pre1.setString(4, location);
                pre1.setInt(5, status);
                pre1.setInt(6, id);  // Sử dụng customerId làm khóa để tìm đơn hàng cần cập nhật
                pre1.executeUpdate();

                // Cập nhật chi tiết đơn hàng
                try (PreparedStatement pre2 = conn.prepareStatement(sql2)) {
                    pre2.setString(1, licensePlate);
                    pre2.setDouble(2, priceAtOrder);
                    pre2.setInt(3, id);  // Cập nhật order details dựa trên orderId
                    pre2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateOrderStatus(int orderId, int status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, status);
            pre.setInt(2, orderId);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updatePromotionInOrder(int orderId, int promotionId) {
        String sql = "UPDATE orders SET promotionId = ? WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, promotionId);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
