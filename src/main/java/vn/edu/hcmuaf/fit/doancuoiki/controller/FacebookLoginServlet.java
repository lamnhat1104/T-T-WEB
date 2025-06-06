package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;

@WebServlet("/facebook-login")
public class FacebookLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String picture = req.getParameter("picture");

        User user = new User();
        user.setEmail(email);
        user.setFullname(name);
        user.setAvatar(picture);
        user.setRole("user"); // hoặc "facebook_user" nếu bạn muốn tách biệt

        // Lưu thông tin user vào session
        req.getSession().setAttribute("user", user);

        // Chuyển hướng về trang chính
        resp.sendRedirect("index.jsp");
    }
}
