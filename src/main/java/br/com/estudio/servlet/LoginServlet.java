package br.com.estudio.servlet;

import br.com.estudio.dao.UserDAO;
import br.com.estudio.model.Usuario;
import org.h2.engine.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("nm-email");
        String senha = req.getParameter("nm-password");

        Usuario loginAttempt = new Usuario(email, senha);

        Usuario usuarioLogado = new UserDAO().verifyCredentials(loginAttempt);

        if (usuarioLogado != null) {
            req.getSession().setAttribute("usuarioLogado", usuarioLogado);

            if ("tatuador".equalsIgnoreCase(usuarioLogado.getTipoUsuario())) {
                resp.sendRedirect("usuarioPerfil");
            } else {
                resp.sendRedirect("usuarioPerfil");
            }
        } else {
            req.setAttribute("message", "Credenciais inválidas!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
