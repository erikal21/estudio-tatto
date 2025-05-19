<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de Artistas</title>
</head>
<body>
    <h1>Artistas Cadastrados</h1>
    <c:forEach var="a" items="${artistas}">
        <div style="border:1px solid #ccc; padding:10px; margin:10px;">
            <p><strong>Descrição:</strong> ${a.descricao}</p>
            <p><strong>Especialidade:</strong> ${a.especialidade}</p>
            <p><strong>Fotos:</strong></p>
            <img src="${a.foto1}" alt="Foto 1" width="100"/>
            <img src="${a.foto2}" alt="Foto 2" width="100"/>
            <img src="${a.foto3}" alt="Foto 3" width="100"/>
        </div>
    </c:forEach>
</body>
</html>
