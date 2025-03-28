package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import vn.edu.hcmuaf.fit.doancuoiki.dao.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.*;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
            case "managerPromotion":
                managerPromotion(request, response);
                break;
            case "managerContact":
                managerContact(request, response);
                break;
            case "managerNew":
                managerNew(request, response);
                break;
            case "managerStatMotor":
                managerStatMotor(request, response);
                break;
            case "managerStatIncome":
                managerStatIncome(request, response);
                break;
            case "managerSetting":
                managerSetting(request, response);
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
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "updateCustomer":
                updateCustomer(request, response);
                break;
            case "deleteVehicleType":
                deleteVehicleType(request, response);
                break;
            case "addPromotion":
                addPromotion(request, response);
                break;
            case "deletePromotion":
                deletePromotion(request, response);
                break;
            case "updatePromotion":
                updatePromotion(request, response);
                break;
            case "deleteContact":
                deleteContact(request, response);
                break;
            case "deleteNew":
                deleteNew(request, response);
                break;
        }
    }
// Quản lý khuyến mãi
    private void managerPromotion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        List<Promotion> promotions = promotionDao.getAllPromotion();
        request.setAttribute("promotions", promotions);
        request.getRequestDispatcher("admin/promotion.jsp").forward(request, response);
    }

    private void addPromotion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {;
        try {
            String promotionName = request.getParameter("promo-name");
            String description = request.getParameter("description");
            double discountValue = Double.parseDouble(request.getParameter("discount-value"));
            String startDatee = request.getParameter("start-date");
            String endDatee = request.getParameter("end-date");
            int isActive = Integer.parseInt(request.getParameter("is-active"));
            int discountType = Integer.parseInt(request.getParameter("discount-type"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(dateFormat.parse(startDatee).getTime());
            Date endDate = new Date(dateFormat.parse(endDatee).getTime());

            PromotionDao promotionDao = new PromotionDao();
            promotionDao.addPromotion(promotionName, description, discountValue, discountType, startDate, endDate, isActive);
            managerPromotion(request, response);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    private void deletePromotion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("promo-id"));
        PromotionDao promotionDao = new PromotionDao();
        promotionDao.deletePromotion(id);
        managerPromotion(request,response);
    }

    private void updatePromotion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ form
            int id = Integer.parseInt(request.getParameter("id")); // Lấy ID đơn hàng
            String promotionName = request.getParameter("promotionName"); // Lấy mã khách hàng
            String description = request.getParameter("descriptionName"); // Lấy địa chỉ giao xe
            double discountValue = Double.parseDouble(request.getParameter("discountValue"));
            String rentalStartDate = request.getParameter("startDate"); // Lấy ngày thuê
            String expectedReturnDate = request.getParameter("endDate"); // Lấy ngày trả dự kiến
            int isActive = Integer.parseInt(request.getParameter("isActive"));
            int discountType = Integer.parseInt(request.getParameter("discountType"));

            // Chuyển đổi ngày từ String sang Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(dateFormat.parse(rentalStartDate).getTime());
            Date endDate = new Date(dateFormat.parse(expectedReturnDate).getTime());
            // Tạo đối tượng OrderDao để thực hiện cập nhật đơn hàng
            PromotionDao promotionDao = new PromotionDao();
            // Cập nhật đơn hàng
            promotionDao.updatePromotion(id, promotionName, description, discountValue, startDate, endDate, isActive, discountType);
            managerPromotion(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }


// Quản lý phản hồi khách hàng
    private void managerContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContactDao contactDao = new ContactDao();
        List<Contact> contacts = contactDao.getAllContact();
        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("admin/feedback.jsp").forward(request, response);
    }
    private void deleteContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("contact-id"));
        ContactDao contactDao = new ContactDao();
        contactDao.deleteContact(id);
        managerContact(request,response);
    }

// Quản lý tin tức
    private void managerNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewDao newDao = new NewDao();
        List<New> newsList = newDao.getAllNew();
        request.setAttribute("news", newsList);
        request.getRequestDispatcher("admin/qltintuc.jsp").forward(request, response);

    }

    private void deleteNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("new-id"));
        NewDao newDao = new NewDao();
        newDao.deleteNew(id);
        managerNew(request,response);
    }

    private void addNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {;
        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String image = request.getParameter("image");
            String startDate = request.getParameter("start-date");
            int isActive = Integer.parseInt(request.getParameter("is-active"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date createdDate = new Date(dateFormat.parse(startDate).getTime());

            NewDao newDao = new NewDao();
            newDao.addNew(title, content, image, createdDate, isActive);
            managerNew(request, response);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ form
            int id = Integer.parseInt(request.getParameter("id")); // Lấy ID đơn hàng
            String title = request.getParameter("title"); // Lấy mã khách hàng
            String content = request.getParameter("content"); // Lấy địa chỉ giao xe
            String image = request.getParameter("image"); // Lấy ngày thuê
            String starDate = request.getParameter("starDate"); // Lấy ngày trả dự kiến
            int isActive = Integer.parseInt(request.getParameter("isActive"));


            // Chuyển đổi ngày từ String sang Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date ceatedDate = new Date(dateFormat.parse(starDate).getTime());

            // Tạo đối tượng OrderDao để thực hiện cập nhật đơn hàng
            NewDao newDao = new NewDao();
            // Cập nhật đơn hàng
            newDao.updateNew(id, title, content, image, ceatedDate, isActive);
            managerNew(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }

    private void managerStatMotor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/stats_motors.jsp").forward(request, response);
    }

    private void managerStatIncome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/stats_income.jsp").forward(request, response);
    }

    private void managerSetting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/setting.jsp").forward(request, response);
    }



// Quanr lý đơn hàng
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


// Quản lý khách hàng
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

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerIdStr = request.getParameter("customerId");

        if (customerIdStr == null || customerIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is missing or invalid");
            return;
        }

        try {
            int customerId = Integer.parseInt(customerIdStr);
            UserDao dao = new UserDao();
            dao.deleteCustomer(customerId);
            managerCustomer(request,response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID format");
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ form
            int id = Integer.parseInt(request.getParameter("id"));
            int userId = Integer.parseInt(request.getParameter("customerId"));
            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("emailCus");
            String address = request.getParameter("addressCus");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            int isActive = Integer.parseInt(request.getParameter("status"));

            String birthDayStr = request.getParameter("birthDateCus");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthDate = new Date(dateFormat.parse(birthDayStr).getTime());


            // Tạo đối tượng OrderDao để thực hiện cập nhật đơn hàng
            UserDao userDao = new UserDao();
            // Cập nhật đơn hàng
            userDao.updateCustomer(id, userId, fullName, phoneNumber, birthDate, email, address, roleId, isActive);
            managerCustomer(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }



// Quản lý xe máy
    private void managerVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehicleTypeDao dao = new VehicleTypeDao();
        List<VehicleType> vehicleTypeList = dao.getAllVehicleType();
        request.setAttribute("vehicleTypeList", vehicleTypeList);
        request.getRequestDispatcher("admin/motorbikes.jsp").forward(request, response);
    }

    private void deleteVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("vehicleId"));
        VehicleTypeDao dao = new VehicleTypeDao();
        dao.deleteVehicleType(id);
        managerVehicleType(request, response);
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