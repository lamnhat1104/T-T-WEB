package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;

@WebServlet("/facebook-login")
public class FacebookLoginServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String picture = req.getParameter("picture");

        User user = new User();
        user.getFacebookId(id);
        user.setName(name);
        user.setEmail(email);
        user.setAvata(picture);

        req.getSession().setAttribute("user", user);
        resp.sendRedirect("index.jsp");

    }
}
