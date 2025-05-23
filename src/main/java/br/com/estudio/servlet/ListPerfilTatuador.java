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

@WebServlet("/list-perfil")
public class ListPerfilTatuador extends HttpServlet {


    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            TatuadorDAO dao = new TatuadorDAO(connection);

            if (idParam != null && !idParam.isEmpty()) {

                int id = Integer.parseInt(idParam);
                List<TatuadorUsuario> tatuador = dao.buscarPorIdUsuario(id);

                if (!tatuador.isEmpty()) {
                    req.setAttribute("tatuadoresDoUsuario", tatuador);
                } else {
                    req.setAttribute("erro", "Nenhum trabalho encontrado para este artista.");
                }

            } else {

                List<TatuadorUsuario> tatuadores = dao.listarComUsuario();
                req.setAttribute("tatuadores", tatuadores);
            }

            req.getRequestDispatcher("/listaArtistas.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID inválido");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}