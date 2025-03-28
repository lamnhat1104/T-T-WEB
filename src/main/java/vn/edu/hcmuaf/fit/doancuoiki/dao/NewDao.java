package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.New;
import vn.edu.hcmuaf.fit.doancuoiki.model.Promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewDao {
    public List<New> getAllNew () {
        List<New> newList = new ArrayList<New>();
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from news");){
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                New neww = new New();
                neww.setId(rs.getInt("id"));
                neww.setTitle(rs.getString("title"));
                neww.setContent(rs.getString("content"));
                neww.setImage(rs.getString("image"));
                neww.setCreatedDate(rs.getDate("createdDate"));
                neww.setIsActive(rs.getInt("isActive"));
                newList.add(neww);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return newList;
    }
    public void deleteNew(int id){
        String sql = "DELETE FROM news WHERE id = ?";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(sql)){
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void addNew(String title, String content, String image, Date createdDate, int isActive) {
        String squery = "INSERT INTO promotions (title, content, image, createdDate, isActive) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(squery)) {
            pre.setString(1, title);
            pre.setString(2, content);
            pre.setString(3, image);
            pre.setDate(4, (java.sql.Date) createdDate);
            pre.setInt(6, isActive);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateNew(int id, String title, String content, String image, Date createdDate, int isActive) {
        String squery = "UPDATE news set title=?, content = ?, image = ?, createdDate = ?, isActive = ? where id = ? ";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(squery)) {
                pre.setString(1, title);
                pre.setString(2, content);
                pre.setString(3, image);
                pre.setDate(4, (java.sql.Date) createdDate);
                pre.setInt(6, isActive);
                pre.setInt(7, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
