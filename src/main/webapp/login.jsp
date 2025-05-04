<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./tela1.css">
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="./index.html">Voltar</a></li>
            <li><a href="">Home</a></li>
            <li><a href="">Sobre</a></li>
            <li><a href="">Loja</a></li>
            <li><a href="">Artistas</a></li>
            <li><a href="">Contato</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <div class="login">
        LOGIN
    </div>

    <form action="/login" method="post">

        <c:if test="${not empty message}">
            <span class="message">${message}</span>
        </c:if>

        <div class="input-container">
            <label for="nm-email"></label>
            <input type="text" name="nm-email" id="nm-email" required placeholder="Email">

            <label for="nm-password"></label>
            <input type="password" name="nm-password" id="nm-password" required placeholder="Senha">
        </div>

        <div class="button-container">
            <button type="submit">Logar</button>
        </div>

        <div class="register-link">
            <a href="cadastro.jsp">Nao possui uma conta?<br>Criar uma conta</a>
        </div>
    </form>
</div>

</body>
</html>
