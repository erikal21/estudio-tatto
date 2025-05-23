package br.com.estudio.dao;

import br.com.estudio.model.TatuadorUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TatuadorDAO {

    private final Connection connection;

    public TatuadorDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserir(br.com.estudio.model.Tatuador tatuador) throws SQLException {
        String SQL = "INSERT INTO TATUADOR (ID_USUARIO, DESCRICAO, ESPECIALIDADE, FOTO1, FOTO2, FOTO3) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(SQL)) {
            stmt.setInt(1, tatuador.getIdUsuario());
            stmt.setString(2, tatuador.getDescricao());
            stmt.setString(3, tatuador.getEspecialidade());
            stmt.setString(4, tatuador.getFoto1());
            stmt.setString(5, tatuador.getFoto2());
            stmt.setString(6, tatuador.getFoto3());
            stmt.executeUpdate();
        }
    }

    public List<TatuadorUsuario> listarComUsuario() throws SQLException {
        String sql = "SELECT t.ID_TATUADOR, t.ID_USUARIO, u.NOME, u.EMAIL, u.IMAGEMPERFIL, t.DESCRICAO, t.ESPECIALIDADE, t.FOTO1, t.FOTO2, t.FOTO3 " +
                "FROM TATUADOR t JOIN USUARIO u ON t.ID_USUARIO = u.ID_USUARIO";
        List<TatuadorUsuario> lista = new ArrayList<>();
        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                TatuadorUsuario tu = new TatuadorUsuario();
                tu.setIdTatuador(rs.getInt("ID_TATUADOR"));
                tu.setIdUsuario(rs.getInt("ID_USUARIO"));
                tu.setNome(rs.getString("NOME"));
                tu.setEmail(rs.getString("EMAIL"));
                tu.setDescricao(rs.getString("DESCRICAO"));
                tu.setEspecialidade(rs.getString("ESPECIALIDADE"));
                tu.setFoto1(rs.getString("FOTO1"));
                tu.setFoto2(rs.getString("FOTO2"));
                tu.setFoto3(rs.getString("FOTO3"));
                tu.setImagemPerfil(rs.getString("IMAGEMPERFIL"));
                lista.add(tu);
            }
        }
        return lista;
    }
    public TatuadorUsuario buscarPorIdUsuario(int idUsuario) throws SQLException {
        String sql = "SELECT t.ID_TATUADOR, t.ID_USUARIO, u.NOME, u.EMAIL, u.IMAGEMPERFIL, t.DESCRICAO, " +
                "t.ESPECIALIDADE, t.FOTO1, t.FOTO2, t.FOTO3 " +
                "FROM TATUADOR t JOIN USUARIO u ON t.ID_USUARIO = u.ID_USUARIO WHERE t.ID_USUARIO = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    TatuadorUsuario tu = new TatuadorUsuario();
                    tu.setIdTatuador(rs.getInt("ID_TATUADOR"));
                    tu.setIdUsuario(rs.getInt("ID_USUARIO"));
                    tu.setNome(rs.getString("NOME"));
                    tu.setEmail(rs.getString("EMAIL"));
                    tu.setDescricao(rs.getString("DESCRICAO"));
                    tu.setEspecialidade(rs.getString("ESPECIALIDADE"));
                    tu.setFoto1(rs.getString("FOTO1"));
                    tu.setFoto2(rs.getString("FOTO2"));
                    tu.setFoto3(rs.getString("FOTO3"));
                    tu.setImagemPerfil(rs.getString("IMAGEMPERFIL"));
                    return tu;
                }
            }
        }
        return null;
    }

}