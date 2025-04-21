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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");
        String tipoUsuario = request.getParameter("tipo_usuario");

        Usuario usuario = new Usuario(nome, email, senha, telefone, endereco, tipoUsuario);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);
        usuario.setTelefone(telefone);
        usuario.setEndereco(endereco);
        usuario.setTipoUsuario(tipoUsuario);

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        usuarioDAO.createUser(usuario);

        response.sendRedirect("/find-all-users");

    }
}
