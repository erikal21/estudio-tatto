<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>Cadastro de Artista</title>
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

        input, textarea {
            background-color: #000;
            border: 2px solid red;
            color: white;
            padding: 10px;
            border-radius: 4px;
            font-size: 16px;
        }

        textarea {
            height: 100px;
            resize: none;
        }

        input::placeholder, textarea::placeholder {
            color: #aaa;
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
        CADASTRO DE ARTISTA
    </div>
    <form action="/create-artista" method="post" class="formulario" enctype="multipart/form-data">

        <div class="input-container">
            <label for="descricao">Descrição do Perfil:</label>
            <textarea name="descricao" id="descricao" required placeholder="Conte um pouco sobre você"></textarea>

            <label for="especialidade">Especialidade:</label>
            <input type="text" name="especialidade" id="especialidade" required placeholder="Especialidade"/>

            <label for="fotos">Fotos do Trabalho:</label>
            <input type="file" name="foto1" id="foto1" required/>
            <input type="file" name="foto2" id="foto2"/>
            <input type="file" name="foto3" id="foto3"/>

        </div>

        <div class="button-container">
            <button type="submit">Cadastrar Perfil</button>
        </div>
    </form>
</div>

</body>
</html>
