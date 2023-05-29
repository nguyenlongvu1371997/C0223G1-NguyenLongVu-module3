package com.example.exercise;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangeServlet", value = "/ChangeServlet")
public class ChangeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double priceDiscount = price * discount * 0.01;
        double price2 = price - priceDiscount;
        String string = request.getParameter("description");
        request.setAttribute("priceDiscount", priceDiscount);
        request.setAttribute("price2", price2);
        RequestDispatcher rd = request.getRequestDispatcher("discount.jsp");
        rd.forward(request, response);
    }
}
