<!DOCTYPE html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Landingpage</title>

    <link
      rel="stylesheet"
      href="@import url('https://fonts.cdnfonts.com/css/annabelle');"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap"
      rel="stylesheet"
    />

    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #121212;
        color: white;
        margin: 0;
        padding: 0;
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
      .hero {
        position: relative;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding: 20px;
        overflow: hidden;
      }

      .hero::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url("img/tattoo1.jpg") no-repeat center center/cover;
        filter: brightness(24%);
        z-index: -1;
        opacity: 0.4;
      }
      .hero h1 {
        font-family: "'Dancing Script', cursive";
        font-size: 50px;
        font-weight: bold;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      }
      .hero span {
        font-style: "'Dancing Script', cursive";
        font-size: 40px;
      }
      #sobre {
        padding: 50px;
        text-align: left;
      }
      #sobre h2 {
        font-size: 100px;
        margin-bottom: 30px;
        color: #fff;
        opacity: 0.5;
      }
      #sobre p {
        font-size: 24px;
        max-width: 800px;
      }
      .fotosTattoo {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
        margin-top: 30px;
      }
      .fotosTattoo img {
        width: 100%;
        height: auto;
        border-radius: 8px;
      }
    </style>
  </head>
  <body>
    <header>
      <nav>
        <ul>
          <li><a href="">Home </a></li>
          <li><a href="">Sobre </a></li>
          <li><a href="">Loja </a></li>
          <li><a href="">Artistas </a></li>
          <li><a href="">Contato </a></li>
        </ul>
      </nav>
    </header>

    <section class="hero" id="Home">
      <div>
        <h1>
          ENCONTRE <br />
          o tatuador <br />
          PERFEITO <br />
          para <span>VOCÊ</span>
        </h1>
      </div>
    </section>

    <section id="sobre">
      <h2>SOBRE</h2>
      <p>
        Bem-vindo ao StudioTatto, a plataforma que conecta tatuadores talentosos
        a pessoas que desejam transformar ideias em arte na pele. Seja você um
        apaixonado por tatuagens em busca do artista ideal ou um tatuador
        querendo expandir seu alcance e mostrar seu trabalho, este é o lugar
        certo!
      </p>
      <div class="fotosTattoo">
        <img src="img/fotoT67.jpg" alt="Foto1">
        <img src="img/fotoT2.jpg" alt="Foto2">
        <img src="img/fotoT3.jpg" alt="Foto3">
        <img src="img/fotoT5.jpg" alt="Foto4">
      </div>
    </section>

    <footer></footer>
  </body>
</html>
