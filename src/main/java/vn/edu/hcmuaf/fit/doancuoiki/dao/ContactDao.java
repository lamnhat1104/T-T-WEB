package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Contact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static vn.edu.hcmuaf.fit.doancuoiki.db.DBContext.getConnection;

public class ContactDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean createContact(Contact contact) throws SQLException {
        String query = "insert into contacts (fullName, email, subject, processingStatus) values(?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, contact.getFullName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.setString(4, contact.getProcessingStatus());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu có ít nhất 1 dòng được chèn vào
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
