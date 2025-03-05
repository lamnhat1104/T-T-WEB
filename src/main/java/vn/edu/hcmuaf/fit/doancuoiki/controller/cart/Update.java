package vn.edu.hcmuaf.fit.doancuoiki.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.ShoppingCart;
import vn.edu.hcmuaf.fit.doancuoiki.model.cart.Cart;

import java.io.IOException;

@WebServlet(name = "Update", value = "/update-cart")
public class Update extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String quantityStr = request.getParameter("quanlity");
        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (idStr == null || idStr.isEmpty() || quantityStr == null || quantityStr.isEmpty()) {
            request.setAttribute("error", "ID và số lượng không được để trống");
            request.getRequestDispatcher("showCart").forward(request, response);
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            int quantity = Integer.parseInt(quantityStr);

            if (quantity > 0) {
                c.update2(id, quantity);
            } else {
                request.setAttribute("error", "Số lượng phải lớn hơn 0");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID hoặc số lượng không hợp lệ");
        }
        session.setAttribute("cart", c);
        response.sendRedirect("showCart");

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}