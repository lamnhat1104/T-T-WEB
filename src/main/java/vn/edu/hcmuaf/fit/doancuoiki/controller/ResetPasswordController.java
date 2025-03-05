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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        String newPassword = Encrypt.encrypt(password);
        UserDao dao = new UserDao();
        if (dao.resetPassword(newPassword, token)) {
            request.setAttribute("message", "Đôi mật khẩu thành công");
            RequestDispatcher dispatcher = request.getRequestDispatcher("change_password.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Đổi mật khẩu thất bại");
            RequestDispatcher dispatcher = request.getRequestDispatcher("change_password.jsp");
            dispatcher.forward(request, response);
        }
    }
}