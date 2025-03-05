//package vn.edu.hcmuaf.fit.doancuoiki.controller;
//
//import vn.edu.hcmuaf.fit.doancuoiki.model.Product;
//import vn.edu.hcmuaf.fit.doancuoiki.service.IProductService;
//import vn.edu.hcmuaf.fit.doancuoiki.service.ProductService;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(name = "ProductController", value = "/ProductController")
//public class ProductController extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        IProductService productService = new ProductService();
//        List<Product> products = productService.findAll();
//        request.setAttribute("products",products);
//        String url = "/page-product.jsp";
//        request.getRequestDispatcher(url).forward(request,response);
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//}