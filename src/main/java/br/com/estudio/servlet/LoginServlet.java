package br.com.estudio.servlet;

import br.com.estudio.dao.UserDAO;
import br.com.estudio.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
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
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLogado", usuarioLogado);

            resp.sendRedirect("usuarioPerfil");
        } else {
            req.setAttribute("message", "Credenciais inválidas!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
