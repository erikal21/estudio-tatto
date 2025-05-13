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

        Usuario user = new Usuario(email, senha);

        boolean isValidUser = new UserDAO().verifyCredentials(user);

        //Se o retorno for verdadeiro e o usuário for válido ele é logado e redirecionado
        if (isValidUser) {
            req.getSession().setAttribute("loggedUser", email);
            resp.sendRedirect("find-all-usuarios"); // envia o usuário para a página com todos os usuários, pode ser modificado no futuro
        }
        // se o retorno for falso o usuário não é logado e volta para a página de login
        else {
            req.setAttribute("message", "Credenciais inválidas!"); //  mensagem falando que as credenciais estão inválidas
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
