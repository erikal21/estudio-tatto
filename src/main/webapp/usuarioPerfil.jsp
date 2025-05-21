<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head><title>Perfil do Usuário</title></head>
<body>
    <h1>Perfil</h1>
    <p>Nome: ${usuario.nome}</p>
    <p>Email: ${usuario.email}</p>
    <p>Telefone: ${usuario.telefone}</p>
    <p>Endereço: ${usuario.endereco}</p>
    <p>Tipo de Usuário: ${usuario.tipoUsuario}</p>
    <img src="${usuario.imagemPerfil != null ? usuario.imagemPerfil : 'imagens/default-user.png'}" alt="Foto do usuário" width="100"/>
</body>
</html>
