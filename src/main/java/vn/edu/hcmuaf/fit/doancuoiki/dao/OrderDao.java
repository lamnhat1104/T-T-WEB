package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import vn.edu.hcmuaf.fit.doancuoiki.model.Order;
import vn.edu.hcmuaf.fit.doancuoiki.model.OrderDetail;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    public boolean createOrder(int id, String location, Date rentalStartDate, Date expectedReturnDate, String licensePlate, double priceAtOrder) {
        String sql1 = "insert into orders (customerId, rentalStartDate, expectedReturnDate, deliveryAddress) values(?,?,?,?)";
        String sql2 = "INSERT INTO orderdetails (orderId, licensePlate, priceAtOrder) values(?,?,?)";
        if(licensePlate.equals(""))return false;
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql1)){
            pre.setInt(1, id);
            pre.setDate(2, rentalStartDate);
            pre.setDate(3, expectedReturnDate);
            pre.setString(4, location);

            pre.executeUpdate();

            int rowsAffected1 = pre.executeUpdate();

            // Lấy user_id vừa được sinh ra
            int orderId = 0;
            if (rowsAffected1 > 0) {
                try (ResultSet rs = pre.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    }
                }
            }

            int rowsAffected2;
            try (PreparedStatement pre2 = conn.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS)) {
                pre2.setInt(1, orderId);
                pre2.setString(2, licensePlate);
                pre2.setDouble(3, priceAtOrder);
                rowsAffected2 = pre2.executeUpdate();
            }
            if (rowsAffected1 > 0 && rowsAffected2 > 0){
                return true;
            }

        }catch (SQLException e){
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

    public List<Order> getAllOrder(){
        List<Order> orders = new ArrayList<Order>();
        String sql = "SELECT * \n" +
                "FROM orders \n" +
                "JOIN orderdetails ON orders.id = orderdetails.orderId\n" +
                "JOIN vehicles ON orderdetails.licensePlate = vehicles.licensePlate\n" +
                "JOIN vehicletypes ON vehicletypes.id = vehicles.typeId;";
        try(Connection con = new DBContext().getConnection();
        PreparedStatement pre = con.prepareStatement(sql)){
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                OrderDetail orderDetail = new OrderDetail(rs.getInt("orderId"), rs.getString("licensePlate"), rs.getString("name"), rs.getDouble("priceAtOrder"));
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCustomerId(rs.getInt("customerId"));
                order.setDeliveryAddress(rs.getString("deliveryAddress"));
                order.setExpectedReturnDate(rs.getDate("expectedReturnDate"));
                order.setRetalStarDate(rs.getDate("rentalStartDate"));
                order.setStatus(rs.getString("status"));

                order.setOrderDetail(orderDetail);
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

    public void updateOrder(int id, int customerId, String location, Date rentalStartDate, Date expectedReturnDate, String licensePlate, double priceAtOrder, String status) {
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
                pre1.setString(5, status);
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


}
