package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.New;
import vn.edu.hcmuaf.fit.doancuoiki.model.Promotion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
                neww.setTittle(rs.getString("title"));
                neww.setContent(rs.getString("content"));
                neww.setImage(rs.getString("image"));
                neww.setCreatedDate(rs.getDate("createDate"));
                neww.setIsActive(rs.getInt("isActive"));
                newList.add(neww);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return newList;
    }
}
