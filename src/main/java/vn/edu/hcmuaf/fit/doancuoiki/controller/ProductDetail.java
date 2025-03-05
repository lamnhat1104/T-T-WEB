package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.ProductDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;
import vn.edu.hcmuaf.fit.doancuoiki.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/product")
public class ProductDetail extends HttpServlet {
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String pidParam = request.getParameter("pid");
            if (pidParam == null || pidParam.isEmpty()) {
                throw new IllegalArgumentException("Tham số 'pid' là bắt buộc.");
            }

            int pid = Integer.parseInt(pidParam);

            ProductDao productDao = new ProductDao();
            Product product = productDao.getUnbookedProductById(pid);

            if (product == null) {
                throw new IllegalArgumentException("Không tìm thấy sản phẩm với ID: " + pid);
            }

            // Lấy danh sách sản phẩm liên quan
            List<Product> relatedProducts = productDao.getRelatedProducts(pid);

            // Gửi sản phẩm và danh sách sản phẩm liên quan đến JSP
            request.setAttribute("p", product);
            request.setAttribute("relatedProducts", relatedProducts);

            request.getRequestDispatcher("product-detail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số 'pid' phải là một số nguyên hợp lệ.");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi xử lý yêu cầu.");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}