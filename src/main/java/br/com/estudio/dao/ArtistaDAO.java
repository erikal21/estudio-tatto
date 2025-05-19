package br.com.estudio.dao;

import br.com.estudio.model.Artista;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArtistaDAO {

    private final Connection connection;

    public ArtistaDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Artista> findAllArtistas() {
        List<Artista> artistas = new ArrayList<>();
        String sql = "SELECT ID_TATUADOR, DESCRICAO, ESPECIALIDADE, FOTO1, FOTO2, FOTO3 FROM TATUADOR";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Artista a = new Artista();
                a.setId(rs.getInt("ID_TATUADOR"));
                a.setDescricao(rs.getString("DESCRICAO"));
                a.setEspecialidade(rs.getString("ESPECIALIDADE"));
                a.setFoto1(rs.getString("FOTO1"));
                a.setFoto2(rs.getString("FOTO2"));
                a.setFoto3(rs.getString("FOTO3"));
                artistas.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return artistas;
    }
}
