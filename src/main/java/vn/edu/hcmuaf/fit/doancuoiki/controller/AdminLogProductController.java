package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.AdminLogDao;
import vn.edu.hcmuaf.fit.doancuoiki.dao.VehicleTypeDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.io.IOException;

@WebServlet(name = "AdminLogController", value = "/AdminLogController")
public class AdminLogProductController extends HttpServlet {
    private VehicleTypeDao vehDAO;
    private AdminLogDao logDAO;

    @Override
    public void init() throws ServletException {
        vehDAO = new VehicleTypeDao();
        logDAO = new AdminLogDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không xử lý GET
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int adminId = (int) request.getSession().getAttribute("adminId");

        try {
            if ("delete".equals(action)) {
                int vehicleTypeId = Integer.parseInt(request.getParameter("id"));
                VehicleType vehicle = vehDAO.getVehicleTypeById(vehicleTypeId);

                // Xóa loại xe
                vehDAO.deleteVehicleType(vehicleTypeId);

                // Ghi log
                String logMessage = "Deleted vehicle type ID " + vehicleTypeId + ": " + vehicle.getName();
                logDAO.logAction(adminId, "DELETE", "VehicleType", vehicleTypeId, logMessage);

                response.sendRedirect("index.jsp");

            } else if ("edit".equals(action)) {
                int vehicleTypeId = Integer.parseInt(request.getParameter("id"));
                VehicleType oldVehicle = vehDAO.getVehicleTypeById(vehicleTypeId);

                // Lấy thông tin mới từ form
                String newName = request.getParameter("name");
                String newBrand = request.getParameter("brand");
                String newCategory = request.getParameter("category");
                double newPrice = Double.parseDouble(request.getParameter("price"));
                String newDescription = request.getParameter("description");
                String newImage = request.getParameter("image");
                int newTotalVehicles = Integer.parseInt(request.getParameter("totalVehicles"));
                int newAvailable = Integer.parseInt(request.getParameter("available"));

                // Cập nhật loại xe
                vehDAO.updateVehicleType(vehicleTypeId, newName, newBrand, newCategory, newPrice, newDescription, newImage, newTotalVehicles, newAvailable);

                // Ghi log
                String logMessage = String.format(
                        "Edited vehicle type ID %d: Name '%s' → '%s', Price %.2f → %.2f",
                        vehicleTypeId,
                        oldVehicle.getName(), newName,
                        oldVehicle.getTotalPrice(), newPrice
                );
                logDAO.logAction(adminId, "EDIT", "VehicleType", vehicleTypeId, logMessage);

                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
