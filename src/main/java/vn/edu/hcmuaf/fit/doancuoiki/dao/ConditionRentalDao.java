package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.New;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConditionRentalDao {
    public List<VehicleType> getCondition () {
        List<VehicleType> conditionList = new ArrayList<VehicleType>();
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from vehicleTypes");){
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                VehicleType vehicleType = new VehicleType();
                vehicleType.setId(rs.getInt("id"));
                vehicleType.setName(rs.getString("name"));
                vehicleType.setDepositPrice(rs.getDouble("depositPrice"));
                vehicleType.setRequiredLicense(rs.getString("requiredLicense"));
                conditionList.add(vehicleType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } return conditionList;
    }
    public void updateConditionType(int id, Double depositPrice, String requiredLicense) {
        String squery = "UPDATE vehicletypes set depositPrice=?, requiredLicense=? where id = ? ";
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement pre = conn.prepareStatement(squery)){
            pre.setDouble(1, depositPrice);
            pre.setString(2, requiredLicense);
            pre.setInt(3, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
