
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CadastroArtista</title>
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
          .back-button {
            position: absolute;
            top: 15px;
                            left: 15px;
                        }

                        .back-button a {
                            text-decoration: none;
                            color: red;
                            font-size: 18px;
                        }

                        .back-button a:hover {
                            text-decoration: underline;
                        }

                        .back-button a::before {
                            content: "← ";
                        }

    </style>
    </head>
<body>

<div class="container">
<div class="back-button">
   <a href="index.html"></a>
  </div>
    <div class="login">CADASTRO</div>

    <form action="/create-usuario" method="post" class="formulario" enctype="multipart/form-data">

<div class="input-container">
            <input type="hidden" name="id" value="${param.id}">

                <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="Nome "/>
                <label for="nome"></label>

                <label for="email"></label>
                <input type="email" name="email" id="email" value="${param.email}" required placeholder=" Email "/>

                <label for="senha"></label>
                <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder=" Senha "/>

                <label for="telefone"></label>
                <input type="text" name="telefone" id="telefone" value="${param.telefone}" placeholder="Telefone"/>

                <label for="endereco"></label>
                <input type="text" name="endereco" id="endereco" value="${param.endereco}" placeholder=" Endereço "/>

                 <label for="imagemPerfil"></label>
                 <input type="file" name="imagemPerfil" id="imagemPerfil"/>

                 <label for="tipo_usuario">Tipo de usuário:</label>
                 <select name="tipo_usuario" id="tipo_usuario" required>
                <option value="usuario" ${param.tipo_usuario == 'usuario' ? 'selected' : ''}>Usuário</option>
                <option value="tatuador" ${param.tipo_usuario == 'tatuador' ? 'selected' : ''}>Tatuador</option>
                </select>

        </div>

   <div class="button-container">
                    <button>Cadastrar</button>
                </div>
    </form>
</div>
</body>
</html>