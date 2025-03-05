package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;
import vn.edu.hcmuaf.fit.doancuoiki.service.ProductService2;

import java.io.IOException;

@WebServlet(name = "add", value = "/add")
public class Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService2 ps = new ProductService2();
        Product pid = ps.getDetail(request.getParameter("pid"));
        if(pid==null){
            response.sendRedirect("page-product?addCart=false");
        }
        response.sendRedirect("page-product?addCart=true");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}