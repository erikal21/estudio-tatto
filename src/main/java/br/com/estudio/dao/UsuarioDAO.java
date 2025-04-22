package br.com.estudio.dao;
import br.com.estudio.model.Usuario;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

//Método create para criar os usuários com as informações desejadas
public class UsuarioDAO {

    public void createUser(Usuario usuario) {

        String SQL = "INSERT INTO USUARIO (nome, email, senha, telefone, endereco, tipo_usuario) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setString(4, usuario.getTelefone());
            preparedStatement.setString(5, usuario.getEndereco());
            preparedStatement.setString(6, usuario.getTipoUsuario()); // Dentro do BD os usuários são "admin", tatuador e usuario(usuário normal/regular)

            preparedStatement.execute();

            System.out.println("Success in insert command");

            connection.close();

        } catch (Exception e) {
            System.out.println("Error in connection: " + e.getMessage());
        }
    }
    //Método select para selecionar dentro do BD as informações(OBS: No momento ele apenas seleciona TUDO, necessário alteração)
    public List<Usuario> findAllUsuarios() {

        String SQL = "SELECT * FROM USUARIO";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {
                String usuarioID = resultSet.getString("ID_USUARIO");
                String usuarioNome = resultSet.getString("nome");
                String usuarioEmail = resultSet.getString("email");
                String usuarioSenha = resultSet.getString("senha");
                String usuarioTelefone = resultSet.getString("telefone");
                String usuarioEndereco = resultSet.getString("endereco");
                String usuarioTipoUsuario = resultSet.getString("tipo_usuario");

                Usuario usuario = new Usuario(usuarioID,usuarioNome,usuarioEmail, usuarioSenha, usuarioTelefone, usuarioEndereco, usuarioTipoUsuario);


                usuarios.add(usuario);

            }

            System.out.println("success in select * usuario");

            connection.close();

            return usuarios;

        } catch (Exception e) {

            System.out.println("fail in database connection: " + e.getMessage());

            return Collections.emptyList();

        }
    }

    public void deleteUsuarioById(String idUsuario) {

        String SQL = "DELETE FROM USUARIO WHERE ID_USUARIO = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Conexão com banco de dados bem-sucedida");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, idUsuario);
            preparedStatement.execute();

            System.out.println("Usuário com ID " + idUsuario + " deletado com sucesso");

            connection.close();

        } catch (Exception e) {
            System.out.println("Falha ao conectar com o banco de dados ou deletar usuário: " + e.getMessage());
        }
    }

}
