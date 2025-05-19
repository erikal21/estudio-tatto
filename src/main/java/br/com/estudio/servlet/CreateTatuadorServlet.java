package br.com.estudio.servlet;

import br.com.estudio.config.ConnectionPoolConfig;
import br.com.estudio.dao.TatuadorDAO;
import br.com.estudio.model.Tatuador;
import br.com.estudio.model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@WebServlet("/create-artista")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class CreateTatuadorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

        if (usuarioLogado == null || !"tatuador".equalsIgnoreCase(usuarioLogado.getTipoUsuario())) {
            response.sendRedirect("Artistas.jsp"); // Página alternativa ao erro.jsp
            return;
        }

        int idUsuario = Integer.parseInt(usuarioLogado.getId());
        String descricao = request.getParameter("descricao");
        String especialidade = request.getParameter("especialidade");

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String foto1 = salvarArquivo(request.getPart("foto1"), uploadPath);
        String foto2 = salvarArquivo(request.getPart("foto2"), uploadPath);
        String foto3 = salvarArquivo(request.getPart("foto3"), uploadPath);

        Tatuador tatuador = new Tatuador(idUsuario, descricao, especialidade, foto1, foto2, foto3);

        try {
            TatuadorDAO tatuadorDAO = new TatuadorDAO(ConnectionPoolConfig.getConnection());
            tatuadorDAO.inserir(tatuador);

            response.sendRedirect("artistaPerfil.jsp"); // Redireciona para o perfil do tatuador

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Artistas.jsp"); // Redireciona para a página de artistas em caso de erro
        }
    }

    private String salvarArquivo(Part part, String uploadPath) throws IOException {
        if (part != null && part.getSize() > 0) {
            String nomeOriginal = getFileName(part);
            if (nomeOriginal != null) {
                nomeOriginal = nomeOriginal.replace(" ", "_");
                String fileName = new Date().getTime() + "_" + nomeOriginal;
                part.write(uploadPath + File.separator + fileName);
                return "uploads/" + fileName;
            }
        }
        return null;
    }

    // Compatível com Servlet 3.0 (Tomcat 7)
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
