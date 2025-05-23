<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Cadastro</title>
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
            max-width: 800px; /* Increased to accommodate 2x2 grid */
            margin: 40px auto;
            background: #1a1a1a;
            border-radius: 12px;
            padding: 40px;
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
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2x2 grid */
            gap: 20px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 8px; /* Spacing between label and input */
        }

        input, select {
            background-color: #1a1a1a;
            border: 2px solid #621ad2;
            color: #b3b3b3;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            width: 100%; /* Ensure full width within grid cell */
        }

        input:focus, select:focus {
            border-color: red;
            outline: none;
        }

        input::placeholder {
            color: #666;
        }

        label {
            color: #ffffff;
            font-size: 18px;
            text-transform: uppercase;
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
                padding: 20px;
            }
            .login {
                font-size: 36px;
            }
            .input-container {
                grid-template-columns: 1fr; /* Stack to single column on mobile */
            }
            label {
                font-size: 16px;
            }
            input, select {
                font-size: 14px;
                padding: 10px;
            }
            button {
                font-size: 14px;
                padding: 10px 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="back-button">
        <a href="login.jsp"></a>
    </div>
    <div class="login">CADASTRO</div>

    <form action="/create-usuario" method="post" class="formulario" enctype="multipart/form-data">
        <div class="input-container">
            <input type="hidden" name="id" value="${param.id}">

            <div class="input-group">
                <label for="nome">Nome</label>
                <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="Nome"/>
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" value="${param.email}" required placeholder="Email"/>
            </div>

            <div class="input-group">
                <label for="senha">Senha</label>
                <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder="Senha"/>
            </div>

            <div class="input-group">
                <label for="telefone">Telefone</label>
                <input type="text" name="telefone" id="telefone" value="${param.telefone}" placeholder="Telefone" maxlength="13"/>
            </div>

            <div class="input-group">
                <label for="endereco">Endereço</label>
                <input type="text" name="endereco" id="endereco" value="${param.endereco}" placeholder="Endereço"/>
            </div>

            <div class="input-group">
                <label for="imagemPerfil">Imagem de Perfil</label>
                 <input type="file" name="imagemPerfil" id="imagemPerfil"/>
            </div>

            <div class="input-group">
                <label for="tipo_usuario">Tipo de Usuário</label>
                <select name="tipo_usuario" id="tipo_usuario" required>
                    <option value="usuario" ${param.tipo_usuario == 'usuario' ? 'selected' : ''}>Usuário</option>
                    <option value="tatuador" ${param.tipo_usuario == 'tatuador' ? 'selected' : ''}>Tatuador</option>
                </select>
            </div>
        </div>

        <div class="button-container">
            <button>Cadastrar</button>
        </div>
    </form>
</div>

<script>
    const inputTelefone = document.getElementById("telefone");

    inputTelefone.addEventListener("input", function () {
        let valor = this.value.replace(/\D/g, "");

        if (valor.length > 11) {
            valor = valor.substring(0, 11);
        }

        if (valor.length > 7) {
            valor = valor.replace(/^(\d{2})(\d{5})(\d{0,4}).*/, '$1 $2-$3');
        } else if (valor.length > 2) {
            valor = valor.replace(/^(\d{2})(\d{0,5})/, '$1 $2');
        }

        this.value = valor;
    });
</script>
</body>
</html>