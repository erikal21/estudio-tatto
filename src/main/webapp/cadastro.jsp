<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Cadastro</title>
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">

  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: black;
      font-family: 'Oswald', sans-serif;
      color: white;
    }

    header {
      display: flex;
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
      margin: 0;
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
      justify-content: flex-start;
      padding-top: 140px;
    }

    .login {
      font-size: 65px;
      color: #621AD2;
      text-align: left;
      align-self: flex-start;
      margin-left: 50px;
      margin-bottom: 40px;
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
  <div class="login">CADASTRO</div>

  <form action="/create-usuario" method="post" class="formulario" enctype="multipart/form-data">
    <div class="input-container">
      <input type="hidden" name="id" value="${param.id}">
      <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="Nome"/>
      <input type="email" name="email" id="email" value="${param.email}" required placeholder="Email"/>
      <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder="Senha"/>
    </div>
    <div class="button-container">
      <button type="submit">CADASTRAR</button>
    </div>
    </form>
</div>
</body>
</html>
