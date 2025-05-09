<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Artista</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 40px;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #aaa;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 15px; /* Espaçamento entre os inputs */
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .button-container {
            margin-top: 25px;
            text-align: center;
        }

        button {
            padding: 12px 24px;
            background-color: #444;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }

        button:hover {
            background-color: #666;
        }

        .delete-btn {
            background-color: red;
            margin-top: 20px;
        }

        .delete-btn:hover {
            background-color: darkred;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

    </style>
</head>
<body>

<div class="container">
    <h2>Perfil do Artista</h2>

    <form action="/atualizar-perfil-artista" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">

        <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="Nome">
        <input type="email" name="email" id="email" value="${param.email}" required placeholder="E-mail">
        <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder="Senha">
        <input type="text" name="telefone" id="telefone" value="${param.telefone}" placeholder="Telefone">
        <input type="text" name="endereco" id="endereco" value="${param.endereco}" placeholder="Endereço">

        <textarea name="descricao" id="descricao" placeholder="Fale um pouco sobre você">${param.descricao}</textarea>

        <!-- Label apenas para foto de perfil e imagens -->
        <label for="fotoPerfil">Foto de Perfil:</label>
        <input type="file" name="fotoPerfil" id="fotoPerfil" accept="image/*">

        <label for="trabalhos">Imagens dos seus Trabalhos:</label>
        <input type="file" name="trabalhos" id="trabalhos" accept="image/*" multiple>

        <div class="button-container">
            <button type="submit">Salvar Alterações</button>
        </div>
    </form>

    <form action="/excluir-conta" method="post" onsubmit="return confirm('Tem certeza de que deseja excluir sua conta?');">
        <div class="button-container">
            <button type="submit" class="delete-btn">Excluir Conta</button>
        </div>
    </form>
</div>

</body>
</html>
