package br.com.estudio.model;

public class Usuario {

    private String id;
    private String nome;
    private String email;
    private String senha;
    private String telefone;
    private String endereco;
    private String tipoUsuario;
    private String imagemPerfil;

    public Usuario(String nome, String email, String senha, String telefone, String endereco, String tipoUsuario) {

        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.telefone = telefone;
        this.endereco = endereco;
        this.tipoUsuario = tipoUsuario;
    }

    public Usuario(String id, String nome, String email, String senha, String telefone, String endereco, String imagemPerfil, String tipoUsuario) {

        this.id= id;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.telefone = telefone;
        this.endereco = endereco;
        this.tipoUsuario = tipoUsuario;
        this.imagemPerfil = imagemPerfil;
    }
    
    public Usuario(String email, String senha) {
            this.email= email;
            this.senha= senha;
    }

    public Usuario() {

    }
    // Getters e Setters

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImagemPerfil() {
        return imagemPerfil;
    }

    public void setImagemPerfil(String imagemPerfil) {
        this.imagemPerfil = imagemPerfil;
    }
}
