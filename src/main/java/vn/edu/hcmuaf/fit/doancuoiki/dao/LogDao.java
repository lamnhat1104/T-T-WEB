package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class LogDao {

    public void addLog(int adminId, String action, String objectType, int objectId, String oldData, String newData) {
        String query = "INSERT INTO log (admin_id, action, object_type, object_id, old_data, new_data, created_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, adminId);
            ps.setString(2, action);
            ps.setString(3, objectType);
            ps.setInt(4, objectId);
            ps.setString(5, oldData); // Can be null
            ps.setString(6, newData); // Can be null
            ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));

            ps.executeUpdate();
        } catch (SQLException e) {
            // In a production environment, consider a more robust logging mechanism for this error itself.
            System.err.println("Error adding log entry: " + e.getMessage());
            e.printStackTrace();
        }
    }
}