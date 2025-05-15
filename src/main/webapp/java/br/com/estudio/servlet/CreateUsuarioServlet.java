package br.com.estudio.servlet;

import br.com.estudio.dao.UsuarioDAO;
import br.com.estudio.model.Usuario;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        Map<String, String>  parameters uploadImage(req);

        String usuarioId = parameters.get("id");
        String nome = parameters.get("nome");
        String email = parameters.get("email");
        String senha = parameters.get("senha");
        String telefone = parameters.get("telefone");
        String endereco = parameters.get("endereco");
        String imagemPerfil= parameters.get("imagemPerfil")
        String tipoUsuario = parameters.get("tipo_usuario");

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        Usuario usuario = new Usuario(usuarioId, nome, email, senha, telefone, endereco, imagemPerfil ,tipoUsuario);

        if (usuarioId == null || usuarioId.isBlank()) {
            usuarioDAO.createUser(usuario);
        } else {
            usuarioDAO.updateUsuario(usuario);
        }

        resp.sendRedirect("/find-all-usuarios");
    }

    private void checkFieldType(FileItem item, Map requestParameters) throws Exception {

        if (item.isFormField()) {

            requestParameters.put(item.getFieldName(), item.getString());

        } else {

            String fileName = processUploadedFile(item);
            requestParameters.put("imagemPerfil", "img/".concat(fileName));

        }
    }

    private Map<String, String> uploadImage(HttpServletRequest httpServletRequest) {

        Map<String, String> requestParameters = new HashMap<>();

        if (isMultipartContent(httpServletRequest)) {

            try {

                DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();

                List<FileItem> fileItems = new ServletFileUpload(diskFileItemFactory).parseRequest(httpServletRequest);

                for (FileItem fileItem : fileItems) {

                    checkFieldType(fileItem, requestParameters);

                }

            } catch (Exception ex) {

                requestParameters.put("image", "img/default-user.jpg");

            }

        }

        return requestParameters;

    }

    private String processUploadedFile(FileItem fileItem) throws Exception {

        Long currentTime = new Date().getTime();

        String fileName = currentTime.toString().concat("-").concat(fileItem.getName().replace(" ", ""));
        String filePath = this.getServletContext().getRealPath("img").concat(File.separator).concat(fileName);

        fileItem.write(new File(filePath));

        return fileName;
    }
}
