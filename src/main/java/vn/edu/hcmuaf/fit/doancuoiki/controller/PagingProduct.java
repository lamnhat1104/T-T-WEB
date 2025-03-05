package vn.edu.hcmuaf.fit.doancuoiki.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.ProductDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "PagingProduct", value = "/PagingProduct")
public class PagingProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String indexPage =request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }
        int index = Integer.parseInt(indexPage);
        ProductDao dao = new ProductDao();
        int count = dao.getTatolProduct();
        int endPage = count/8;
        if(count % 8 !=0){
            endPage++;
        }
        List<Product> list = dao.listPro(index);

        // Đưa dữ liệu lên request để hiển thị
        request.setAttribute("listA", list);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", indexPage);

        // Forward đến trang JSP
        request.getRequestDispatcher("page-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}