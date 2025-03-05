package vn.edu.hcmuaf.fit.doancuoiki.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.doancuoiki.dao.VehicleDao;
import vn.edu.hcmuaf.fit.doancuoiki.model.Vehicle;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MotorbikeControl", value = "/MotorbikeControl")
public class NumberPlateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehicleDao vehicleDao = new VehicleDao();
        List<Vehicle> vehicles = vehicleDao.getALL();
        request.setAttribute("vehicles", vehicles);
        request.getRequestDispatcher("admin/biensoxe.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}