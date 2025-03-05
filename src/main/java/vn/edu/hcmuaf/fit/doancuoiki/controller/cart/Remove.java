package vn.edu.hcmuaf.fit.doancuoiki.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.cart.Cart;

import java.io.IOException;

@WebServlet(name = "del", value = "/del-cart")
public class Remove extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = -1;
        try{
            pid = Integer.parseInt(request.getParameter("pid"));
        }
        catch(NumberFormatException e){
            response.sendRedirect("showCart");
        }

        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null){
            cart = new Cart();
        }
        cart.remove(pid);
        session.setAttribute("cart", cart);
        response.sendRedirect("showCart");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}