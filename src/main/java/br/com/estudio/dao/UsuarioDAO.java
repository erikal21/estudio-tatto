package br.com.estudio.dao;
import br.com.estudio.config.ConnectionPoolConfig;
import br.com.estudio.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

//Método create para criar os usuários com as informações desejadas
public class UsuarioDAO {

    public void createUser(Usuario usuario) {

        String SQL = "INSERT INTO USUARIO (nome, email, senha, telefone, endereco, TIPO_USUARIO, IMAGEMPERFIL) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setString(4, usuario.getTelefone());
            preparedStatement.setString(5, usuario.getEndereco());
            preparedStatement.setString(6, usuario.getTipoUsuario()); // Dentro do BD os usuários são "admin", tatuador e usuario(usuário normal/regular)
            preparedStatement.setString(7, usuario.getImagemPerfil()); // campo para imagens de perfil do usuário

            preparedStatement.execute();

            System.out.println("Success in insert command");

            connection.close();

        } catch (Exception e) {
            System.out.println("Error in connection: " + e.getMessage());
            System.out.println("Error: "+ e.getMessage());
        }
    }
    //Método select para selecionar dentro do BD as informações(OBS: No momento ele apenas seleciona TUDO, necessário alteração)
    public List<Usuario> findAllUsuarios() {

        String SQL = "SELECT * FROM USUARIO";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {
                String id = resultSet.getString("ID_USUARIO");
                String nome = resultSet.getString("nome");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String telefone = resultSet.getString("telefone");
                String endereco = resultSet.getString("endereco");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                String imagemPerfil = resultSet.getString("imagemPerfil");

                Usuario usuario = new Usuario(id, nome, email, senha, telefone, endereco, imagemPerfil, tipoUsuario); // Use o construtor que aceita todos os campos


                usuarios.add(usuario);

            }

            System.out.println("success in select * usuario");

            connection.close();

            return usuarios;

        } catch (Exception e) {

            System.out.println("fail in database connection: " + e.getMessage());
            System.out.println("Error"+ e.getMessage());

            return Collections.emptyList();

        }
    }

    //Método delete para deletar usuários dentro do BD

    public void deleteUsuarioById(String idUsuario) {

        String SQL = "DELETE FROM USUARIO WHERE ID_USUARIO = ?";

        try {
            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, idUsuario);
            preparedStatement.execute();

            System.out.println("Usuário com ID " + idUsuario + " deletado com sucesso");

            connection.close();

        } catch (Exception e) {
            System.out.println("Falha ao conectar com o banco de dados ou deletar usuário: " + e.getMessage());
        }
    }

    //Método UPDATE para atualizar usuarios dentro do BD

    public void updateUsuario(Usuario usuario) {

        String SQL = "UPDATE USUARIO SET nome = ?, email = ?, senha = ?, telefone = ?, endereco = ?,  imagemPerfil = ?, tipo_usuario= ? WHERE ID_USUARIO = ?";

        try {

            Connection connection = ConnectionPoolConfig.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getSenha());
            preparedStatement.setString(4, usuario.getTelefone());
            preparedStatement.setString(5, usuario.getEndereco());
            preparedStatement.setString(6, usuario.getImagemPerfil());
            preparedStatement.setString(7, usuario.getTipoUsuario());
            preparedStatement.setString(8, usuario.getId());

            preparedStatement.executeUpdate();

            System.out.println("ID recebido para update: " + usuario.getId());
            System.out.println("Usuário atualizado com sucesso");

            connection.close();

        } catch (Exception e) {
            System.out.println("Falha na conexão com o banco de dados ou na atualização do usuário");
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public Usuario autenticar(String email, String senha) {
        try (Connection connection = ConnectionPoolConfig.getConnection()) {
            String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
            try (PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, senha);

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    // Cria e retorna o objeto Usuario com os dados do banco
                    return new Usuario(
                            rs.getString("id"),
                            rs.getString("nome"),
                            rs.getString("email"),
                            rs.getString("senha"),
                            rs.getString("telefone"),
                            rs.getString("endereco"),
                            rs.getString("imagemPerfil"),
                            rs.getString("tipoUsuario")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public Usuario buscarPorId(String idUsuario) {
        String SQL = "SELECT * FROM USUARIO WHERE ID_USUARIO = ?";
        try {
            Connection connection = ConnectionPoolConfig.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, idUsuario);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String id = resultSet.getString("ID_USUARIO");
                String nome = resultSet.getString("nome");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String telefone = resultSet.getString("telefone");
                String endereco = resultSet.getString("endereco");
                String tipoUsuario = resultSet.getString("tipo_usuario");
                String imagemPerfil = resultSet.getString("imagemPerfil");

                Usuario usuario = new Usuario(id, nome, email, senha, telefone, endereco, imagemPerfil, tipoUsuario);

                connection.close();
                return usuario;
            }

            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao buscar usuário por ID: " + e.getMessage());
        }
        return null;
    }

}
