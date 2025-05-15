<!DOCTYPE html>
<html lang="pt-BR">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <title>Dashboard Usuários</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #000;
            color: #fff;
            font-family: 'Oswald', sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #111;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid red;
        }

        .logo {
            font-size: 24px;
            color: red;
        }

        .welcome {
            font-size: 18px;
            color: #fff;
        }

        .logout-button {
            background-color: transparent;
            color: white;
            padding: 8px 16px;
            border: 2px solid red;
            cursor: pointer;
            font-family: 'Oswald', sans-serif;
            transition: background-color 0.3s;
        }

        .logout-button:hover {
            background-color: red;
            color: black;
        }

        .message {
            text-align: center;
            margin: 20px auto;
            padding: 10px 20px;
            border: 2px solid red;
            color: red;
            font-size: 18px;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            font-size: 48px;
            margin: 40px 0 20px;
        }

        table {
            width: 95%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #111;
            border: 2px solid red;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: red;
            color: black;
            font-size: 18px;
        }

        td {
            font-size: 16px;
        }

        .profile-pic {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 50%;
            border: 2px solid red;
        }

        button {
            background-color: transparent;
            color: white;
            padding: 8px 12px;
            border: 2px solid red;
            cursor: pointer;
            font-family: 'Oswald', sans-serif;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: red;
            color: black;
        }

        a {
            color: red;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        a:hover {
            color: white;
        }

        .actions span {
            margin: 0 5px;
            color: #ccc;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">StudioTatto</div>
    <c:if test="${not empty loggedUser}">
        <div class="welcome">Bem-vindo, ${loggedUser}</div>
        <form action="/logout" method="get">
            <button class="logout-button" type="submit">Logout</button>
        </form>
    </c:if>
</header>

<c:if test="${not empty message}">
    <div class="message">${message}</div>
</c:if>

<h1>Perfil</h1>

<table>
    <tr>
        <th>Foto</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Telefone</th>
        <th>Endereço</th>
        <th>Tipo de Usuário</th>
    <c:if test="${not empty loggedUser}">
            <th>Ações</th>
        </c:if>
    </tr>

    <c:forEach var="usuario" items="${infoUsuarios}">
        <tr>
            <td>
                <img src="${usuario.imagemPerfil != null ? usuario.imagemPerfil : 'img/default-user.jpg'}" class="profile-pic" alt="Foto do usuário">
            </td>
            <td>${usuario.nome}</td>
            <td>${usuario.email}</td>
            <td>${usuario.telefone}</td>
            <td>${usuario.endereco}</td>
            <td>${usuario.tipoUsuario}</td>
            <c:if test="${not empty loggedUser}">
                <td class="actions">
                    <form action="/delete-usuario" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="${usuario.id}">
                        <button type="submit">Delete</button>
                    </form>
                    <span>|</span>
                    <a href="cadastro.jsp?id=${usuario.id}&nome=${usuario.nome}&email=${usuario.email}&senha=${usuario.senha}&telefone=${usuario.telefone}&endereco=${usuario.endereco}&tipo_usuario=${usuario.tipoUsuario}">
                        Update
                    </a>
                </td>
            </c:if>
        </tr>
    </c:forEach>
</table>

</body>
</html>
