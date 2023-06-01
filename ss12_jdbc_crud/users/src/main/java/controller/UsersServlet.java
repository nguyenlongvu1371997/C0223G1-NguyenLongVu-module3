package controller;

import model.Users;
import service.UsersService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersServlet", value = "/users-servlet")
public class UsersServlet extends HttpServlet {
    UsersService usersService = new UsersService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String country = request.getParameter("country");
                Users user = new Users(id, name, email, country);
                request.setAttribute("user", user);
                request.getRequestDispatcher("update.jsp").forward(request, response);
            default:
                displayListUsers(request, response);
                break;
        }
    }

    private void displayListUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Users> list = usersService.display();
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
            case "create":
                createPost(request, response);
                break;
            case "remove":
                int id = Integer.parseInt(request.getParameter("id"));
                usersService.delete(id);
                displayListUsers(request, response);
                break;
            case "update":
                updatePost(request);
                displayListUsers(request, response);
            default:
                break;
        }
    }

    private void updatePost(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        usersService.update(id, new Users(name, email, country));
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        usersService.create(new Users(name, email, country));
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }
}
