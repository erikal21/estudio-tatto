package br.com.estudio.model;

public class Tatuador {

    private int idTatuador;
    private int idUsuario;
    private String descricao;
    private String especialidade;
    private String foto1;
    private String foto2;
    private String foto3;

    // Construtor padrão
    public Tatuador() {}

    // Construtor com todos os campos
    public Tatuador(int idTatuador, int idUsuario, String descricao, String especialidade,
                    String foto1, String foto2, String foto3) {
        this.idTatuador = idTatuador;
        this.idUsuario = idUsuario;
        this.descricao = descricao;
        this.especialidade = especialidade;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.foto3 = foto3;
    }

    // Construtor para inserção (sem idTatuador, que será gerado pelo banco)
    public Tatuador(int idUsuario, String descricao, String especialidade,
                    String foto1, String foto2, String foto3) {
        this.idUsuario = idUsuario;
        this.descricao = descricao;
        this.especialidade = especialidade;
        this.foto1 = foto1;
        this.foto2 = foto2;
        this.foto3 = foto3;
    }

    // Getters e Setters

    public int getIdTatuador() {
        return idTatuador;
    }

    public void setIdTatuador(int idTatuador) {
        this.idTatuador = idTatuador;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }

    public String getFoto1() {
        return foto1;
    }

    public void setFoto1(String foto1) {
        this.foto1 = foto1;
    }

    public String getFoto2() {
        return foto2;
    }

    public void setFoto2(String foto2) {
        this.foto2 = foto2;
    }

    public String getFoto3() {
        return foto3;
    }

    public void setFoto3(String foto3) {
        this.foto3 = foto3;
    }
}
