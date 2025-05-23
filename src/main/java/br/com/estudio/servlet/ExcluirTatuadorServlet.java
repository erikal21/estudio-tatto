package br.com.estudio.servlet;

import br.com.estudio.dao.TatuadorDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/excluir-tatuador")
public class ExcluirTatuadorServlet extends HttpServlet {

    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("idTatuador");

        if (idParam == null || idParam.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID inválido");
            return;
        }

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            TatuadorDAO dao = new TatuadorDAO(connection);
            int id = Integer.parseInt(idParam);
            dao.excluir(id);
            resp.sendRedirect(req.getContextPath() + "/list-perfil"); // Redireciona após exclusão
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException(e);
        }
    }
}
