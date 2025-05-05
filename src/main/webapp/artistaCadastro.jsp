<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">
    <style>
            body {
                background-color: #000;
                font-family: 'Oswald', sans-serif;
                margin: 0;
                padding: 0;
                color: white;
            }

            .container {
                max-width: 400px;
                margin: 60px auto;
                background-color: #000;
                padding: 40px;
                border-radius: 8px;
                position: relative;
            }

            .login {
                font-size: 36px;
                color: red;
                text-align: center;
                margin-bottom: 30px;
            }

            .input-container {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            input, select {
                background-color: #000;
                border: 2px solid red;
                color: white;
                padding: 10px;
                border-radius: 4px;
                font-size: 16px;
            }

            input::placeholder {
                color: #aaa;
            }

            label {
                display: none;
            }

            .button-container {
                margin-top: 30px;
                text-align: center;
            }

            button {
                background-color: #000;
                color: white;
                padding: 12px 20px;
                border: 2px solid red;
                cursor: pointer;
                font-family: 'Oswald', sans-serif;
                transition: background-color 0.3s, border-color 0.3s;
                font-size: 16px;
                border-radius: 5px;
            }

            button:hover {
                background-color: red;
                color: black;
            }
        </style>
</head>
<body>

<div class="container">
    <div class="login">
        CADASTRO
        DE
        ARTISTA
    </div>
<form action="/create-usuario" method="post" class="formulario" enctype="multipart/form-data">

<div class="input-container">

        <input type="hidden" name="id" value="${param.id}">

        <label for="nome">Digite o seu nome:</label>
        <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder=" Nome ">

        <label for="email">Digite o seu e-mail:</label>
        <input type="email" name="email" id="email" value="${param.email}" required placeholder=" Email ">

        <label for="senha">Digite a sua senha:</label>
        <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder=" Senha ">

        <label for="telefone">Digite seu telefone:</label>
        <input type="text" name="telefone" id="telefone" value="${param.telefone}" required placeholder=" Telefone ">

        <label for="endereco">Digite seu endereço:</label>
        <input type="text" name="endereco" id="endereco" value="${param.endereco}" required placeholder=" Endereço ">

</div>
           <div class="button-container">
                            <button>Cadastrar</button>
                        </div>
    </form>
</div>

</body>
</html>