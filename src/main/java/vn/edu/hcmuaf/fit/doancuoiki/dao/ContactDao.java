package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.Contact;
import vn.edu.hcmuaf.fit.doancuoiki.model.Promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
            ps.setInt(4, contact.getProcessingStatus());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Trả về true nếu có ít nhất 1 dòng được chèn vào
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public List<Contact> getAllContact () {
        List<Contact> contactList = new ArrayList<Contact>();
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from contacts");){
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Contact contact  = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setFullName(rs.getString("fullName"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("subject"));
                contact.setCreateDate(rs.getDate("createdDate"));
                contact.setProcessingStatus(rs.getInt("processingStatus"));
                contactList.add(contact);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return contactList;
    }
    public void deleteContact(int id){
        String sql = "DELETE FROM contacts WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateContactStatus(int id, int status) {
        String sql = "UPDATE contacts SET processingStatus = ? WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, status);
            pre.setInt(2, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
