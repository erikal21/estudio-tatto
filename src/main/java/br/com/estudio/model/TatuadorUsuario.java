package br.com.estudio.model;

public class TatuadorCompleto {
    private int idTatuador;
    private int idUsuario;
    private String nome;
    private String email;
    private String descricao;
    private String especialidade;
    private String foto1;
    private String foto2;
    private String foto3;

    public int getIdTatuador() { return idTatuador; }
    public void setIdTatuador(int idTatuador) { this.idTatuador = idTatuador; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getEspecialidade() { return especialidade; }
    public void setEspecialidade(String especialidade) { this.especialidade = especialidade; }

    public String getFoto1() { return foto1; }
    public void setFoto1(String foto1) { this.foto1 = foto1; }

    public String getFoto2() { return foto2; }
    public void setFoto2(String foto2) { this.foto2 = foto2; }

    public String getFoto3() { return foto3; }
    public void setFoto3(String foto3) { this.foto3 = foto3; }
}
