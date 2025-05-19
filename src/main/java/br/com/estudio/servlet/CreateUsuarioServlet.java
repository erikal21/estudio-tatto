package br.com.estudio.servlet;

import br.com.estudio.dao.UsuarioDAO;
import br.com.estudio.model.Usuario;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.apache.commons.fileupload.servlet.ServletFileUpload.isMultipartContent;

@WebServlet("/create-usuario")
@MultipartConfig
public class CreateUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Obtendo os parâmetros e imagens do formulário
        Map<String, String> parameters = uploadImage(req);

        String usuarioId = parameters.get("id");
        String nome = parameters.get("nome");
        String email = parameters.get("email");
        String senha = parameters.get("senha");
        String telefone = parameters.get("telefone");
        String endereco = parameters.get("endereco");
        String tipoUsuario = parameters.get("tipo_usuario");
        String imagemPerfil = parameters.get("imagemPerfil");

        // Criando o objeto Usuario
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = new Usuario(usuarioId, nome, email, senha, telefone, endereco, imagemPerfil, tipoUsuario);

        // Inserindo ou atualizando o usuário no banco de dados
        if (usuarioId == null || usuarioId.isBlank()) {
            usuarioDAO.createUser(usuario);
        } else {
            usuarioDAO.updateUsuario(usuario);
        }

        // Redireciona conforme o tipo de usuário (sem login automático)
        if ("tatuador".equalsIgnoreCase(tipoUsuario)) {
            resp.sendRedirect("login.jsp");
        } else {
            resp.sendRedirect("index.jsp");
        }
    }

    // Trata campos de texto e imagem
    private void checkFieldType(FileItem item, Map<String, String> requestParameters) throws Exception {
        if (item.isFormField()) {
            requestParameters.put(item.getFieldName(), item.getString("UTF-8"));
        } else {
            String fileName = processUploadedFile(item);
            requestParameters.put("imagemPerfil", "img/".concat(fileName));
        }
    }

    // Processa upload da imagem
    private Map<String, String> uploadImage(HttpServletRequest request) {
        Map<String, String> requestParameters = new HashMap<>();

        if (isMultipartContent(request)) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                List<FileItem> items = new ServletFileUpload(factory).parseRequest(request);
                for (FileItem item : items) {
                    checkFieldType(item, requestParameters);
                }
            } catch (Exception ex) {
                requestParameters.put("imagemPerfil", "img/default-user.jpg");
            }
        }

        return requestParameters;
    }

    // Salva imagem no servidor
    private String processUploadedFile(FileItem fileItem) throws Exception {
        Long currentTime = new Date().getTime();
        String fileName = currentTime + "-" + fileItem.getName().replace(" ", "");
        String filePath = this.getServletContext().getRealPath("img") + File.separator + fileName;
        fileItem.write(new File(filePath));
        return fileName;
    }
}