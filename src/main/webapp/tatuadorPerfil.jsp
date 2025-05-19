<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Perfil dos Tatuadores</title>
    <style>
        .artist {
            border: 1px solid #ccc;
            margin: 10px;
            padding: 10px;
            border-radius: 8px;
            width: 250px;
            display: inline-block;
            vertical-align: top;
        }
        .artist-image {
            width: 200px;
            height: 200px;
            border-radius: 10px;
            background-size: cover;
            background-position: center;
            margin-bottom: 10px;
        }
        .btn-gallery {
            display: inline-block;
            padding: 6px 12px;
            background-color: #333;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
    <script>
        function openModal(id) {
            document.getElementById(id).style.display = "flex";
        }
        function closeModal(id) {
            document.getElementById(id).style.display = "none";
        }
    </script>
</head>
<body>

<h1>Lista de Tatuadores</h1>

<div>
    <c:forEach var="tatuador" items="${tatuadores}">
        <div class="artist">
            <div class="artist-image" style="background-image: url('${tatuador.foto1}');"></div>
            <h2>${tatuador.nome}</h2>
            <p><strong>Especialidade:</strong> ${tatuador.especialidade}</p>
            <p>${tatuador.descricao}</p>
            <a href="#" class="btn-gallery" onclick="openModal('modal-${tatuador.idTatuador}')">Ver Galeria</a>
        </div>

        <!-- Modal com galeria -->
        <div id="modal-${tatuador.idTatuador}" style="display:none; position:fixed; top:0; left:0;
            width:100%; height:100%; background: rgba(0,0,0,0.8); justify-content:center; align-items:center;">
            <div style="background:#fff; padding:20px; border-radius:8px; max-width:600px; width:90%; position:relative;">
                <button style="position:absolute; top:10px; right:10px;" onclick="closeModal('modal-${tatuador.idTatuador}')">X</button>
                <h2>${tatuador.nome} - Galeria</h2>
                <p>${tatuador.descricao}</p>
                <div>
                    <img src="${tatuador.foto1}" alt="Foto 1" style="max-width:100%; margin-bottom:10px;">
                    <img src="${tatuador.foto2}" alt="Foto 2" style="max-width:100%; margin-bottom:10px;">
                    <img src="${tatuador.foto3}" alt="Foto 3" style="max-width:100%; margin-bottom:10px;">
                </div>
            </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
