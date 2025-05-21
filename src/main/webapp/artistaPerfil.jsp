<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Perfil do Artista</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .perfil-container {
            max-width: 900px;
            margin: 30px auto;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .perfil-header {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .perfil-header img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }
        .perfil-info h1 {
            margin: 0;
            font-size: 28px;
        }
        .perfil-info p {
            margin: 5px 0;
        }
        .galeria {
            margin-top: 30px;
        }
        .galeria h2 {
            color: red;
            margin-bottom: 10px;
        }
        .galeria img {
            width: 30%;
            height: 200px;
            object-fit: cover;
            margin-right: 10px;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="perfil-container">
    <c:forEach var="perfil" items="${artistas}">
        <div class="perfil-header">
            <img src="${perfil.imagemPerfil}" alt="Imagem de Perfil"/>
            <div class="perfil-info">
                <h1>${perfil.nome}</h1>
                <p><strong>Email:</strong> ${perfil.email}</p>
                <p><strong>Telefone:</strong> ${perfil.telefone}</p>
                <p><strong>Endereço:</strong> ${perfil.endereco}</p>
                <p><strong>Especialidade:</strong> ${perfil.especialidade}</p>
                <p><strong>Descrição:</strong> ${perfil.descricao}</p>
            </div>
        </div>

        <div class="galeria">
            <h2>Galeria de Trabalhos</h2>
            <img src="${perfil.foto1}" alt="Trabalho 1"/>
            <img src="${perfil.foto2}" alt="Trabalho 2"/>
            <img src="${perfil.foto3}" alt="Trabalho 3"/>
        </div>
    </c:forEach>
</div>

</body>
</html>
