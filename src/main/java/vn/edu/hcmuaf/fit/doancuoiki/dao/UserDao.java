package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;
import vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public boolean isEmailExists(String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error checking if email exists", e);
        }
        return false;
    }

    public int isActive(String email) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) { // Kiểm tra có dữ liệu không
                    return rs.getInt("isActive");
                } else {
                    return 1;
                }
            }
        }
    }


    public User getUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try(ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UserInfo ui = getUserInfo(rs.getInt("id"));
                    return new User(rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("password"),
                            ui,
                            rs.getInt("roleId"),
                            rs.getBoolean("isActive"));
                } else { return null;
                }
            }
        }
    }

    public UserInfo getUserInfo(int userId) {
        String query = "SELECT * FROM userdetails WHERE userId = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, userId); // Sửa lỗi truyền tham số
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) { // Kiểm tra kết quả trước khi truy xuất
                    return new UserInfo(
                            rs.getString("fullName"),
                            rs.getString("phoneNumber"),
                            rs.getString("address"), // Xóa khoảng trắng thừa
                            rs.getDate("birthDate").toLocalDate()
                    );
                } else {
                    return null; // Trường hợp không có bản ghi
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving user info", e);
        }
    }


    public boolean addUser(User user) {
        String query1 = "INSERT INTO users (email, password, roleId, isActive) VALUES (?, ?, ?, ?)";
        String query2 = "INSERT INTO userdetails (userId, fullName, phoneNumber, birthdate, address) VALUES (?, ?, ?, ?, ?)";
        boolean success = false;

        try (Connection conn = new DBContext().getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu giao dịch

            // Thêm người dùng vào bảng Users
            try (PreparedStatement ps1 = conn.prepareStatement(query1, PreparedStatement.RETURN_GENERATED_KEYS)) {
                ps1.setString(1, user.getEmail());
                ps1.setString(2, user.getPassword());
                ps1.setInt(3, 2);
                ps1.setBoolean(4, user.isActive());
                int rowsAffected1 = ps1.executeUpdate();

                // Lấy user_id vừa được sinh ra
                int userId = 0;
                if (rowsAffected1 > 0) {
                    try (ResultSet rs = ps1.getGeneratedKeys()) {
                        if (rs.next()) {
                            userId = rs.getInt(1);
                        }
                    }
                }

                // Thêm thông tin người dùng vào bảng UserInfo
                try (PreparedStatement ps2 = conn.prepareStatement(query2)) {
                    ps2.setInt(1, userId);
                    ps2.setString(2, user.getUserInfo().getFullName());
                    ps2.setString(3, user.getUserInfo().getPhoneNumber());
                    ps2.setString(4, user.getUserInfo().getBirthday() != null ? user.getUserInfo().getBirthday().toString() : null);
                    ps2.setString(5, user.getUserInfo().getAddress());
                    int rowsAffected2 = ps2.executeUpdate();

                    // Kiểm tra nếu cả hai câu lệnh đều thành công
                    if (rowsAffected1 > 0 && rowsAffected2 > 0) {
                        conn.commit(); // Commit giao dịch
                        success = true;
                    } else {
                        conn.rollback(); // Rollback nếu có lỗi
                    }
                }

            } catch (SQLException e) {
                if (conn != null) {
                    try {
                        conn.rollback(); // Rollback nếu có lỗi
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return success;
    }

    public void createToken(String token, long expiryTime, String email) {
        String query = "UPDATE users SET resetToken = ?, tokenExpiry = ? WHERE email = ?";
        try (Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query)){
            ps.setString(1, token);
            ps.setTimestamp(2, new Timestamp(expiryTime));
            ps.setString(3, email);
            ps.executeUpdate();
        }
        catch (SQLException e) {
            throw new RuntimeException("Error retrieving user info", e);
        }
    }

    public boolean checkConditionResetPassword(String token) {
        String query = "SELECT * FROM users WHERE resetToken = ? AND tokenExpiry > ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(query)) {
            pre.setString(1, token);
            pre.setTimestamp(2, new Timestamp(System.currentTimeMillis())); // Kiểm tra tokenExpiry có lớn hơn thời gian hiện tại không
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return true;  // Token hợp lệ và chưa hết hạn
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;  // Token không hợp lệ hoặc đã hết hạn
    }

    public boolean resetPassword(String password, String token) {
        String query = "UPDATE users SET password = ?, resetToken = NULL, tokenExpiry = NULL WHERE resetToken = ?";
        try(Connection conn = new DBContext().getConnection();
           PreparedStatement pre = conn.prepareStatement(query)) {
               pre.setString(1, password);
               pre.setString(2, token);
               return pre.executeUpdate()>1;
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT users.id AS userId, " +
                "users.email AS userEmail, " +
                "users.isActive AS userStatus, " +
                "roles.id AS roleId, " +
                "userDetails.fullName AS userFullName, " +
                "userDetails.phoneNumber AS userPhone, " +
                "userDetails.birthDate AS userBirthDate, " +
                "userDetails.address AS userAddress FROM users " +
                "LEFT JOIN roles ON users.roleId = roles.id " +
                "LEFT JOIN userDetails ON users.id = userDetails.userId;";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(query)){
            ResultSet rs = pre.executeQuery(query);
            while (rs.next()) {
                UserInfo userInfo = new UserInfo();
                userInfo.setFullName(rs.getString("userFullName"));
                userInfo.setPhoneNumber(rs.getString("userPhone"));
                userInfo.setAddress(rs.getString("userAddress"));
                userInfo.setBirthday(rs.getDate("userBirthDate").toLocalDate());
                users.add(new User(rs.getInt("userId"),
                        rs.getString("userEmail"),
                        userInfo,
                        rs.getInt("roleId"),
                        rs.getBoolean("userStatus")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void changeActive(int id, int active) {
        String query = "UPDATE users SET isActive = ? WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(query)){
            pre.setInt(1, active);
            pre.setInt(2, id);
            pre.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void changeRole(int id, int roleId) {
        String query = "UPDATE users SET roleId = ? WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(query)){
            pre.setInt(1, roleId);
            pre.setInt(2, id);
            pre.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException {
        UserDao dao = new UserDao();
        for(User u : dao.getUsers())
            System.out.println(u);
    }
}
