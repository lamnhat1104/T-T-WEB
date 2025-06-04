package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;
import vn.edu.hcmuaf.fit.doancuoiki.dao.ProductDao;

import java.io.IOException;

@WebServlet("/momoPayment")
public class MomoPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String productId = req.getParameter("pid");
        String price = req.getParameter("price");
        String location = req.getParameter("location");
        String startDate = req.getParameter("rentalStartDate");
        String endDate = req.getParameter("expectedReturnDate");
        String deliveryFee = req.getParameter("deliveryFee");

        // Tính số ngày thuê
        int days = 1;
        try {
            java.time.LocalDate start = java.time.LocalDate.parse(startDate);
            java.time.LocalDate end = java.time.LocalDate.parse(endDate);
            days = (int) java.time.temporal.ChronoUnit.DAYS.between(start, end);
            if (days <= 0) days = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        double pricePerDay = Double.parseDouble(price);
        double fee = Double.parseDouble(deliveryFee);
        double total = pricePerDay * days + fee;

        // ✅ Gọi DAO để lấy Product
        ProductDao productDao = new ProductDao();
        Product p = productDao.getProductById(Integer.parseInt(productId));

        // ✅ Lưu vào session
        HttpSession session = req.getSession();
        session.setAttribute("p", p);
        session.setAttribute("rentalStartDate", startDate);
        session.setAttribute("expectedReturnDate", endDate);
        session.setAttribute("location", location);
        session.setAttribute("totalPrice", total);
        session.setAttribute("orderId", System.currentTimeMillis()); // Mã đơn hàng tạm thời

        // ✅ Chuyển đến trang thanh toán MoMo
        resp.sendRedirect("momoPayment.jsp");
    }
}