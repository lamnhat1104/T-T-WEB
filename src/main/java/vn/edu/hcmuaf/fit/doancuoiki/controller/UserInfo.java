package vn.edu.hcmuaf.fit.doancuoiki.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;

@WebServlet(name = "UserInfo", value = "/UserInfo")
public class UserInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fullName = request.getParameter("editUsername");
        String email = request.getParameter("editEmail");
        String phone = request.getParameter("editPhone");
        String address = request.getParameter("editAddress");

        // Gọi DAO để cập nhật
        UserDao userDAO = new UserDao();
        boolean isUpdated = userDAO.updateUser(user.getId(), fullName, email, address, phone);

        // Gọi DAO để cập nhật vào database
        if (isUpdated) {
            // Cập nhật lại session
            user.setEmail(email);
            user.getUserInfo().setFullName(fullName);
            user.getUserInfo().setPhoneNumber(phone);
            user.getUserInfo().setAddress(address);
            session.setAttribute("user", user);

            // Redirect về trang tài khoản với thông báo thành công
            response.sendRedirect("account.jsp?success=true");
        } else {
            // Redirect về trang tài khoản với thông báo lỗi
            response.sendRedirect("account.jsp?error=true");
        }
    }
}