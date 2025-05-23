<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.estudio.model.TatuadorUsuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
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
