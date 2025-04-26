<<<<<<< HEAD
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
=======
>>>>>>> a6d846a59a303e87e0b884dac46d5584b8ec5b78
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">
<<<<<<< HEAD

    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: black;
            font-family: 'Oswald', sans-serif;
            color: white;
        }

           header {
               justify-content: center;
             }

             nav {
               position: absolute;
               top: 20px;
               width: 100%;
               text-align: center;
               z-index: 10;
             }
             nav ul {
               display: flex;
               justify-content: center;
               list-style: none;
               padding: 0;
             }
             nav ul li {
               margin: 0 15px;
             }
             nav ul li a {
               color: white;
               text-decoration: none;
               font-size: 18px;
             }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 200px;
        }

        .login {
            font-size: 100px;
            color: #621AD2;
            align-self: flex-start;
            margin-left: 50px;
        }

        .formulario {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        .input-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            width: 100%;
        }

        .input-container input {
            background-color: black;
            border: 2px solid red;
            color: white;
            padding: 15px;
            width: 300px;
            font-size: 16px;
            border-radius: 5px;
        }

        .button-container {
            margin-top: 30px;
        }

        .button-container button {
            background-color: black;
            border: 2px solid red;
            color: white;
            font-size: 16px;
            padding: 15px;
            width: 300px;
            cursor: pointer;
            font-family: 'Oswald', sans-serif;
            transition: background 0.3s, border-color 0.3s;
        }

        .button-container button:hover {
            background-color: #621AD2;
            border-color: white;
        }

        .criar-conta {
            margin-top: 20px;
        }

        .criar-conta a {
            color: #621AD2;
            text-decoration: none;
        }
    </style>
</head>
<body>

<header>

    <nav>
        <ul>
            <li><a href="index.jsp">Voltar</a></li>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>
            <li><a href="loja.jsp">Loja</a></li>
            <li><a href="artistas.jsp">Artistas</a></li>
            <li><a href="contato.jsp">Contato</a></li>
        </ul>
    </nav>
</header>

<div class="container">
 <div class="login">LOGIN</div>
    <form action="create-estudio" method="post" class="formulario">
        <div class="input-container">
            <input type="text" name="nm-email" id="nm-email" required placeholder="Email">
            <input type="password" name="nm-password" id="nm-password" required placeholder="Senha">
        </div>

        <div class="button-container">
            <button type="submit">Entrar</button>
        </div>

        <div class="criar-conta">
            <a href="cadastro.jsp">Criar uma conta</a>
        </div>
=======
    <link rel="stylesheet" href="./tela1.css">

</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="./index.html">Voltar</a></li>
            <li><a href="">Home </a></li>
            <li><a href="">Sobre </a></li>
            <li><a href="">Loja </a></li>
            <li><a href="">Artistas </a></li>
            <li><a href="">Contato </a></li>
        </ul>
    </nav>
</header>
<div class="container">
    <div class="login">
        LOGIN
    </div>
    <div class="input-container">
    <form action="/create-estudio" method="post" class="formulario">

        <label for="nm-email"></label>
        <input type="text" name="nm-email" id="nm-email" required  placeholder=" Email ">

        <label for="nm-password"></label>
        <input type="text" name="nm-password" id="nm-password" required  placeholder=" Senha ">
    </div>
        <div class="button-container">
            <button>Cadastrar</button>
        </div>
        <a href="cadastro.jsp">Criar uma conta</a>
>>>>>>> a6d846a59a303e87e0b884dac46d5584b8ec5b78
    </form>
</div>

</body>
</html>
<<<<<<< HEAD
=======



>>>>>>> a6d846a59a303e87e0b884dac46d5584b8ec5b78
