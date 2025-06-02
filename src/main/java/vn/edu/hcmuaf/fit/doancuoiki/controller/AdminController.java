package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import vn.edu.hcmuaf.fit.doancuoiki.dao.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.Order; // Already imported
import vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
// import java.time.LocalDate; // Not directly used here but through model
// import java.time.format.DateTimeFormatter; // Not directly used here
import java.util.List;




@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {
    private AdminLogUserDao adminLogDao = new AdminLogUserDao(); // Instantiate logger

    private int getLoggedInAdminId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Object adminObj = session.getAttribute("adminAccount");
            if (adminObj instanceof vn.edu.hcmuaf.fit.doancuoiki.model.User) {
                User adminUser = (User) adminObj;
                return adminUser.getId();
            }
        }
        System.err.println("WARN: Admin ID not found in session for logging. Using placeholder ID 0.");
        return 0;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            // Handle null action, perhaps redirect to a default admin page or show error
            response.sendRedirect(request.getContextPath() + "/admin?action=dashboard"); // Example
            return;
        }
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
            case "changeStatusVehicle":
                changeStatusVehicle(request, response);
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
            case "managerConditionRental":
                managerConditionRental(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/admin?action=dashboard"); // Example for unknown action
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action parameter missing.");
            return;
        }
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
            case "updateOrderStatus":
                updateOrderStatus(request, response);
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
            case "changePromotionStatus":
                changePromotionStatus(request, response);
                break;
            case "deleteContact":
                deleteContact(request, response);
                break;
            case "deleteNew":
                deleteNew(request, response);
                break;
            case "addNew":
                addNew(request, response);
                break;
            case "updateNew":
                updateNew(request, response);
                break;
            case "changeNewsStatus":
                changeNewsStatus(request, response);
                break;
            case "changeContactStatus":
                changeContactStatus(request, response);
                break;
            case "updateConditionRental":
                updateConditionRental(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown action: " + action);
                break;
        }
    }

    // Quản lý điều kiện đặt xe
    private void managerConditionRental(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConditionRentalDao dao = new ConditionRentalDao();
        List<VehicleType> conditions = dao.getCondition();
        request.setAttribute("conditions", conditions);
        request.getRequestDispatcher("admin/condition_rental.jsp").forward(request, response);
    }
    private void updateConditionRental(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        double depositPrice = Double.parseDouble(request.getParameter("depositPrice"));
        String requiredLicense = request.getParameter("requiredLicense");
        ConditionRentalDao dao = new ConditionRentalDao();
        dao.updateConditionType(id, depositPrice,requiredLicense);
        managerConditionRental(request, response);
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
            int id = Integer.parseInt(request.getParameter("id"));
            String promotionName = request.getParameter("promotionName");
            String description = request.getParameter("descriptionName");
            double discountValue = Double.parseDouble(request.getParameter("discountValue"));
            String rentalStartDate = request.getParameter("startDate");
            String expectedReturnDate = request.getParameter("endDate");
            int isActive = Integer.parseInt(request.getParameter("isActive"));
            int discountType = Integer.parseInt(request.getParameter("discountType"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(dateFormat.parse(rentalStartDate).getTime());
            Date endDate = new Date(dateFormat.parse(expectedReturnDate).getTime());
            PromotionDao promotionDao = new PromotionDao();
            promotionDao.updatePromotion(id, promotionName, description, discountValue, startDate, endDate, isActive, discountType);
            managerPromotion(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }
    private void changePromotionStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int promoId = Integer.parseInt(request.getParameter("promotionId"));
        int isActive = Integer.parseInt(request.getParameter("isActive"));
        PromotionDao dao = new PromotionDao();
        dao.updatePromotionStatus(promoId, isActive);
        managerPromotion(request,response);

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
    private void changeContactStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("contactId"));
        int status = Integer.parseInt(request.getParameter("status"));
        ContactDao dao = new ContactDao();
        dao.updateContactStatus(contactId, status);
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
            String startDate = request.getParameter("created-date");
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
            int id = Integer.parseInt(request.getParameter("new-id"));
            String title = request.getParameter("new-title");
            String content = request.getParameter("new-content");
            String image = request.getParameter("new-image");
            String starDate = request.getParameter("new-createdDate");
            int isActive = Integer.parseInt(request.getParameter("new-isActive"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date ceatedDate = new Date(dateFormat.parse(starDate).getTime());

            NewDao newDao = new NewDao();
            newDao.updateNew(id, title, content, image, ceatedDate, isActive);
            managerNew(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }

    private void changeNewsStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("newsId"));
        int isActive = Integer.parseInt(request.getParameter("isActive"));
        NewDao dao = new NewDao();
        dao.updateNewsStatus(id, isActive);
        managerNew(request,response);
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
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String deliveryAddress = request.getParameter("deliveryAddress");
            String rentalStartDate = request.getParameter("rentalStartDate");
            String expectedReturnDate = request.getParameter("expectedReturnDate");
            String licensePlate = request.getParameter("licensePlate");
            double rentalPrice = Double.parseDouble(request.getParameter("rentalPrice"));
            int status = Integer.parseInt(request.getParameter("status"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = new Date(dateFormat.parse(rentalStartDate).getTime());
            Date endDate = new Date(dateFormat.parse(expectedReturnDate).getTime());
            OrderDao dao = new OrderDao();
            dao.updateOrder(orderId, customerId, deliveryAddress, startDate, endDate, licensePlate, rentalPrice, status);
            managerOrder(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ.");
        }
    }

    private void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        int status = Integer.parseInt(request.getParameter("status"));
        OrderDao dao = new OrderDao();
        dao.updateOrderStatus(orderId, status);
        managerOrder(request,response);
    }

    private void managerDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
    }

    private String formatUserDataForLog(User user) {
        if (user == null) {
            return "User not found or details unavailable.";
        }
        UserInfo info = user.getUserInfo();
        return String.format("ID: %d, Email: %s, FullName: %s, Phone: %s, Address: %s, BirthDate: %s, RoleID: %d, IsActive: %d",
                user.getId(),
                user.getEmail(),
                (info != null ? info.getFullName() : "N/A"),
                (info != null ? info.getPhoneNumber() : "N/A"),
                (info != null ? info.getAddress() : "N/A"),
                (info != null && info.getBirthday() != null ? info.getBirthday().toString() : "N/A"),
                user.getRoleId(),
                user.isActive()
        );
    }

    private void managerCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        List<User> users = dao.getUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin/customers.jsp").forward(request, response);
    }

    private void changeStatusUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        int adminId = getLoggedInAdminId(request);
        int userIdToChange = Integer.parseInt(request.getParameter("userId"));
        int newStatus = Integer.parseInt(request.getParameter("status"));

        User oldUser = dao.getUserById(userIdToChange);
        String oldData = formatUserDataForLog(oldUser);

        dao.changeActive(userIdToChange, newStatus);

        User newUser = dao.getUserById(userIdToChange); // Fetch updated user
        String newData = formatUserDataForLog(newUser); // Or more simply: "Status changed to: " + newStatus

        adminLogDao.addLogEntry(adminId, "CHANGE_USER_STATUS", userIdToChange, oldData, newData);
        managerCustomer(request, response);
    }

    private void changeRoleUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        int adminId = getLoggedInAdminId(request);
        int userIdToChange = Integer.parseInt(request.getParameter("userId"));
        int newRoleId = Integer.parseInt(request.getParameter("roleId"));

        User oldUser = dao.getUserById(userIdToChange);
        String oldData = formatUserDataForLog(oldUser);

        dao.changeRole(userIdToChange, newRoleId);

        User newUser = dao.getUserById(userIdToChange); // Fetch updated user
        String newData = formatUserDataForLog(newUser); // Or more simply: "RoleID changed to: " + newRoleId

        adminLogDao.addLogEntry(adminId, "CHANGE_USER_ROLE", userIdToChange, oldData, newData);
        managerCustomer(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerIdStr = request.getParameter("customerId");
        int adminId = getLoggedInAdminId(request);

        if (customerIdStr == null || customerIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is missing or invalid");
            return;
        }

        try {
            int customerIdToDelete = Integer.parseInt(customerIdStr);
            UserDao dao = new UserDao();

            User oldUser = dao.getUserById(customerIdToDelete);
            String oldData = formatUserDataForLog(oldUser);

            dao.deleteCustomer(customerIdToDelete);

            adminLogDao.addLogEntry(adminId, "DELETE_CUSTOMER", customerIdToDelete, oldData, "User data deleted successfully.");
            managerCustomer(request,response);
        } catch (NumberFormatException e) {
            adminLogDao.addLogEntry(adminId, "DELETE_CUSTOMER_FAILED", -1, "Invalid ID: " + customerIdStr, "NumberFormatException: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID format");
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        // The 'id' parameter from the form is assumed to be users.id based on UserDao.updateCustomer's usage.
        int userRecordId = -1; // For logging in case of early failure

        try {
            userRecordId = Integer.parseInt(request.getParameter("id")); // This should be users.id
            // int customerIdParam = Integer.parseInt(request.getParameter("customerId")); // This is passed to DAO but DAO's logic ignores it.

            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("emailCus");
            String address = request.getParameter("addressCus");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            int isActive = Integer.parseInt(request.getParameter("status"));
            String birthDayStr = request.getParameter("birthDateCus");

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birthDate = null;
            if (birthDayStr != null && !birthDayStr.trim().isEmpty()) {
                birthDate = new Date(dateFormat.parse(birthDayStr).getTime());
            }

            UserDao userDao = new UserDao();
            User oldUser = userDao.getUserById(userRecordId);
            String oldData = formatUserDataForLog(oldUser);

            // The second parameter to userDao.updateCustomer (userId) is not effectively used by the current DAO logic.
            // The first parameter (id) is used for all WHERE clauses and SET userdetails.userId.
            boolean success = userDao.updateCustomer(userRecordId, userRecordId, fullName, phoneNumber, birthDate, email, address, roleId, isActive);

            if (success) {
                User newUser = userDao.getUserById(userRecordId);
                String newData = formatUserDataForLog(newUser);
                adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS", userRecordId, oldData, newData);
            } else {
                adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS_FAILED", userRecordId, oldData, "DAO returned false. New data attempted: " + String.format("FN:%s, E:%s, R:%d, A:%d", fullName, email, roleId, isActive));
            }
            managerCustomer(request,response);

        } catch (Exception e) {
            e.printStackTrace();
            String attemptedData = String.format("ID:%d, FullName:%s, Email:%s", userRecordId, request.getParameter("fullName"), request.getParameter("emailCus"));
            adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS_ERROR", userRecordId, "Error during update. Attempted: " + attemptedData , "Exception: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin không hợp lệ. " + e.getMessage());
        }
    }

    private void managerVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehicleTypeDao dao = new VehicleTypeDao();
        List<VehicleType> vehicleTypeList = dao.getAllVehicleType();
        request.setAttribute("vehicleTypeList", vehicleTypeList);
        request.getRequestDispatcher("admin/motorbikes.jsp").forward(request, response);
    }

    private void deleteVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        int id = Integer.parseInt(request.getParameter("vehicleId"));
        VehicleTypeDao dao = new VehicleTypeDao();
        dao.deleteVehicleType(id, adminId);
        managerVehicleType(request, response);
    }

    private void updateVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
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
        dao.updateVehicleType(id, name, brand, category, totalPrice, description, image, totalVehicles, available, adminId);
        managerVehicleType(request, response);
    }

    private void addVehicleType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        String name = request.getParameter("addName");
        String brand = request.getParameter("addBrand");
        String category = request.getParameter("addCategory");
        double totalPrice = Double.parseDouble(request.getParameter("addTotalPrice"));
        String description = request.getParameter("addDescription");
        String image = request.getParameter("addImage");
        int totalVehicles = Integer.parseInt(request.getParameter("addTotalVehicles"));
        int available = Integer.parseInt(request.getParameter("addAvailable"));

        VehicleTypeDao dao = new VehicleTypeDao();
        dao.addVehicleType(name, brand, category, totalPrice, description, image, totalVehicles, available, adminId);
        managerVehicleType(request, response);
    }
    private void changeStatusVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        VehicleTypeDao dao = new VehicleTypeDao();
        int id = Integer.parseInt(request.getParameter("vehicleId"));
        int isAvailable = Integer.parseInt(request.getParameter("isAvailable"));
        dao.updateAvailableStatus(id, isAvailable, adminId);
        managerVehicleType(request, response);
    }
}