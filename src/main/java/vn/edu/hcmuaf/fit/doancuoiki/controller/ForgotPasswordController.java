package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.util.Email;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "ForgotPasswordController", value = "/ForgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDao dao = new UserDao();
        String message = "";
        if(dao.isEmailExists(email)) {
            String token = UUID.randomUUID().toString();
            long expiryTime = System.currentTimeMillis() + 30 * 60 * 1000; // Token hết hạn sau 30 phút
            dao.createToken(token, expiryTime, email);
            String resetLink = "http://localhost:8080/DoAnCuoiKi/ResetPasswordController?token=" + token;
            Email.send(email, "Thuê xe máy - Đặt lại mật khẩu", "Click vào link để đặt lại mật khẩu "+ resetLink+"\nLink sẽ hết hạn sau 30 phút.");
            message = "Link đặt lại mật khẩu đã được gửi vào email của bạn";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("forgot_password.jsp");
            dispatcher.forward(request, response);
        }
        else {
            message = "Không tìm thấy email";
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("forgot_password.jsp");
            dispatcher.forward(request, response);
        }
    }
}