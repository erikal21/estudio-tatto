package br.com.estudio.servlet;

import br.com.estudio.dao.TatuadorDAO;
import br.com.estudio.model.TatuadorUsuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/list-perfil")
public class ListPerfilTatuador extends HttpServlet {

    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer idUsuario = (Integer) req.getSession().getAttribute("idUsuario");

        if (idUsuario == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            TatuadorDAO dao = new TatuadorDAO(connection);
            TatuadorUsuario tatuador = dao.buscarPorIdUsuario(idUsuario);

            req.setAttribute("tatuador", tatuador);
            req.getRequestDispatcher("/meuPerfil.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
