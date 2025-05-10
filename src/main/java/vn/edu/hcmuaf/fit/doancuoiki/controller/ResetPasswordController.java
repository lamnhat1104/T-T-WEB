package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;
import vn.edu.hcmuaf.fit.doancuoiki.util.Encrypt;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", value = "/ResetPasswordController")
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("change_password.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Mật khẩu nhập lại không khớp");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp"); // nếu chưa đăng nhập
            return;
        }

        String newPassword = Encrypt.encrypt(password);
        UserDao dao = new UserDao();

        boolean success = dao.updatePassword(user.getId(), newPassword);
        if (success) {
            request.setAttribute("changeSuccess", true);
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Đổi mật khẩu thất bại");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
        }


    }

}