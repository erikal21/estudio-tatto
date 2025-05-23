<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.estudio.model.TatuadorUsuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Meu Perfil</title>
</head>
<body>
    <h1>Meu Perfil</h1>

    <div style="border: 1px solid #000; padding: 10px; margin: 10px;">
        <p><strong>Especialidade:</strong> ${tatuador.especialidade}</p>
        <p><strong>Descrição:</strong> ${tatuador.descricao}</p>
        <div>
            <img src="${pageContext.request.contextPath}/${tatuador.foto1}" width="150"/>
            <img src="${pageContext.request.contextPath}/${tatuador.foto2}" width="150"/>
            <img src="${pageContext.request.contextPath}/${tatuador.foto3}" width="150"/>
        </div>
    </div>
</body>
</html>
