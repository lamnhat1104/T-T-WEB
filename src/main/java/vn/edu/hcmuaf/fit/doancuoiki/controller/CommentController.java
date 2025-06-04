package vn.edu.hcmuaf.fit.doancuoiki.controller;

import com.google.gson.Gson; // Import Gson
import com.google.gson.GsonBuilder;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.CommentDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Comment;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Typically not used for submitting comments, but could be used for fetching
        // For this example, we'll focus on POST
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported for this operation.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create(); // Match JSP date format
        Map<String, Object> result = new HashMap<>();

        try {
            int productId = Integer.parseInt(request.getParameter("product_id"));
            String commentText = request.getParameter("comment");
            User user = (User) request.getSession().getAttribute("user");

            if (user != null && user.getUserInfo() != null && commentText != null && !commentText.trim().isEmpty()) {
                Comment newComment = CommentDao.insertComment(productId, user.getUserInfo().getFullName(), commentText);

                if (newComment != null) {
                    result.put("success", true);
                    result.put("comment", newComment);
                } else {
                    result.put("success", false);
                    result.put("message", "Không thể gửi bình luận. Vui lòng thử lại.");
                }
            } else if (user == null || user.getUserInfo() == null) {
                result.put("success", false);
                result.put("message", "Bạn cần đăng nhập để bình luận.");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 Unauthorized
            } else {
                result.put("success", false);
                result.put("message", "Nội dung bình luận không được để trống.");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            }
        } catch (NumberFormatException e) {
            result.put("success", false);
            result.put("message", "ID sản phẩm không hợp lệ.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            e.printStackTrace();
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Đã xảy ra lỗi máy chủ. " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
            e.printStackTrace();
        }

        out.print(gson.toJson(result));
        out.flush();
    }
}