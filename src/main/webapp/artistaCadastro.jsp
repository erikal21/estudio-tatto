

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="tela1.css">
</head>
<body>

<div class="container">
    <div class="login">
        CADASTRO
        DE
        ARTISTA
    </div>
    <form action="/create-usuario" method="post" class="formulario">

        <input type="hidden" name="id" value="${param.id}">

        <label for="nome">Digite o seu nome:</label>
        <input type="text" name="nome" id="nome" value="${param.nome}" required>

        <label for="email">Digite o seu e-mail:</label>
        <input type="email" name="email" id="email" value="${param.email}" required>

        <label for="senha">Digite a sua senha:</label>
        <input type="password" name="senha" id="senha" value="${param.senha}" required>

        <label for="telefone">Digite seu telefone:</label>
        <input type="text" name="telefone" id="telefone" value="${param.telefone}">

        <label for="endereco">Digite seu endereço:</label>
        <input type="text" name="endereco" id="endereco" value="${param.endereco}">


        <button type="submit">Cadastrar</button>
    </form>
</div>

</body>
</html>