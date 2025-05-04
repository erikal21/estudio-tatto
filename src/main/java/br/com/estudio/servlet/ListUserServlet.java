package br.com.estudio.servlet;

import br.com.estudio.dao.UsuarioDAO;
import br.com.estudio.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/find-all-usuarios", "/admin/find-all-usuarios"})

public class ListUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Usuario> infoUsuarios = new UsuarioDAO().findAllUsuarios();

        req.setAttribute("infoUsuarios", infoUsuarios);

        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }
}