<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=stylesheet"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Oswald", sans-serif;
            background-color: #121212;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 600px; /* Increased from 400px to make it wider */
            margin: 40px auto;
            background: #1a1a1a;
            border-radius: 12px;
            padding: 50px; /* Increased padding for balance */
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.3);
            position: relative;
            text-align: center;
        }

        .login {
            font-size: 48px;
            color: #d9d9d9;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .input-container {
            display: flex;
            flex-direction: column;
            gap: 25px; /* Increased gap for wider layout */
        }

        label {
            color: #ffffff;
            font-size: 18px;
            text-transform: uppercase;
        }

        input {
            background-color: #1a1a1a;
            border: 2px solid #621ad2;
            color: #b3b3b3;
            padding: 15px; /* Increased padding for wider input fields */
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            width: 100%; /* Ensure full width within container */
        }

        input:focus {
            border-color: red;
            outline: none;
        }

        input::placeholder {
            color: #666;
        }

        input:-webkit-autofill,
        input:-webkit-autofill:hover,
        input:-webkit-autofill:focus,
        input:-webkit-autofill:active {
            -webkit-box-shadow: 0 0 0 1000px #1a1a1a inset !important;
            -webkit-text-fill-color: #b3b3b3 !important;
            transition: background-color 5000s ease-in-out 0s;
        }

        input:-moz-autofill {
            box-shadow: 0 0 0 1000px #1a1a1a inset !important;
            -moz-text-fill-color: #b3b3b3 !important;
        }

        .button-container {
            margin-top: 40px;
            text-align: center;
        }

        button {
            background-color: transparent;
            color: white;
            padding: 12px 24px;
            border: 2px solid red;
            cursor: pointer;
            font-family: "Oswald", sans-serif;
            font-size: 16px;
            border-radius: 5px;
            text-transform: uppercase;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: red;
            color: #121212;
        }

        .register-link {
            margin-top: 20px;
            text-align: center;
        }

        .register-link a {
            color: red;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: #ff3333;
            text-decoration: underline;
        }

        .message {
            color: red;
            font-size: 16px;
            margin-bottom: 20px;
            text-align: center;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        .back-button a {
            text-decoration: none;
            color: red;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .back-button a:hover {
            color: #ff3333;
            text-decoration: underline;
        }

        .back-button a::before {
            content: "← ";
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 25px; /* Reduced padding on mobile */
            }
            .login {
                font-size: 36px;
            }
            label {
                font-size: 16px;
            }
            input {
                font-size: 14px;
                padding: 10px;
            }
            button {
                font-size: 14px;
                padding: 10px 20px;
            }
            .register-link a {
                font-size: 14px;
            }
            .message {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="back-button">
        <a href="index.jsp"></a>
    </div>
    <div class="login">LOGIN</div>

    <form action="/login" method="post">
        <c:if test="${not empty message}">
            <span class="message">${message}</span>
        </c:if>

        <div class="input-container">
            <label for="nm-email">Email</label>
            <input type="text" name="nm-email" id="nm-email" required placeholder="Digite seu email">

            <label for="nm-password">Senha</label>
            <input type="password" name="nm-password" id="nm-password" required placeholder="Digite sua senha">
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