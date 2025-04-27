package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.CommentDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        String commentText = request.getParameter("comment");
        User user = (User) request.getSession().getAttribute("user");

        if (user != null && commentText != null && !commentText.trim().isEmpty()) {
            CommentDao.insertComment(productId, user.getUserInfo().getFullName(), commentText);
        }

        // Redirect về trang chi tiết sản phẩm
        response.sendRedirect("product?pid=" + productId);
    }

}