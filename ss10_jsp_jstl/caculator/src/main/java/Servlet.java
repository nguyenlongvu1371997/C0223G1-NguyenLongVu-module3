import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String math = request.getParameter("math");
        Double result = null;
        Double number1 = Double.parseDouble(request.getParameter("number1"));
        Double number2 = Double.parseDouble(request.getParameter("number2"));
        switch (math) {
            case "plus":
                result = number1 + number2;
                break;
            case "minus":
                result = number1 - number2;
                break;
            case "multiply":
                result = number1 * number2;
                break;
            case "divide":
                result = number1 / number2;
                break;
            default:
                break;
        }
        request.setAttribute("result", result);
        RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
        dispatcher.forward(request, response);


    }
}
