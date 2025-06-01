package vn.edu.hcmuaf.fit.doancuoiki.dao;


import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
// import vn.edu.hcmuaf.fit.doancuoiki.model.User; // Not used

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
// import java.text.SimpleDateFormat; // Not used
import java.time.LocalDateTime;

public class AdminLogUserDao {

    public void addLogEntry(int adminId, String action, int targetId, String oldData, String newData) {
        String query = "INSERT INTO admin_log_user (admin_id, action, target_id, old_data, new_data, log_time) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, adminId);
            ps.setString(2, action);
            // Handle potential case where targetId might be conceptually "null" or "not applicable"
            // The DB column target_id INT(11) allows NULL by default if not specified otherwise.
            // If targetId is a placeholder like -1 for "not found" or "error", it will be stored as -1.
            // If you want to store SQL NULL for such cases:
            // if (targetId <= 0) { // Or some other condition indicating "no specific target"
            //     ps.setNull(3, java.sql.Types.INTEGER);
            // } else {
            //     ps.setInt(3, targetId);
            // }
            ps.setInt(3, targetId); // Assuming targetId will always be a meaningful int or 0/-1 placeholder

            ps.setString(4, oldData);
            ps.setString(5, newData);
            ps.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("AdminLogUserDao: Error logging admin action: " + e.getMessage());
            e.printStackTrace(); // Consider using a proper logging framework
        }
    }
}