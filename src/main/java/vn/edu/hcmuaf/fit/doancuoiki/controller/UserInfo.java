package vn.edu.hcmuaf.fit.doancuoiki.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;

@WebServlet(name = "UserInfo", value = "/UserInfo")
public class UserInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp"); // Nếu chưa đăng nhập, yêu cầu login
            return;
        }
        request.setAttribute("user", user); // Đẩy user vào request
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}