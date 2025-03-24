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

        System.out.println(nmName);

        request.getRequestDispatcher("index.html").forward(request, response);

    }

}
