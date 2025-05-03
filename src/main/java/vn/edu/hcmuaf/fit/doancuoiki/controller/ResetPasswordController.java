package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.util.Encrypt;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", value = "/ResetPasswordController")
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        UserDao dao = new UserDao();

        if (dao.checkConditionResetPassword(token)) {
            request.setAttribute("token", token);
            RequestDispatcher rd = request.getRequestDispatcher("change_password.jsp");
            rd.forward(request, response);
        }
        else {
            request.setAttribute("message", "Token không hợp lệ");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (token == null || token.isEmpty()) {
            request.setAttribute("message", "Token không hợp lệ");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Mật khẩu nhập lại không khớp");
            request.setAttribute("token", token);
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }

        String newPassword = Encrypt.encrypt(password);
        UserDao dao = new UserDao();

        if (dao.checkConditionResetPassword(token) && dao.resetPassword(newPassword, token)) {
            request.setAttribute("message", "Đổi mật khẩu thành công");
        } else {
            request.setAttribute("message", "Đổi mật khẩu thất bại hoặc token không hợp lệ");
        }

        request.setAttribute("token", token); // giữ lại token nếu cần submit lại
        request.getRequestDispatcher("change_password.jsp").forward(request, response);
    }

}