<!DOCTYPE html>
<html lang="pt-br">
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>EstudioTattoo</title>
    <link rel="stylesheet" href="styles.css" />
    <script defer src="script.js"></script>
    <style>
        body {
          background-color: #121212;
          font-family: 'Oswald', sans-serif;
          color: #ffffff;
          margin: 0;
          padding: 0;
        }

        section {
          padding: 50px;
        }

        .section-container {
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        h2 {
          font-size: 36px;
          font-weight: bold;
          margin-bottom: 20px;
          text-align: center;
          color: #310C77;
        }

        .container {
          display: flex;
          justify-content: center;
          gap: 20px;
          flex-wrap: wrap;
        }

        .card-wrapper {
          display: flex;
          flex-direction: column;
          align-items: center;
          text-align: center;
        }

        .card {
          background-color: #000000;
          padding: 20px;
          width: 250px;
        }

        .card img {
          width: 100%;
          height: auto;
        }

        .card-title,
        .card-description {
          margin-top: 10px;
          font-weight: bold;
          text-align: center;
        }

        .button_art {
          background-color: rgb(0, 0, 0);
          color: white;
          padding: 10px;
          border: 2px solid red;
          cursor: pointer;
          margin-top: 10px;
          transition: background-color 0.3s;
        }

        .button_art:hover {
          background-color: red;
        }

        .review-section {
          background-color: #121212;
          padding: 50px;
        }

        .review-card {
          background-color: #000000;
          padding: 20px;
          border: 4px solid red;
          position: relative;
          color: white;
        }

        .review-card::before {
          content: '“';
          font-size: 48px;
          color: red;
          display: block;
          text-align: left;
        }

        .review-card .author {
          margin-top: 10px;
          border-top: 2px solid red;
          padding-top: 5px;
          font-size: 14px;
          text-align: left;
          font-weight: bold;
        }

        .service-card {
          background-color: #000000;
          padding: 20px;
          border-top: 4px solid red;
          border-bottom: 4px solid red;
          text-align: center;
          color: #D9D9D9;
        }

        /* MODAL */
        .modal {
          display: none;
          position: fixed;
          z-index: 9999;
          left: 0;
          top: 0;
          width: 100vw;
          height: 100vh;
          background-color: rgba(0, 0, 0, 0.8);
          justify-content: center;
          align-items: center;
          padding: 20px;
        }

        .modal-content {
          background-color: #000000;
          padding: 30px;
          border: 2px solid #621AD2;
          width: 90%;
          max-width: 700px;
          border-radius: 12px;
          color: white;
          box-shadow: 0 0 20px #621AD2;
          position: relative;
          text-align: center;
          animation: fadeIn 0.4s ease-in-out;
        }

        .modal-content h2 {
          color: #310C77;
          font-size: 32px;
          margin-bottom: 10px;
        }

        .modal-content p {
          font-size: 16px;
          color: #aaa;
          margin: 5px 0;
        }

        .modal-content img {
          margin-top: 15px;
          max-width: 100%;
          height: auto;
          border: 2px solid #621AD2;
          border-radius: 8px;
        }

        .close {
          color: white;
          position: absolute;
          top: 15px;
          right: 20px;
          font-size: 28px;
          font-weight: bold;
          cursor: pointer;
          transition: color 0.3s;
        }

        .close:hover,
        .close:focus {
          color: red;
          text-decoration: none;
        }

        @keyframes fadeIn {
          from { opacity: 0; transform: scale(0.9); }
          to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>

<!-- Artistas -->
<section id="artistas" class="section-container">
    <h2>Artistas</h2>
    <div class="container">
        <div class="card-wrapper">
            <div class="card">
                <img src="artista1.jpg" alt="Artista 1">
            </div>
            <h3 class="card-title">Artista 1</h3>
            <p class="card-description">Especialista em realismo.</p>
            <button class="button" onclick="openModal('modal1')">Ver galeria</button>
        </div>
        <div class="card-wrapper">
            <div class="card">
                <img src="artista2.jpg" alt="Artista 2">
            </div>
            <h3 class="card-title">Artista 2</h3>
            <p class="card-description">Especialista em old school.</p>
            <button class="button" onclick="openModal('modal2')">Ver galeria</button>
        </div>
        <div class="card-wrapper">
            <div class="card">
                <img src="artista3.jpg" alt="Artista 3">
            </div>
            <h3 class="card-title">Artista 3</h3>
            <p class="card-description">Especialista em aquarela.</p>
            <button class="button" onclick="openModal('modal3')">Ver galeria</button>
        </div>
    </div>
</section>

<!-- Reviews -->
<section class="review-section section-container" id="reviews">
    <h2>Reviews</h2>
    <div class="container">
        <div class="review-card">Ótima experiência!
            <div class="author">- João Silva</div>
        </div>
        <div class="review-card">Muito profissional e talentoso!
            <div class="author">- Maria Santos</div>
        </div>
        <div class="review-card">Voltarei para mais tatuagens!
            <div class="author">- Carlos Mendes</div>
        </div>
    </div>
</section>

<!-- Serviços -->
<section id="servicos" class="section-container">
    <h2>Serviços</h2>
    <div class="container">
        <div class="service-card">
            <h3>Tatuagem Blackwork</h3>
            <p>Estilo monocromático com uso intenso de preto.</p>
        </div>
        <div class="service-card">
            <h3>Tatuagem Colorida</h3>
            <p>Design vibrante e colorido, com grande detalhamento.</p>
        </div>
        <div class="service-card">
            <h3>Tatuagem Minimalista</h3>
            <p>Linhas finas e desenhos sutis, perfeitos para traços delicados.</p>
        </div>
        <div class="service-card">
            <h3>Tatuagem Tribal</h3>
            <p>Design geométrico inspirado em culturas antigas.</p>
        </div>
    </div>
</section>

<!-- MODAIS -->

<div id="modal1" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal1')">&times;</span>
        <h2>Artista 1</h2>
        <p>Estilo: Realismo</p>
        <p>Localização: São Paulo, SP</p>
        <img src="portfolio1.jpg" alt="Portfólio Artista 1">
    </div>
</div>

<div id="modal2" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal2')">&times;</span>
        <h2>Artista 2</h2>
        <p>Estilo: Old School</p>
        <p>Localização: Rio de Janeiro, RJ</p>
        <img src="portfolio2.jpg" alt="Portfólio Artista 2">
    </div>
</div>

<div id="modal3" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('modal3')">&times;</span>
        <h2>Artista 3</h2>
        <p>Estilo: Aquarela</p>
        <p>Localização: Belo Horizonte, MG</p>
        <img src="portfolio3.jpg" alt="Portfólio Artista 3">
    </div>
</div>

<script>
    function openModal(id) {
      document.getElementById(id).style.display = 'flex';
    }

    function closeModal(id) {
      document.getElementById(id).style.display = 'none';
    }
</script>

</body>
</html>
