package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.ContactDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Contact;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ContactController", value = "/ContactController")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Contact contact = new Contact();
        contact.setFullName(fullName);
        contact.setEmail(email);
        contact.setMessage(message);
        contact.setProcessingStatus("Chưa đọc");

        ContactDao contactDao = new ContactDao();
        try {
            if(contactDao.createContact(contact)){
                request.setAttribute("success", true);
            }else {
                request.setAttribute("success", false);
                request.setAttribute("fullName", fullName);
                request.setAttribute("email", email);
                request.setAttribute("message", message);
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("contact-us.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}