package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.OrderDao;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.dao.VehicleTypeDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Order;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;
import vn.edu.hcmuaf.fit.doancuoiki.model.VehicleType;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "dashboard":
                managerDashboard(request, response);
                break;
            case "managerCustomer":
                managerCustomer(request, response);
                break;
            case "changeStatusUser":
                changeStatusUser(request, response);
                break;
            case "changeRoleUser":
                changeRoleUser(request, response);
                break;
            case "managerVehicleType":
                managerVehicleType(request, response);
                break;
            case "managerOrder":
                managerOrder(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "updateVehicleType":
                updateVehicleType(request, response);
                break;
            case "addVehicleType":
                addVehicleType(request, response);
                break;
            case "deleteOrder":
                deleteOrder(request, response);
                break;
            case "updateOrder":
                updateOrder(request, response);
                break;
        }
    }


    private void managerOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDao orderDao = new OrderDao();
        List<Order> orders = orderDao.getAllOrder();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("admin/orders.jsp").forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = new OrderDao();
        orderDao.deleteOrder(orderId);
        managerOrder(request,response);
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ form
            int orderId = Integer.parseInt(request.getParameter("orderId")); // Lấy ID đơn hàng
            int customerId = Integer.parseInt(request.getParameter("customerId")); // Lấy mã khách hàng
            String deliveryAddress = request.getParameter("deliveryAddress"); // Lấy địa chỉ giao xe
            String rentalStartDate = request.getParameter("rentalStartDate"); // Lấy ngày thuê
            String expectedReturnDate = request.getParameter("expectedReturnDate"); // Lấy ngày trả dự kiến
            String licensePlate = request.getParameter("licensePlate"); // Lấy biển số xe
            double rentalPrice = Double.parseDouble(request.getParameter("rentalPrice")); // Lấy giá thuê xe
            String status = request.getParameter("status"); // Lấy trạng thái đơn hàng

            // Chuyển đổi ngày từ String sang Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(dateFormat.parse(rentalStartDate).getTime());
            Date endDate = new Date(dateFormat.parse(expectedReturnDate).getTime());
            // Tạo đối tượng OrderDao để thực hiện cập nhật đơn hàng
            OrderDao dao = new OrderDao();
            // Cập nhật đơn hàng
            dao.updateOrder(orderId, customerId, deliveryAddress, startDate, endDate, licensePlate, rentalPrice, status);
            managerOrder(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }


    private void managerDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
    }

    private void managerCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        List<User> users = dao.getUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin/customers.jsp").forward(request, response);
    }

    private void changeStatusUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        int id = Integer.parseInt(request.getParameter("userId"));
        int status = Integer.parseInt(request.getParameter("status")); // "true" hoặc "false"
        dao.changeActive(id, status);
        managerCustomer(request, response);
    }

    private void changeRoleUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        int id = Integer.parseInt(request.getParameter("userId"));
        int role = Integer.parseInt(request.getParameter("roleId"));
        dao.changeRole(id, role);
        managerCustomer(request, response);
    }

    private void managerVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehicleTypeDao dao = new VehicleTypeDao();
        List<VehicleType> vehicleTypeList = dao.getAllVehicleType();
        request.setAttribute("vehicleTypeList", vehicleTypeList);
        request.getRequestDispatcher("admin/motorbikes.jsp").forward(request, response);
    }

    private void updateVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String category = request.getParameter("category");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int totalVehicles = Integer.parseInt(request.getParameter("totalVehicles"));
        int available = Integer.parseInt(request.getParameter("available"));

        VehicleTypeDao dao = new VehicleTypeDao();
        dao.updateVehicleType(id, name, brand, category, totalPrice, description, image, totalVehicles, available);
        managerVehicleType(request, response);
    }

    private void addVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {;
        String name = request.getParameter("addName");
        String brand = request.getParameter("addBrand");
        String category = request.getParameter("addCategory");
        double totalPrice = Double.parseDouble(request.getParameter("addTotalPrice"));
        String description = request.getParameter("addDescription");
        String image = request.getParameter("addImage");
        int totalVehicles = Integer.parseInt(request.getParameter("addTotalVehicles"));
        int available = Integer.parseInt(request.getParameter("addAvailable"));

        VehicleTypeDao dao = new VehicleTypeDao();
        dao.addVehicleType(name, brand, category, totalPrice, description, image, totalVehicles, available);
        managerVehicleType(request, response);
    }
}