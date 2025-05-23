package br.com.estudio.servlet;

import br.com.estudio.dao.UsuarioDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete-usuario")
public class DeleteUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String usuarioId = req.getParameter("id");

        new UsuarioDAO().deleteUsuarioById(usuarioId);

        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("usuarioLogado") != null) {
            Object usuario = session.getAttribute("usuarioLogado");


            if (usuario instanceof br.com.estudio.model.Usuario) {
                br.com.estudio.model.Usuario usuarioSessao = (br.com.estudio.model.Usuario) usuario;
                if (String.valueOf(usuarioSessao.getId()).equals(usuarioId)) {
                    session.invalidate();
                }
            }
        }

        resp.sendRedirect("login.jsp"); 
    }
}

