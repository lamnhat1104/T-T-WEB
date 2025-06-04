package vn.edu.hcmuaf.fit.doancuoiki.dao;

import vn.edu.hcmuaf.fit.doancuoiki.db.DBContext;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; // For RETURN_GENERATED_KEYS
import java.util.ArrayList;
import java.util.List;

public class VehicleTypeDao {
    private LogDao logDao;


    public int getRentedVehiclesCount(int vehicleTypeId) {
        String sql = "SELECT COUNT(*) FROM orderdetails od " +
                "JOIN orders o ON od.orderId = o.id " +
                "JOIN vehicles v ON v.licensePlate = od.licensePlate " +
                "WHERE v.typeId = ? AND  o.status != 'Đã huỷ' AND o.rentalStartDate <= CURDATE() AND o.expectedReturnDate >= CURDATE()";

        int rentedCount = 0;
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, vehicleTypeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rentedCount = rs.getInt(1); // Số xe đang được thuê
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentedCount;
    }


    public List<VehicleType> getAllVehicleType () {
        List<VehicleType> vehicleTypeList = new ArrayList<VehicleType>();
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM vehicletypes");){

            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                int vehicleTypeId = rs.getInt("id");
                int totalVehicles = rs.getInt("totalVehicles");

                // Tính số xe đang được thuê
                int rentedVehicles = getRentedVehiclesCount(vehicleTypeId);

                // Tính số xe còn lại
                int remainingVehicles = totalVehicles - rentedVehicles;

                VehicleType vehicleType = new VehicleType(vehicleTypeId, rs.getString("image"));
                vehicleType.setId(vehicleTypeId);

    public VehicleTypeDao() {
        this.logDao = new LogDao(); // Initialize LogDao
    }

    public VehicleType getVehicleTypeById(int id) {
        String sql = "SELECT * FROM vehicletypes WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Assuming constructor VehicleType(id, image) and then setters
                VehicleType vehicleType = new VehicleType(rs.getInt("id"), rs.getString("image"));
                vehicleType.setName(rs.getString("name"));
                vehicleType.setBrand(rs.getString("brand"));
                vehicleType.setCategory(rs.getString("category"));
                vehicleType.setTotalPrice(rs.getDouble("rentalPrice")); // Use getDouble
                vehicleType.setDescription(rs.getString("description"));
                // image is set by constructor
                vehicleType.setTotalVehicles(rs.getInt("totalVehicles"));
                vehicleType.setAvailable(rs.getInt("isAvailable"));
                return vehicleType;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Or handle more gracefully
        }
        return null;
    }

    public List<VehicleType> getAllVehicleType() {
        List<VehicleType> vehicleTypeList = new ArrayList<VehicleType>();
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement("select * from vehicletypes");) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                VehicleType vehicleType = new VehicleType(rs.getInt("id"), rs.getString("image"));
                vehicleType.setId(rs.getInt("id")); // Potentially redundant if constructor sets it

                vehicleType.setName(rs.getString("name"));
                vehicleType.setBrand(rs.getString("brand"));
                vehicleType.setCategory(rs.getString("category"));
                vehicleType.setTotalPrice(rs.getDouble("rentalPrice")); // Use getDouble
                vehicleType.setDescription(rs.getString("description"));

                vehicleType.setImage(rs.getString("image"));
                vehicleType.setTotalVehicles(totalVehicles);

                vehicleType.setImage(rs.getString("image")); // Potentially redundant
                vehicleType.setTotalVehicles(rs.getInt("totalVehicles"));

                vehicleType.setAvailable(rs.getInt("isAvailable"));
                vehicleType.setRemainingVehicles(remainingVehicles);  // Thêm số xe còn lại vào đối tượng

                vehicleTypeList.add(vehicleType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vehicleTypeList;
    }



