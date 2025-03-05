package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.OrderDao;
import vn.edu.hcmuaf.fit.doancuoiki.dao.ProductDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;


import java.io.PrintWriter;

import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));


        double price = Double.parseDouble(request.getParameter("price"));
        String location = request.getParameter("location");
        String rentalStartDate = request.getParameter("rentalStartDate");
        String rentalEndDate = request.getParameter("expectedReturnDate");


        // Chuyển đổi rentalStartDate và rentalEndDate từ String sang java.sql.Date

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = new Date(dateFormat.parse(rentalStartDate).getTime());
            Date endDate = new Date(dateFormat.parse(rentalEndDate).getTime());

            // Lấy thông tin người dùng từ session

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userId = user.getId();

            OrderDao dao = new OrderDao();
            String licensePlate = dao.getLicensePlate(pid, startDate, endDate);
            boolean success = dao.createOrder(userId, location, startDate, endDate, licensePlate, price);
            notify(request, response, pid, success);


        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ngày tháng không hợp lệ.");
        }
    }

    public void notify(HttpServletRequest request, HttpServletResponse response, int pid, boolean success) throws IOException {
        if (success) {
            response.sendRedirect("product?pid=" + pid + "&message=success");
        } else {
            response.sendRedirect("product?pid=" + pid + "&message=fail");
        }
    }

}
