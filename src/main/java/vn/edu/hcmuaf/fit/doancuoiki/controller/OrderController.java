package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.OrderDao;
import vn.edu.hcmuaf.fit.doancuoiki.dao.ProductDao;
import vn.edu.hcmuaf.fit.doancuoiki.dao.PromotionDao;
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
        HttpSession session2 = request.getSession();
        Double discountedPrice = (Double) session2.getAttribute("discountedPrice");
        double price = discountedPrice != null
                ? discountedPrice
                : Double.parseDouble(request.getParameter("price"));
        String location = request.getParameter("location");
        String rentalStartDate = request.getParameter("rentalStartDate");
        String rentalEndDate = request.getParameter("expectedReturnDate");
        String couponCode = request.getParameter("coupon"); // ⬅️ Lấy mã giảm giá
        System.out.println("Mã giảm giá nhập vào: " + couponCode); // 👈 Log để kiểm tra
        int promotionId = -1;
        // Kiểm tra mã giảm giá
        if (couponCode != null && !couponCode.trim().isEmpty()) {
            PromotionDao promoDao = new PromotionDao();
            promotionId = promoDao.getIdByCode(couponCode);
            System.out.println("ID mã giảm giá lấy được: " + promotionId); // 👈 Log kết quả tìm mã
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startDate = new Date(dateFormat.parse(rentalStartDate).getTime());
            Date endDate = new Date(dateFormat.parse(rentalEndDate).getTime());

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userId = user.getId();

            OrderDao dao = new OrderDao();
            String licensePlate = dao.getLicensePlate(pid, startDate, endDate);

            // Gọi hàm tạo đơn hàng với promotionId
            boolean success = dao.createOrder(userId, location, startDate, endDate, licensePlate, price, promotionId);
            notify(request, response, pid, success);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ngày tháng không hợp lệ.");
        }
    }
    private void notify(HttpServletRequest request, HttpServletResponse response, int pid, boolean success) throws IOException {
        if (success) {
            HttpSession session = request.getSession();
            session.removeAttribute("appliedPromotion");
            session.removeAttribute("discountedPrice");
            response.sendRedirect("product?pid=" + pid + "&message=success");
        } else {
            response.sendRedirect("product?pid=" + pid + "&message=fail");
        }
    }



}
