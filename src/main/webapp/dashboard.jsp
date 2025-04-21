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
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Endereço</th>
            <th>Tipo de Usuário</th>
        </tr>

        <c:forEach var="usuario" items="${infoUsuarios}">
            <tr>
                <td>${usuario.nome}</td>
                <td>${usuario.email}</td>
                <td>${usuario.telefone}</td>
                <td>${usuario.endereco}</td>
                <td>${usuario.tipoUsuario}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>