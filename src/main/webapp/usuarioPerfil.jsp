<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Perfil do Usuário</title>
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
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #aaa;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 15px;
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

        .back-button {
            display: inline-flex;
            align-items: center;
            text-decoration: none;
            color: #444;
            font-weight: bold;
            margin-bottom: 20px;
            font-size: 16px;
            border: 2px solid #444;
            padding: 8px 12px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            background-color: #444;
            color: white;
        }

        .back-button i {
            margin-right: 8px;
        }
    </style>

    <!-- Ícone do botão voltar (via Font Awesome CDN) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="container">
    <a href="index.html" class="back-button"><i class="fas fa-arrow-left"></i>Voltar para Home</a>

    <h2>Perfil do Usuário</h2>

    <form action="/atualizar-perfil-usuario" method="post">
        <input type="hidden" name="id" value="${param.id}">

        <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="Nome">
        <input type="email" name="email" id="email" value="${param.email}" required placeholder="E-mail">
        <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder="Senha">
        <input type="text" name="telefone" id="telefone" value="${param.telefone}" placeholder="Telefone">
        <input type="text" name="endereco" id="endereco" value="${param.endereco}" placeholder="Endereço">

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
