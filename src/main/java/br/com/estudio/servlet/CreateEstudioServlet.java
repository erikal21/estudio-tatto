package br.com.estudio.servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/create-estudio")
public class CreateEstudioServlet  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nmName = request.getParameter("nm-name");
        String nmEmail= request.getParameter("nm-email");
        String nmPassword= request.getParameter("nm-password");
        System.out.println(nmName);
        System.out.println(nmEmail);
        System.out.println(nmPassword);

        request.getRequestDispatcher("login.html").forward(request, response);

    }

}
