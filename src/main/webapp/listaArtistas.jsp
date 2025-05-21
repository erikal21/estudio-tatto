<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.estudio.model.Artista" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Lista de Artistas</title>
</head>
<body>
    <h1>Artistas Cadastrados</h1>

    <c:forEach var="artista" items="${artistas}">
        <div style="border: 1px solid #000; padding: 10px; margin: 10px;">
            <p><strong>Especialidade:</strong> ${artista.especialidade}</p>
            <p><strong>Descrição:</strong> ${artista.descricao}</p>
            <div>
                <img src="${pageContext.request.contextPath}/imagens/${tatuador.foto1}" width="150">
                <img src="${pageContext.request.contextPath}/imagens/${tatuador.foto2}" width="150">
                <img src="${pageContext.request.contextPath}/imagens/${tatuador.foto3}" width="150">
            </div>
        </div>
    </c:forEach>
</body>
</html>

