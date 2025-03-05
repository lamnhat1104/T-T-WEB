package vn.edu.hcmuaf.fit.doancuoiki.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;
import vn.edu.hcmuaf.fit.doancuoiki.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/list-product")
public class ListProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService service = new ProductService();
        List<Product> all = service.getAll();
        request.setAttribute("data", all);
        request.getRequestDispatcher("page-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}