    public void deleteVehicleType(int id){

    public void deleteVehicleType(int id, int adminId) { // Added adminId
        VehicleType oldVehicleType = getVehicleTypeById(id);
        String oldData = (oldVehicleType != null) ? oldVehicleType.toLogString() : "ID: " + id + " (data not available pre-delete)";


        String sql = "DELETE FROM vehicletypes WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, id);
            int affectedRows = pre.executeUpdate();
            if (affectedRows > 0) {
                logDao.addLog(adminId, "DELETE", "VEHICLE_TYPE", id, oldData, null);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateVehicleType(int id, String name, String brand, String category, double totalPrice, String description, String image, int totalVehicles, int available, int adminId) { // Added adminId
        VehicleType oldVehicleType = getVehicleTypeById(id);
        String oldData = (oldVehicleType != null) ? oldVehicleType.toLogString() : "ID: " + id + " (old data not available)";

        // Corrected SQL query and parameter order
        String squery = "UPDATE vehicletypes SET name=?, brand=?, category=?, rentalPrice=?, description=?, image=?, totalVehicles=?, isAvailable=? WHERE id=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(squery)) {
            pre.setString(1, name);
            pre.setString(2, brand);
            pre.setString(3, category);
            pre.setDouble(4, totalPrice);
            pre.setString(5, description);
            pre.setString(6, image);
            pre.setInt(7, totalVehicles);
            pre.setInt(8, available);
            pre.setInt(9, id); // For WHERE clause

            int affectedRows = pre.executeUpdate();
            if (affectedRows > 0) {
                VehicleType newVehicleType = new VehicleType(id, image); // Reconstruct or fetch new state
                newVehicleType.setName(name);
                newVehicleType.setBrand(brand);
                newVehicleType.setCategory(category);
                newVehicleType.setTotalPrice(totalPrice);
                newVehicleType.setDescription(description);
                newVehicleType.setTotalVehicles(totalVehicles);
                newVehicleType.setAvailable(available);
                String newData = newVehicleType.toLogString();
                logDao.addLog(adminId, "UPDATE", "VEHICLE_TYPE", id, oldData, newData);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int addVehicleType(String name, String brand, String category, double totalPrice, String description, String image, int totalVehicles, int available, int adminId) { // Added adminId, returns new ID
        String squery = "INSERT INTO vehicletypes (name, brand, category, rentalPrice, description, image, totalVehicles, isAvailable) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int newVehicleId = -1;
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(squery, Statement.RETURN_GENERATED_KEYS)) { // Request generated keys
            pre.setString(1, name);
            pre.setString(2, brand);
            pre.setString(3, category);
            pre.setDouble(4, totalPrice);
            pre.setString(5, description);
            pre.setString(6, image);
            pre.setInt(7, totalVehicles);
            pre.setInt(8, available);
            int affectedRows = pre.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pre.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        newVehicleId = generatedKeys.getInt(1);
                        VehicleType newVehicleType = new VehicleType(newVehicleId, image);
                        newVehicleType.setName(name);
                        newVehicleType.setBrand(brand);
                        newVehicleType.setCategory(category);
                        newVehicleType.setTotalPrice(totalPrice);
                        newVehicleType.setDescription(description);
                        newVehicleType.setTotalVehicles(totalVehicles);
                        newVehicleType.setAvailable(available);
                        String newData = newVehicleType.toLogString();
                        logDao.addLog(adminId, "ADD", "VEHICLE_TYPE", newVehicleId, null, newData);
                    } else {
                        // Fallback if ID retrieval fails (should not happen with auto-increment typically)
                        logDao.addLog(adminId, "ADD", "VEHICLE_TYPE", 0, null, "Name: "+name + " (ID retrieval failed)");
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return newVehicleId;
    }

    public void updateAvailableStatus(int id, int isAvailable, int adminId) { // Added adminId
        VehicleType oldVehicleType = getVehicleTypeById(id);
        String oldData = (oldVehicleType != null) ? oldVehicleType.toLogString() : "ID: " + id + " (old data not available)";

        String sql = "UPDATE vehicletypes SET isAvailable = ? WHERE id = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, isAvailable);
            pre.setInt(2, id);
            int affectedRows = pre.executeUpdate();
            if (affectedRows > 0) {
                VehicleType newVehicleType = getVehicleTypeById(id); // Fetch the full updated record
                String newData = (newVehicleType != null) ? newVehicleType.toLogString() : "ID: " + id + ", isAvailable: " + isAvailable + " (new data fetch failed)";
                logDao.addLog(adminId, "UPDATE_STATUS", "VEHICLE_TYPE", id, oldData, newData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        VehicleTypeDao vehicleTypeDao = new VehicleTypeDao();
        // Example: To test logging, you'd need to simulate an adminId
        // int testAdminId = 1;
        // vehicleTypeDao.addVehicleType("Test Bike", "Test Brand", "Test Cat", 100.0, "Desc", "img.jpg", 5, 1, testAdminId);
        // vehicleTypeDao.updateAvailableStatus(someId, 0, testAdminId);
        // vehicleTypeDao.deleteVehicleType(someId, testAdminId);
        for (VehicleType vehicleType : vehicleTypeDao.getAllVehicleType()) {
            System.out.println(vehicleType.getDescription());
        }
    }
}