package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminLogDao {
    public void logAction(int adminId, String actionType, String objectType, int objectId, String summary) throws SQLException {
        String sql = "INSERT INTO admin_log (admin_id, action_type, object_type, object_id, change_summary) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, adminId);
            stmt.setString(2, actionType);
            stmt.setString(3, objectType);
            stmt.setInt(4, objectId);
            stmt.setString(5, summary);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
