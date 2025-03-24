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
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap" rel="stylesheet">
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
      // diego aqui


      .container {
          padding: 50px;
          background-color: #621AD2;
      }
      .contato {
          font-family: 'Oswald', sans-serif;
          font-size: 100px;
          text-transform: uppercase;
          color: #310C77;
          padding-right: 500px;
          margin-bottom: -20px;

      }
      .fale {
          font-size: 70px;
          font-family: 'Oswald', sans-serif;
          padding-right: 250px;
          margin-top: -20px;
          margin-bottom: -10px;

      }
      .conosco {
          font-size: 80px;
          font-family: 'Oswald', sans-serif;
          color: #310C77;
          padding-left: 100px;
          padding-left: 0;
          margin-top: -20px;

      }
      .info {
          display: flex;
          justify-content: center;
          gap: 50px;
          margin-top: 30px;
      }
      .info div {
          text-align: left;
      }
      .social {
          margin-top: 50px;
      }
      .social a {
          color: white;
          font-weight: bold;
          margin: 0 10px;
          text-decoration: none;
      }
      .container2 {
          display: flex;
          width: 100vw;
          height: 100vh;
      }
      .metade-esquerda {
          width: 50%;
          height: 100%;
          background-color: #D9D9D9;
      }
      .metade-direita {
          width: 50%;
          height: 100%;
          background-color: black;

      }
      .form {
          font-family: 'Oswald', sans-serif;
          font-size: 100px;
          text-transform: uppercase;
          color: #D9D9D9;
          padding-right: 500px;


      }
      .input-container {
          margin-top: 100px;
      }
      .input-container input {
          width: 80%;
          max-width: 400px;
          outline: none;
          padding: 10px;
          border: 2px solid red;
          background-color: black;
          font-size: 16px;
          text-align: center;
          color: #ffffff;
      }
      .input-container input::placeholder {
          color: white;
          opacity: 0.7;
      }

      .button-container {
          margin-top: 30px;
      }
      .button-container button {
          width: 80%;
          max-width: 330px;
          padding: 10px;
          border: 2px solid red;
          background-color: black;
          font-size: 16px;
          text-align: center;
          color: #ffffff;
          font-size: 15px;
          font-family: 'Oswald', sans-serif;
      }
      .container3 {
          background-color: black;

          width: 100vw;
          height: 100vh;
      }
      .faq {
          font-family: 'Oswald', sans-serif;
          font-size: 100px;
          text-transform: uppercase;
          color: #D9D9D9;
          padding-right: 900px;

      }
      .principais {
          font-size: 70px;
          font-family: 'Oswald', sans-serif;
          padding-right: 250px;
          margin-top: -20px;
          margin-bottom: -10px;

      }
      .perguntas {
          font-size: 80px;
          font-family: 'Oswald', sans-serif;
          color: #310C77;
          padding-left: 100px;
          padding-left: 0;
          margin-top: -20px;
      }
      .button {
          width: 50px;
          height: 50px;
          font-size: 30px;
          font-weight: bold;
          color: #310C77;
          background-color: transparent;
          border: 2px solid red;
          cursor: pointer;
          justify-content: center;
          align-items: center;
          transition: 0.3s;
      }

      .button:hover {
          background-color: red;
          color: white;
      }


      .lista {
          display: flex;
          justify-content: space-between;
          align-items: center;
          flex-direction: column;
      }

      .lista1 {
          display: flex;
          justify-content: space-between;
          align-items: center;
      }
      .title {
          font-size: 22px;
          font-weight: bold;
      }

      .subtitle {
          color: #621AD2;
          font-size: 18px;
          margin-top: 10px;
      }
      .description {
          font-size: 14px;
          color: #aaa;
          margin-top: 10px;
          max-width: 500px;
      }

      .number {
          color: #621AD2;
          font-size: 14px;
      }

      .container4 {
          padding-left: 300px;
          display: flex;
          flex-direction: column;
          gap: 16px;
        }

        .column {
          flex: 1;
          max-width: 50%;
          box-sizing: border-box;
        }
        .column1 {
          flex: 1;
          max-width: 50%;
          box-sizing: border-box;
        }
        .item {
          color: #621AD2;
          font-family: 'Oswald', sans-serif;
          font-size: 15px;
        }
        .input-faq {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 8px;
          margin: 4px 0;
        }
        .input-faq {
          margin-top: 100px;
      }
      .input-faq input {
          width: 100%;
          max-width: 400px;
          outline: none;
          padding: 10px;
          border: 2px solid rgb(0, 0, 0);
          background-color: black;
          font-size: 20px;
          text-align: center;
          color: #ffffff;
      }
      .input-faq input::placeholder {
          color: white;
          opacity: 0.7;
      }



      .input-faq1 {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 8px;
          margin: 4px 0;
        }
        .input-faq1 {
          margin-top: 100px;
      }
      .input-faq1 input {
          width: 100%;
          max-width: 400px;
          outline: none;
          padding: 10px;
          border: 2px solid rgb(0, 0, 0);
          background-color: black;
          font-size: 20px;
          text-align: center;
          color: #ffffff;
      }
      .input-faq1 input::placeholder {
          color: #621AD2;
          opacity: 0.7;
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

    // diego aqui

    <div class="container3">
            <div class="faq">FAQ</div>
            <div class="principais">PRINCIPAIS</div>
            <div class="perguntas">PERGUNTAS</div>

            <div class="container4">
                <div class="column">
                    <div class="input-faq">
                        <input type="text" placeholder="Digite sua pergunta">
                        <div class="item">1</div>
                        <button class="button">+</button>
                    </div>
                </div>
                <div class="column1">
                    <div class="input-faq1">
                        <input type="text" placeholder="Digite sua pergunta">
                        <div class="item">1</div>
                        <button class="button">-</button>
                    </div>
                </div>
            </div>

            <div class="description">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                It has been the industry's standard dummy text ever since the 1500s.
            </div>
        </div>

        <div class="container2">
            <div class="metade-esquerda"></div>
            <div class="metade-direita">
                <div class="form">FORM</div>
                <div class="input-container">
                    <input type="text" placeholder="Digite sua dúvida">
                </div>
                <div class="button-container">
                    <button>BOTÃO DE CONTATO</button>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="contato">CONTATO</div>
            <div class="fale">FALE</div>
            <div class="conosco">CONOSCO</div>

            <div class="info">
                <div>
                    <p><strong>ENDEREÇO</strong><br>Rua Dr. Simões Mendes <br>03475900</p>
                </div>
                <div>
                    <p><strong>TELEFONE</strong><br>(11) 9999-9999</p>
                </div>
                <div>
                    <p><strong>EMAIL</strong><br>studdio.tatto@gmail.com</p>
                </div>
            </div>

            <div class="social">
                <p>
                    <a href="https://www.instagram.com/">INSTAGRAM</a>
                    <a href="https://www.facebook.com/">FACEBOOK</a>
                    <a href="https://x.com/">TWITTER</a>
                    <br> Siga para atualizações e inspirações
                </p>
            </div>
        </div>

  </body>
</html>
