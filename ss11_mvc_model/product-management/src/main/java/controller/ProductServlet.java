package controller;

import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controller.ProductServlet", value = "/product-servlet")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            System.out.println("123");
            action = "";
        }
        switch (action) {
            case "add":
                request.getRequestDispatcher("add.jsp").forward(request, response);
                break;
            case "update":
                Integer id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String brand = request.getParameter("brand");
                Double price = Double.parseDouble(request.getParameter("price"));
                request.setAttribute("product", new Product(id, name, brand, price));
                request.getRequestDispatcher("update.jsp").forward(request, response);
                break;
            case "delete":
                productService.delete(Integer.parseInt(request.getParameter("id")));
                display(request, response, productService.display());
                break;
            case "find":
                System.out.println("abc");
                productService.find(request.getParameter("name"));
                display(request, response, productService.find(request.getParameter("name")));
                break;
            default:
                display(request, response, productService.display());
                break;
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response, ArrayList<Product> list) throws ServletException, IOException {

        request.setAttribute("list", list);
        RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addPost(request, response);
                break;
            case "update":
                updatePost(request);
                display(request, response, productService.display());
                break;
            case "delete":
                break;
            case "product":
                break;
            case "find":
                break;
            default:

                break;
        }

    }

    private void updatePost(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        Double price;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            price = null;
        }
        productService.update(new Product(id, name, brand, price));
    }

    private void addPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            id = null;
        }
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        Double price;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            price = null;
        }
        productService.add(new Product(id, name, brand, price));
        request.getRequestDispatcher("add.jsp").forward(request, response);
    }

}
