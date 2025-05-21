// lISTA OS ARTISTAS NA INDEX

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
import java.util.List;

@WebServlet("/list-tatuadores")
public class ListTatuadorServlet extends HttpServlet {

    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            TatuadorDAO dao = new TatuadorDAO(connection);
            List<TatuadorUsuario> tatuadores = dao.listarComUsuario();

            req.setAttribute("tatuadores", tatuadores);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}