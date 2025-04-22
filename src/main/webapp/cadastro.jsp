

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
    </div>
    <form action="/create-usuario" method="post" class="formulario">

<div class="input-container">
            <input type="hidden" name="id" value="${param.id}">
         <input type="text" name="nome" id="nome" value="${param.nome}" required placeholder="    Nome "/>
         <label for="nome"></label>

                 <label for="email"></label>
                 <input type="email" name="email" id="email" value="${param.email}" required placeholder=" Email "/>

                 <label for="senha"></label>
                 <input type="password" name="senha" id="senha" value="${param.senha}" required placeholder=" Senha "/>

                 <label for="telefone"></label>
                 <input type="text" name="telefone" id="telefone" value="${param.telefone}" placeholder="Telefone"/>

                 <label for="endereco"></label>
                 <input type="text" name="endereco" id="endereco" value="${param.endereco}" placeholder=" Endereço "/>
        </div>





        <div class="button-container">
                    <button>Cadastrar</button>
                </div>
    </form>
</div>

</body>
</html>