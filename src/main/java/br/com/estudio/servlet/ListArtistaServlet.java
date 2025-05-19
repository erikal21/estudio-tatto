package br.com.estudio.servlet;

import br.com.estudio.dao.ArtistaDAO;
import br.com.estudio.model.Artista;

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

@WebServlet("/list-artistas")
public class ListArtistaServlet extends HttpServlet {

    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            ArtistaDAO dao = new ArtistaDAO(connection);
            List<Artista> artistas = dao.findAllArtistas();

            req.setAttribute("tatuadores", artistas);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Erro ao conectar ao banco de dados", e);
        }
    }
}
