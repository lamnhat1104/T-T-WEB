package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class AdminLogOrderDao {

    public void addLogEntry(int adminId, String action, int targetOrderId, String oldData, String newData) {
        System.out.println("------------------------------------------------------");
        System.out.println("ADMIN_LOG_ORDER_DAO: Attempting to log order action.");
        System.out.println("ADMIN_LOG_ORDER_DAO: Admin ID: " + adminId);
        System.out.println("ADMIN_LOG_ORDER_DAO: Action: " + action);
        System.out.println("ADMIN_LOG_ORDER_DAO: Target Order ID: " + targetOrderId);
        System.out.println("ADMIN_LOG_ORDER_DAO: Old Data (snippet): " + (oldData != null && oldData.length() > 200 ? oldData.substring(0, 200) + "..." : oldData));
        System.out.println("ADMIN_LOG_ORDER_DAO: New Data (snippet): " + (newData != null && newData.length() > 200 ? newData.substring(0, 200) + "..." : newData));


        String query = "INSERT INTO admin_log_order (admin_id, action, target_order_id, old_data, new_data, log_time) VALUES (?, ?, ?, ?, ?, ?)";
        System.out.println("ADMIN_LOG_ORDER_DAO: SQL Query: " + query);

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            System.out.println("ADMIN_LOG_ORDER_DAO: Attempting to get DB connection...");
            conn = new DBContext().getConnection();

            if (conn == null) {
                System.err.println("ADMIN_LOG_ORDER_DAO: CRITICAL ERROR - DBContext().getConnection() returned NULL. Log will not be saved.");
                System.out.println("------------------------------------------------------");
                return;
            }
            System.out.println("ADMIN_LOG_ORDER_DAO: DB Connection obtained: " + conn);
            // System.out.println("ADMIN_LOG_ORDER_DAO: Connection auto-commit: " + conn.getAutoCommit());


            System.out.println("ADMIN_LOG_ORDER_DAO: Preparing statement...");
            ps = conn.prepareStatement(query);
            System.out.println("ADMIN_LOG_ORDER_DAO: PreparedStatement created.");

            System.out.println("ADMIN_LOG_ORDER_DAO: Setting parameters...");
            ps.setInt(1, adminId);
            ps.setString(2, action);
            ps.setInt(3, targetOrderId);
            ps.setString(4, oldData); // Ensure your DB column `old_data` can hold this. TEXT is good.
            ps.setString(5, newData); // Ensure your DB column `new_data` can hold this. TEXT is good.
            Timestamp currentTimestamp = Timestamp.valueOf(LocalDateTime.now());
            ps.setTimestamp(6, currentTimestamp);
            System.out.println("ADMIN_LOG_ORDER_DAO: Parameters set. Timestamp: " + currentTimestamp);

            System.out.println("ADMIN_LOG_ORDER_DAO: Executing update...");
            int rowsAffected = ps.executeUpdate();
            System.out.println("ADMIN_LOG_ORDER_DAO: executeUpdate completed. Rows affected: " + rowsAffected);

            if (rowsAffected > 0) {
                System.out.println("ADMIN_LOG_ORDER_DAO: SUCCESS - Log entry saved to admin_log_order table.");
            } else {
                System.err.println("ADMIN_LOG_ORDER_DAO: WARNING - 0 rows were inserted. Log entry MIGHT NOT be saved. Check DB constraints or triggers. SQL executed: " + ps.toString());
            }

        } catch (SQLException e) {
            System.err.println("ADMIN_LOG_ORDER_DAO: SQLException during logging order action. Log NOT saved.");
            System.err.println("ADMIN_LOG_ORDER_DAO: SQLState: " + e.getSQLState());
            System.err.println("ADMIN_LOG_ORDER_DAO: Error Code: " + e.getErrorCode());
            System.err.println("ADMIN_LOG_ORDER_DAO: Message: " + e.getMessage());
            e.printStackTrace(System.err);
        } catch (Exception e) {
            System.err.println("ADMIN_LOG_ORDER_DAO: UNEXPECTED Exception during logging order action. Log NOT saved.");
            System.err.println("ADMIN_LOG_ORDER_DAO: Message: " + e.getMessage());
            e.printStackTrace(System.err);
        } finally {
            System.out.println("ADMIN_LOG_ORDER_DAO: Entering finally block to close resources.");
            try {
                if (ps != null) {
                    System.out.println("ADMIN_LOG_ORDER_DAO: Closing PreparedStatement.");
                    ps.close();
                }
            } catch (SQLException e) {
                System.err.println("ADMIN_LOG_ORDER_DAO: SQLException while closing PreparedStatement: " + e.getMessage());
            }
            try {
                if (conn != null) {
                    System.out.println("ADMIN_LOG_ORDER_DAO: Closing Connection.");
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("ADMIN_LOG_ORDER_DAO: SQLException while closing Connection: " + e.getMessage());
            }
            System.out.println("ADMIN_LOG_ORDER_DAO: Exiting addLogEntry method.");
            System.out.println("------------------------------------------------------");
        }
    }
}