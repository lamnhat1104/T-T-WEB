package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogDao {


    public void insertLog(int adminId, String action, String tableName, int recordId, String oldData, String newData) {
        String sql = "INSERT INTO log (admin_id, action, table_name, record_id, old_data, new_data) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, adminId);
            ps.setString(2, action);
            ps.setString(3, tableName);
            ps.setInt(4, recordId);
            ps.setString(5, oldData);
            ps.setString(6, newData);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
