package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Logout", value = "/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Lấy session hiện tại (không tạo mới)
        if (session != null) {
            User user = (User) session.getAttribute("user"); // Lấy thông tin user từ session
            if (user != null) {
                UserDao userDao = new UserDao();
                try {
                    userDao.updateLogoutTime(user.getEmail()); // Cập nhật logout_time vào database
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            session.invalidate(); // Xóa session
        }
        response.sendRedirect("index.jsp"); // Chuyển hướng về trang chính
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}