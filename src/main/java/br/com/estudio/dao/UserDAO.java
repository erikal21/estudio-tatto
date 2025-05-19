package br.com.estudio.dao;

import br.com.estudio.config.ConnectionPoolConfig;
import br.com.estudio.model.Usuario;
import java.sql.*;

public class UserDAO {

    public Usuario verifyCredentials(Usuario user) {
        String SQL = "SELECT * FROM USUARIO WHERE email = ?";

        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, user.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String passwordFromDB = resultSet.getString("senha");
                if (passwordFromDB.equals(user.getSenha())) {
                    return new Usuario(
                            resultSet.getString("ID_USUARIO"),
                            resultSet.getString("nome"),
                            resultSet.getString("email"),
                            resultSet.getString("senha"),
                            resultSet.getString("telefone"),
                            resultSet.getString("endereco"),
                            resultSet.getString("imagemPerfil"),
                            resultSet.getString("tipo_usuario")
                    );
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar credenciais: " + e.getMessage());
        }

        return null;
    }
}