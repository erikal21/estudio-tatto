<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.estudio.model.TatuadorUsuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
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

    <title>Artistas</title>
</head>
<body>
    <h1>Artistas</h1>


    <c:if test="${not empty tatuadoresDoUsuario}">
        <h2>Trabalhos do Artista: ${tatuadoresDoUsuario[0].nome}</h2>
        <c:forEach var="t" items="${tatuadoresDoUsuario}">
            <div style="border: 1px solid #000; padding: 10px; margin: 10px;">
                <p><strong>Especialidade:</strong> ${t.especialidade}</p>
                <p><strong>Descrição:</strong> ${t.descricao}</p>
                <div>
                    <img src="${pageContext.request.contextPath}/${t.foto1}" width="150"/>
                    <img src="${pageContext.request.contextPath}/${t.foto2}" width="150"/>
                    <img src="${pageContext.request.contextPath}/${t.foto3}" width="150"/>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/excluir-tatuador" method="post" style="display:inline;">
                    <input type="hidden" name="idTatuador" value="${t.idTatuador}" />
                    <button type="submit" onclick="return confirm('Tem certeza que deseja excluir este tatuador?');">Excluir</button>
                </form>
        </c:forEach>
    </c:if>


    <c:if test="${not empty tatuadores}">
        <h2>Todos os Artistas</h2>
        <c:forEach var="t" items="${tatuadores}">
            <div style="border: 1px solid #ccc; padding: 10px; margin: 10px;">
                <p><strong>Nome:</strong> ${t.nome}</p>
                <p><strong>Especialidade:</strong> ${t.especialidade}</p>
                <p><strong>Descrição:</strong> ${t.descricao}</p>
                <div>
                    <img src="${pageContext.request.contextPath}/${t.foto1}" width="150"/>
                    <img src="${pageContext.request.contextPath}/${t.foto2}" width="150"/>
                    <img src="${pageContext.request.contextPath}/${t.foto3}" width="150"/>
                </div>
                <p><a href="list-perfil?id=${t.idUsuario}">Ver todos os trabalhos desse artista</a></p>
            </div>
        </c:forEach>
    </c:if>

    <!-- Mensagem de erro -->
    <c:if test="${not empty erro}">
        <p style="color:red;">${erro}</p>
    </c:if>

</body>
</html>
