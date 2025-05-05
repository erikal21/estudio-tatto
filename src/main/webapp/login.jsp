<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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

        input {
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

        .register-link {
            margin-top: 20px;
            text-align: center;
        }

        .register-link a {
            color: red;
            text-decoration: none;
            font-size: 14px;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
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
            <a href="cadastro.jsp">Criar uma conta</a>
        </div>
    </form>
</div>

</body>
</html>
