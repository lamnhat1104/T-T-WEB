package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doancuoiki.dao.UserDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;

@WebServlet("/google-login")
public class GoogleLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String picture = req.getParameter("picture");

        // Tạo user object
        User user = new User();
        user.setFullname(name);
        user.setEmail(email);
        user.setAvatar(picture);
        user.setRole("user"); // default role

        // Lưu vào DB (nếu cần)
        UserDao dao = new UserDao();
        dao.insertGoogleUser(user); // cần kiểm tra trùng email thì tốt hơn

        // Lưu vào session
        req.getSession().setAttribute("user", user);

        // Redirect về trang chính
        resp.sendRedirect("index.jsp");
    }
}
