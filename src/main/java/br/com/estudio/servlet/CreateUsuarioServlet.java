package br.com.estudio.servlet;

import br.com.estudio.dao.UsuarioDAO;
import br.com.estudio.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/create-usuario")
public class CreateUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String usuarioId = req.getParameter("id");
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");
        String telefone = req.getParameter("telefone");
        String endereco = req.getParameter("endereco");
        String tipoUsuario = req.getParameter("tipo_usuario");

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        Usuario usuario = new Usuario(usuarioId, nome, email, senha, telefone, endereco, tipoUsuario);

        if (usuarioId == null || usuarioId.isBlank()) {

            usuarioDAO.createUser(usuario);

        } else {

            usuarioDAO.updateUsuario(usuario);
        }

        resp.sendRedirect("/find-all-usuarios");
    }
}
