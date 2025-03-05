package vn.edu.hcmuaf.fit.doancuoiki.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;
import vn.edu.hcmuaf.fit.doancuoiki.model.cart.Cart;
import vn.edu.hcmuaf.fit.doancuoiki.service.ProductService;

import java.io.IOException;

@WebServlet(name = "addCart", value = "/add-cart")
public class Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        Product pid = ps.getDetail(request.getParameter("pid"));
        if(pid==null){
            response.sendRedirect("PagingProduct?addCart=false");
        }
        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if(c==null) c=new Cart();
        c.add(pid);

        session.setAttribute("cart", c);
        response.sendRedirect("PagingProduct?addCart=true");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}