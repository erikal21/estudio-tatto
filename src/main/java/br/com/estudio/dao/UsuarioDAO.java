package br.com.estudio.dao;
import br.com.estudio.model.Usuario;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
