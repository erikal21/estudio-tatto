<&@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>DashboardUsuários</title>
</head>
<body>
<div>
    <h1>Usuários Cadastrados</h1>
    <table>
        <tr>
            <th>id</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Endereço</th>
            <th>Tipo de Usuário</th>

            <th>Actions</th>
        </tr>

        <c:forEach var="usuario" items="${infoUsuarios}">
            <tr>
                <td>${usuario.id}</td>
                <td>${usuario.nome}</td>
                <td>${usuario.email}</td>
                <td>${usuario.telefone}</td>
                <td>${usuario.endereco}</td>
                <td>${usuario.tipoUsuario}</td>

                <td>
                  <form action="/delete-usuario" method="post">
                      <input type="hidden" id="id" name="id" value="${usuario.id}">
                      <button type="submit">Delete</button>
                       <span> | </span>
                        <a href="cadastro.jsp?id=${usuario.id}&nome=${usuario.nome}&email=${usuario.email}&senha=${usuario.senha}&telefone=${usuario.telefone}&endereco=${usuario.endereco}&tipo_usuario=${usuario.tipoUsuario}">Update</a>
                  </form>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>