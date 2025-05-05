package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/verifyAccount")
public class VerifyAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String otpInput = request.getParameter("otp");
        HttpSession session = request.getSession();
        String expectedOtp = (String) session.getAttribute("otp"); //
        String otp = String.valueOf((int)(Math.random() * 900000) + 100000);
        session.setAttribute("otp", otp);

        if (otpInput != null && otpInput.equals(expectedOtp)) {
            // Đánh dấu tài khoản đã xác minh
            session.setAttribute("verified", true);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("message", "Mã xác minh không đúng. Vui lòng thử lại.");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        }
    }
}
