<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Perfil do Artista</title>
<<<<<<< Updated upstream
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet"/>
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

        .perfil-container {
            max-width: 1200px;
            margin: 80px auto 0;
            background: #1a1a1a;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        .perfil-header {
            display: flex;
            align-items: center;
            gap: 30px;
            margin-bottom: 30px;
        }

        .perfil-header img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid red;
            transition: transform 0.3s;
        }

        .perfil-header img:hover {
            transform: scale(1.05);
        }

        .perfil-info h1 {
            font-size: 36px;
            margin: 0 0 15px;
            color: #d9d9d9;
        }

        .perfil-info p {
            font-size: 18px;
            margin: 8px 0;
            color: #b3b3b3;
        }

        .perfil-info p strong {
            color: #ffffff;
        }

        .galeria {
            margin-top: 40px;
        }

        .galeria h2 {
            font-size: 32px;
            color: red;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .galeria-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .galeria img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid #621ad2;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .galeria img:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(98, 26, 210, 0.5);
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
        @media (max-width: 768px) {
            .perfil-header {
                flex-direction: column;
                text-align: center;
            }
            .perfil-header img {
                width: 150px;
                height: 150px;
            }
            .perfil-info h1 {
                font-size: 28px;
            }
            .perfil-info p {
                font-size: 16px;
            }
            .galeria-grid {
                grid-template-columns: 1fr;
            }
            .galeria img {
                height: 200px;
            }
            .footer-text {
                font-size: 16px;
            }
        }
    </style>
=======
>>>>>>> Stashed changes
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.jsp#Home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#sobre">Sobre</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#loja">Loja</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#artistas">Artistas</a></li>
            <li><a href="${pageContext.request.contextPath}/index.jsp#contato">Contato</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp">👤</a></li>
        </ul>
    </nav>
</header>

<<<<<<< Updated upstream
<div class="main-content">
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
                <div class="galeria-grid">
=======
<div class="perfil-container">

    <c:choose>
        <c:when test="${not empty tatuadoresDoUsuario}">
            <c:forEach var="perfil" items="${tatuadoresDoUsuario}">
                <div class="perfil-header">
                    <img src="${perfil.imagemPerfil}" alt="Imagem de Perfil"/>
                    <div class="perfil-info">
                    <p>ID do tatuador: ${perfil.idTatuador}</p>

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
>>>>>>> Stashed changes
                    <img src="${perfil.foto1}" alt="Trabalho 1"/>
                    <img src="${perfil.foto2}" alt="Trabalho 2"/>
                    <img src="${perfil.foto3}" alt="Trabalho 3"/>
                </div>
<<<<<<< Updated upstream
            </div>
        </c:forEach>
    </div>
=======

                <form action="${pageContext.request.contextPath}/excluir-tatuador" method="post" onsubmit="return confirm('Deseja realmente excluir este tatuador?');" style="margin-top: 1rem;">
                    <input type="hidden" name="idTatuador" value="${perfil.idTatuador}" />
                    <button type="submit">Excluir</button>
                </form>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <c:forEach var="perfil" items="${tatuadores}">
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

                <form action="${pageContext.request.contextPath}/excluir-tatuador" method="post" onsubmit="return confirm('Deseja realmente excluir este tatuador?');" style="margin-top: 1rem;">
                    <input type="hidden" name="idTatuador" value="${perfil.idTatuador}" />
                    <button type="submit">Excluir</button>
                </form>
            </c:forEach>
        </c:otherwise>
    </c:choose>

>>>>>>> Stashed changes
</div>

<footer>
    <div class="footer-container">
        <div class="footer-text">Direitos Reservados</div>
    </div>
</footer>
</body>
</html>