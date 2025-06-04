package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import vn.edu.hcmuaf.fit.doancuoiki.dao.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.Order; // Already imported
import vn.edu.hcmuaf.fit.doancuoiki.model.UserInfo;

import java.io.IOException;
import java.sql.Date; // Keep this for request parameter parsing
import java.text.ParseException;
import java.text.SimpleDateFormat;
// import java.time.LocalDate; // Not directly used here but through model
// import java.time.format.DateTimeFormatter; // Not directly used here
import java.util.List;




@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {
    private AdminLogUserDao adminLogDao = new AdminLogUserDao(); // For user actions
    private AdminLogOrderDao adminLogOrderDao = new AdminLogOrderDao(); // For order actions

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
        return 0; // Should ideally handle this more gracefully, e.g., by denying action
    }

    // Helper method to format Order data for logging
    private String formatOrderDataForLog(Order order) {
        if (order == null) {
            return "Order not found or details unavailable.";
        }
        // Use java.text.SimpleDateFormat because Order model uses java.util.Date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("OrderID: %d, CustomerID: %d, ", order.getId(), order.getCustomerId()));
        sb.append(String.format("DeliveryAddress: '%s', ", order.getDeliveryAddress()));
        sb.append(String.format("CreatedDate: %s, ", order.getCreatedDate() != null ? sdf.format(order.getCreatedDate()) : "N/A"));
        sb.append(String.format("RentalStartDate: %s, ", order.getRetalStarDate() != null ? sdf.format(order.getRetalStarDate()) : "N/A"));
        sb.append(String.format("ExpectedReturnDate: %s, ", order.getExpectedReturnDate() != null ? sdf.format(order.getExpectedReturnDate()) : "N/A"));
        sb.append(String.format("Status: %d, ", order.getStatus()));
        if (order.getOrderDetail() != null) {
            sb.append(String.format("OrderDetail (LicensePlate: '%s', VehicleName: '%s', PriceAtOrder: %.2f), ",
                    order.getOrderDetail().getLicensePlate(),
                    order.getOrderDetail().getVehicleName(),
                    order.getOrderDetail().getPriceAtOrder()));
        } else {
            sb.append("OrderDetail: N/A, ");
        }
        if (order.getPromotion() != null) {
            sb.append(String.format("Promotion (ID: %d, Name: '%s', DiscountValue: %.2f, DiscountType: %d)",
                    order.getPromotion().getId(),
                    order.getPromotion().getPromotionName(),
                    order.getPromotion().getDiscountValue(),
                    order.getPromotion().getDiscountType()));
        } else {
            sb.append("Promotion: N/A");
        }
        return sb.toString();
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
            // Parse to java.util.Date first, then convert to java.sql.Date for DAO
            java.util.Date parsedStartDate = dateFormat.parse(startDatee);
            java.util.Date parsedEndDate = dateFormat.parse(endDatee);
            Date startDate = new Date(parsedStartDate.getTime());
            Date endDate = new Date(parsedEndDate.getTime());


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
            String rentalStartDateStr = request.getParameter("startDate");
            String expectedReturnDateStr = request.getParameter("endDate");
            int isActive = Integer.parseInt(request.getParameter("isActive"));
            int discountType = Integer.parseInt(request.getParameter("discountType"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedStartDate = dateFormat.parse(rentalStartDateStr);
            java.util.Date parsedEndDate = dateFormat.parse(expectedReturnDateStr);
            Date startDate = new Date(parsedStartDate.getTime());
            Date endDate = new Date(parsedEndDate.getTime());

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
            String startDateStr = request.getParameter("created-date");
            int isActive = Integer.parseInt(request.getParameter("is-active"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(startDateStr);
            Date createdDate = new Date(parsedDate.getTime());


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
            String starDateStr = request.getParameter("new-createdDate");
            int isActive = Integer.parseInt(request.getParameter("new-isActive"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(starDateStr);
            Date ceatedDate = new Date(parsedDate.getTime());


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
        VehicleTypeDao dao = new VehicleTypeDao();
        List<VehicleType> vehicleTypeList = dao.getAllVehicleType();
        request.setAttribute("vehicleTypeList", vehicleTypeList);
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
        int adminId = getLoggedInAdminId(request);
        int orderId = -1;
        String oldData = "N/A";
        OrderDao orderDao = new OrderDao();

        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
            Order oldOrder = orderDao.getOrderById(orderId); // Fetch before delete
            if (oldOrder != null) {
                oldData = formatOrderDataForLog(oldOrder);
            } else {
                oldData = "Order with ID " + orderId + " not found before deletion.";
            }

            orderDao.deleteOrder(orderId);
            adminLogOrderDao.addLogEntry(adminId, "DELETE_ORDER", orderId, oldData, "Order data deleted successfully.");

        } catch (NumberFormatException e) {
            adminLogOrderDao.addLogEntry(adminId, "DELETE_ORDER_FAILED", orderId, oldData, "Invalid Order ID format: " + request.getParameter("orderId"));
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID.");
            return;
        } catch (Exception e) {
            adminLogOrderDao.addLogEntry(adminId, "DELETE_ORDER_ERROR", orderId, oldData, "Error deleting order: " + e.getMessage());
            e.printStackTrace(); // For server logs
            // Optionally send an error to client, or just log and proceed
        }
        managerOrder(request,response);
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        int orderId = -1;
        String oldData = "N/A";
        OrderDao dao = new OrderDao();

        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
            Order oldOrder = dao.getOrderById(orderId); // Fetch before update
            if (oldOrder != null) {
                oldData = formatOrderDataForLog(oldOrder);
            } else {
                oldData = "Order with ID " + orderId + " not found before update.";
            }

            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String deliveryAddress = request.getParameter("deliveryAddress");
            String rentalStartDateStr = request.getParameter("rentalStartDate");
            String expectedReturnDateStr = request.getParameter("expectedReturnDate");
            String licensePlate = request.getParameter("licensePlate");
            double rentalPrice = Double.parseDouble(request.getParameter("rentalPrice"));
            int status = Integer.parseInt(request.getParameter("status"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            // Parse to java.util.Date first for SimpleDateFormat
            java.util.Date utilStartDate = dateFormat.parse(rentalStartDateStr);
            java.util.Date utilEndDate = dateFormat.parse(expectedReturnDateStr);
            // Convert to java.sql.Date for DAO
            Date startDate = new Date(utilStartDate.getTime());
            Date endDate = new Date(utilEndDate.getTime());

            dao.updateOrder(orderId, customerId, deliveryAddress, startDate, endDate, licensePlate, rentalPrice, status);

            Order newOrder = dao.getOrderById(orderId); // Fetch after update
            String newData = "N/A";
            if (newOrder != null) {
                newData = formatOrderDataForLog(newOrder);
            } else {
                newData = "Order with ID " + orderId + " not found after update (update might have failed silently or ID changed).";
            }
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER", orderId, oldData, newData);

        } catch (ParseException e) {
            e.printStackTrace();
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER_ERROR", orderId, oldData, "Date parsing error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng ngày không hợp lệ.");
            return;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER_ERROR", orderId, oldData, "Number parsing error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu số không hợp lệ.");
            return;
        }
        catch (Exception e) {
            e.printStackTrace();
            String attemptedData = String.format("OrderID:%d, CustID:%s, Addr:%s", orderId, request.getParameter("customerId"), request.getParameter("deliveryAddress"));
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER_ERROR", orderId, oldData, "General error during update. Attempted: " + attemptedData + ". Exception: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi cập nhật đơn hàng.");
            return;
        }
        managerOrder(request,response);
    }

    private void updateOrderStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        int orderId = -1;
        String oldData = "N/A";
        OrderDao dao = new OrderDao();

        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
            int newStatus = Integer.parseInt(request.getParameter("status"));

            Order oldOrder = dao.getOrderById(orderId); // Fetch before update
            if (oldOrder != null) {
                oldData = formatOrderDataForLog(oldOrder);
            } else {
                oldData = "Order with ID " + orderId + " not found before status update.";
            }

            dao.updateOrderStatus(orderId, newStatus);

            Order newOrder = dao.getOrderById(orderId); // Fetch after update
            String newData = "N/A";
            if (newOrder != null) {
                newData = formatOrderDataForLog(newOrder);
            } else {
                newData = "Order with ID " + orderId + " not found after status update.";
            }
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER_STATUS", orderId, oldData, newData);

        } catch (NumberFormatException e) {
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER_STATUS_FAILED", orderId, oldData, "Invalid Order ID or Status format. OrderID: " + request.getParameter("orderId") + ", Status: " + request.getParameter("status") );
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID or Status.");
            return;
        } catch (Exception e) {
            adminLogOrderDao.addLogEntry(adminId, "UPDATE_ORDER_STATUS_ERROR", orderId, oldData, "Error updating order status: " + e.getMessage());
            e.printStackTrace();
        }
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
        // Using java.text.SimpleDateFormat for birthDate if it's java.util.Date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String birthDateStr = "N/A";
        if (info != null && info.getBirthday() != null) {
            // Assuming getBirthday() in UserInfo returns java.util.Date
            birthDateStr = sdf.format(info.getBirthday());
        }

        return String.format("ID: %d, Email: %s, FullName: %s, Phone: %s, Address: %s, BirthDate: %s, RoleID: %d, IsActive: %d",
                user.getId(),
                user.getEmail(),
                (info != null ? info.getFullName() : "N/A"),
                (info != null ? info.getPhoneNumber() : "N/A"),
                (info != null ? info.getAddress() : "N/A"),
                birthDateStr,
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
        int customerIdToDelete = -1; // For logging in case of parse failure
        String oldData = "N/A";
        UserDao dao = new UserDao();


        if (customerIdStr == null || customerIdStr.trim().isEmpty()) {
            adminLogDao.addLogEntry(adminId, "DELETE_CUSTOMER_FAILED", -1, "Attempted with missing ID", "Customer ID is missing or invalid");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is missing or invalid");
            return;
        }

        try {
            customerIdToDelete = Integer.parseInt(customerIdStr);
            User oldUser = dao.getUserById(customerIdToDelete);
            if(oldUser != null) {
                oldData = formatUserDataForLog(oldUser);
            } else {
                oldData = "User with ID " + customerIdToDelete + " not found before deletion.";
            }
            dao.deleteCustomer(customerIdToDelete);
            adminLogDao.addLogEntry(adminId, "DELETE_CUSTOMER", customerIdToDelete, oldData, "User data deleted successfully.");

        } catch (NumberFormatException e) {
            adminLogDao.addLogEntry(adminId, "DELETE_CUSTOMER_FAILED", customerIdToDelete, oldData, "Invalid ID format: " + customerIdStr + ". Error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID format");
            return;
        }  catch (Exception e) {
            adminLogDao.addLogEntry(adminId, "DELETE_CUSTOMER_ERROR", customerIdToDelete, oldData, "Error deleting customer: " + e.getMessage());
            e.printStackTrace();
        }
        managerCustomer(request,response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        int userRecordId = -1;
        String oldData = "N/A";
        UserDao userDao = new UserDao();

        try {
            userRecordId = Integer.parseInt(request.getParameter("id"));
            User oldUser = userDao.getUserById(userRecordId);
            if(oldUser != null) {
                oldData = formatUserDataForLog(oldUser);
            } else {
                oldData = "User with ID " + userRecordId + " not found before update.";
            }

            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("emailCus");
            String address = request.getParameter("addressCus");
            int roleId = Integer.parseInt(request.getParameter("roleId"));
            int isActive = Integer.parseInt(request.getParameter("status"));
            String birthDayStr = request.getParameter("birthDateCus");

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            // This should be java.sql.Date for the DAO method
            Date birthDate = null;
            if (birthDayStr != null && !birthDayStr.trim().isEmpty()) {
                java.util.Date utilBirthDate = dateFormat.parse(birthDayStr);
                birthDate = new Date(utilBirthDate.getTime());
            }

            boolean success = userDao.updateCustomer(userRecordId, userRecordId, fullName, phoneNumber, birthDate, email, address, roleId, isActive);
            String newData = "N/A";
            if (success) {
                User newUser = userDao.getUserById(userRecordId);
                if (newUser != null) {
                    newData = formatUserDataForLog(newUser);
                } else {
                    newData = "User with ID " + userRecordId + " not found after update.";
                }
                adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS", userRecordId, oldData, newData);
            } else {
                newData = "DAO returned false. New data attempted: " + String.format("FN:%s, E:%s, R:%d, A:%d", fullName, email, roleId, isActive);
                adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS_FAILED", userRecordId, oldData, newData);
            }

        } catch (ParseException e) {
            e.printStackTrace();
            adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS_ERROR", userRecordId, oldData, "Date parsing error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng ngày sinh không hợp lệ.");
            return;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS_ERROR", userRecordId, oldData, "Number parsing error: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Dữ liệu số không hợp lệ.");
            return;
        }
        catch (Exception e) {
            e.printStackTrace();
            String attemptedData = String.format("ID:%d, FullName:%s, Email:%s", userRecordId, request.getParameter("fullName"), request.getParameter("emailCus"));
            adminLogDao.addLogEntry(adminId, "UPDATE_CUSTOMER_DETAILS_ERROR", userRecordId, oldData , "Exception: " + e.getMessage() + ". Attempted: " + attemptedData);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi cập nhật thông tin khách hàng.");
            return;
        }
        managerCustomer(request,response);
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
        // Note: VehicleTypeDao.deleteVehicleType already handles its own logging via AdminLogVehicleDao
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
        // Note: VehicleTypeDao.updateVehicleType already handles its own logging
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
        // Note: VehicleTypeDao.addVehicleType already handles its own logging
        dao.addVehicleType(name, brand, category, totalPrice, description, image, totalVehicles, available, adminId);
        managerVehicleType(request, response);
    }
    private void changeStatusVehicle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adminId = getLoggedInAdminId(request);
        VehicleTypeDao dao = new VehicleTypeDao();
        int id = Integer.parseInt(request.getParameter("vehicleId"));
        int isAvailable = Integer.parseInt(request.getParameter("isAvailable"));
        // Note: VehicleTypeDao.updateAvailableStatus already handles its own logging
        dao.updateAvailableStatus(id, isAvailable, adminId);
        managerVehicleType(request, response);
    }
}