<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.estudio.model.TatuadorUsuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Artistas</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=stylesheet"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Oswald", sans-serif;
            background-color: #121212;
            color: white;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-x: hidden;
        }

        header {
            justify-content: center;
            position: relative;
            z-index: 10;
        }

        nav {
            position: absolute;
            top: 20px;
            width: 100%;
            text-align: center;
        }

        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s;
        }

        nav ul li a:hover {
            color: red;
        }

        .main-content {
            flex: 1 0 auto;
            display: flex;
            flex-direction: column;
        }

        .artista-container {
            max-width: 1200px;
            margin: 80px auto 0;
            background: #1a1a1a;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        h1 {
            font-size: 48px;
            color: #d9d9d9;
            text-align: center;
            margin-bottom: 40px;
            text-transform: uppercase;
        }

        h2 {
            font-size: 32px;
            color: #d9d9d9;
            margin-bottom: 30px;
            text-transform: uppercase;
        }

        .artista-card {
            border: 2px solid #621ad2;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
            background-color: #222;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .artista-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(98, 26, 210, 0.5);
        }

        .artista-card p {
            font-size: 18px;
            color: #b3b3b3;
            margin: 12px 0;
        }

        .artista-card p strong {
            color: #ffffff;
        }

        .artista-card a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            border: 2px solid red;
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s, color 0.3s;
        }

        .artista-card a:hover {
            background-color: red;
            color: #121212;
        }

        .galeria-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
            margin-top: 25px;
        }

        .galeria-grid img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid #621ad2;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .galeria-grid img:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(98, 26, 210, 0.5);
        }

        .delete-form {
            display: inline;
            margin-top: 15px;
        }

        .delete-button {
            background-color: transparent;
            border: 2px solid red;
            color: white;
            padding: 10px 20px;
            font-family: "Oswald", sans-serif;
            font-size: 16px;
            text-transform: uppercase;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .delete-button:hover {
            background-color: red;
            color: #121212;
        }

        .error-message {
            color: red;
            font-size: 18px;
            text-align: center;
            margin: 25px 0;
        }

        footer {
            background-color: #621ad2;
            padding: 20px;
            text-align: center;
            clear: both;
            box-sizing: border-box;
            flex-shrink: 0;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-text {
            font-family: "Oswald", sans-serif;
            font-size: 18px;
            color: white;
            text-transform: uppercase;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .galeria-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .galeria-grid img {
                height: 180px;
            }
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 36px;
            }
            h2 {
                font-size: 24px;
            }
            .artista-card p {
                font-size: 16px;
            }
            .artista-card a, .delete-button {
                font-size: 14px;
                padding: 8px 15px;
            }
            .galeria-grid {
                grid-template-columns: 1fr;
            }
            .galeria-grid img {
                height: 150px;
            }
            .footer-text {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="main-content">
    <div class="artista-container">
        <h1>Artistas</h1>

        <c:if test="${not empty tatuadoresDoUsuario}">
            <h2>Trabalhos do Artista: ${tatuadoresDoUsuario[0].nome}</h2>
            <c:forEach var="t" items="${tatuadoresDoUsuario}">
                <div class="artista-card">
                    <p><strong>Especialidade:</strong> ${t.especialidade}</p>
                    <p><strong>Descrição:</strong> ${t.descricao}</p>
                    <div class="galeria-grid">
                        <img src="${pageContext.request.contextPath}/${t.foto1}" alt="Trabalho 1"/>
                        <img src="${pageContext.request.contextPath}/${t.foto2}" alt="Trabalho 2"/>
                        <img src="${pageContext.request.contextPath}/${t.foto3}" alt="Trabalho 3"/>
                    </div>
                    <form action="${pageContext.request.contextPath}/excluir-tatuador" method="post" class="delete-form">
                        <input type="hidden" name="idTatuador" value="${t.idTatuador}"/>
                        <button type="submit" class="delete-button" onclick="return confirm('Tem certeza que deseja excluir este tatuador?');">Excluir</button>
                    </form>
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${not empty tatuadores}">
            <h2>Todos os Artistas</h2>
            <c:forEach var="t" items="${tatuadores}">
                <div class="artista-card">
                    <p><strong>Nome:</strong> ${t.nome}</p>
                    <p><strong>Especialidade:</strong> ${t.especialidade}</p>
                    <p><strong>Descrição:</strong> ${t.descricao}</p>
                    <div class="galeria-grid">
                        <img src="${pageContext.request.contextPath}/${t.foto1}" alt="Trabalho 1"/>
                        <img src="${pageContext.request.contextPath}/${t.foto2}" alt="Trabalho 2"/>
                        <img src="${pageContext.request.contextPath}/${t.foto3}" alt="Trabalho 3"/>
                    </div>
                    <p><a href="list-perfil?id=${t.idUsuario}">Ver todos os trabalhos desse artista</a></p>
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${not empty erro}">
            <p class="error-message">${erro}</p>
        </c:if>
    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-text">Direitos Reservados</div>
    </div>
</footer>
</body>
</html>