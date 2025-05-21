package br.com.estudio.servlet;

import br.com.estudio.dao.UsuarioDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-usuario")
public class DeleteUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String usuarioId = req.getParameter("id");

        new UsuarioDAO().deleteUsuarioById(usuarioId);

        resp.sendRedirect("/index.jsp");

    }

}
