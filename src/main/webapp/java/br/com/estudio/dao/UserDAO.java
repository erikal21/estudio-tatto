package br.com.estudio.dao;

import br.com.estudio.config.ConnectionPoolConfig;
import br.com.estudio.model.Usuario;
import java.sql.*;

public class UserDAO {

    public boolean verifyCredentials(Usuario user) {

        String SQL = "SELECT senha FROM USUARIO WHERE email = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, user.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();

            System.out.println("Successo em selecionar email");

            if (resultSet.next()) {
                String passwordFromDB = resultSet.getString("senha");
                String emailFromDB = user.getEmail(); // ou resultSet.getString("email") se você selecionar o campo na query

                System.out.println("E-mail encontrado no banco: " + emailFromDB);
                System.out.println("Senha encontrada no banco: " + passwordFromDB);
                System.out.println("Senha fornecida pelo usuário: " + user.getSenha());

                if (passwordFromDB.equals(user.getSenha())) {
                    return true;
                }
            } else {
                System.out.println("E-mail não encontrado no banco");
            }

            connection.close();
            return false;

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
}
