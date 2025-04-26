<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Perfil do Artista</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f3f3f3;
            font-family: 'Oswald', sans-serif;
            color: black;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: white;
            margin: 50px auto;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 800px;
        }

        h1 {
            font-size: 32px;
            color: #621AD2;
            margin-bottom: 20px;
        }

        .formulario {
            display: flex;
            flex-direction: column;
            width: 100%;
            gap: 20px;
        }

        input, textarea, button {
            font-family: 'Oswald', sans-serif;
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 10px;
            width: 100%;
            font-size: 16px;
        }

        textarea {
            resize: none;
            height: 100px;
        }

        button {
            background-color: #621AD2;
            color: white;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 18px;
        }

        button:hover {
            background-color: #4a139f;
        }

        .back-icon {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            font-size: 24px;
            color: #621AD2;
            font-weight: bold;
        }
    </style>
</head>
<body>

<a href="home.jsp" class="back-icon">&#x21A9;</a>
<div class="container">
    <h1>Perfil do Artista</h1>
    <form method="post" action="UpdateArtistProfileServlet" class="formulario" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="Nome">
        <input type="email" name="email" id="email" value="${param.email}" required placeholder="E-mail">
        <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder="Senha">
        <textarea name="descricao" id="descricao" placeholder="Descrição do Artista" required>${param.descricao}</textarea>
        <label for="profilePhoto">Foto de Perfil</label>
        <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*">
        <label for="artImages">Imagens das Artes</label>
        <input type="file" id="artImages" name="artImages" accept="image/*" multiple>
        <button type="submit">Salvar Alterações</button>
    </form>
</div>
</body>
</html>
