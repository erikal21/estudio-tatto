<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Landingpage</title>
    <link href="https://fonts.cdnfonts.com/css/annabelle" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="">Home</a></li>
            <li><a href="">Sobre</a></li>
            <li><a href="">Loja</a></li>
            <li><a href="">Artistas</a></li>
            <li><a href="">Contato</a></li>
            <li><a href="login.jsp">👤</a></li>
        </ul>
    </nav>
</header>

<section class="hero" id="Home">
    <div>
        <h1>
            ENCONTRE <br/>
            o tatuador <br/>
            PERFEITO <br/>
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
        <img src="imgL/fotoT67.jpg" alt="Foto1"/>
        <img src="imgL/fotoT2.jpg" alt="Foto2"/>
        <img src="imgL/fotoT3.jpg" alt="Foto3"/>
        <img src="imgL/fotoT5.jpg" alt="Foto4"/>
    </div>
</section>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section id="artistas" class="section">
    <div class="container">
        <div class="header">
            <h1>ARTISTAS</h1>
        </div>
        <div class="carousel">
            <div class="artists" id="artists">
                <c:forEach var="tatuador" items="${tatuadores}">
                    <div class="artist">
                        <div class="artist-image" style="background-image: url('${tatuador.foto1}'); background-size: cover; background-position: center; width: 200px; height: 200px; border-radius: 10px;"></div>
                        <h2>${tatuador.nome}</h2>
                        <p>${tatuador.especialidade}</p>
                        <a href="#" onclick="openModal('modal-${tatuador.idTatuador}')">VER GALERIA</a>
                    </div>
                </c:forEach>
            </div>
            <div class="carousel-buttons">
                <button class="carousel-button" onclick="prevSlide('artists')">❮</button>
                <button class="carousel-button" onclick="nextSlide('artists')">❯</button>
            </div>
        </div>
    </div>
</section>

<!-- Seção Reviews -->
<section id="reviews" class="section">
    <div class="container">
        <div class="header">
            <h1>REVIEWS</h1>
        </div>
        <div class="review-container">
            <div class="review-card">
                <p>“Ótimo atendimento e trabalho impecável!”</p>
                <h3>Carla M.</h3>
            </div>
            <div class="review-card">
                <p>“Ótima experiência!”</p>
                <h3>João Silva</h3>
            </div>
        </div>
    </div>
</section>

<!-- Seção Serviços -->
<section id="servicos" class="section">
    <div class="container">
        <div class="header">
            <h1>SERVIÇOS</h1>
        </div>
        <div class="service-container">
            <div class="service-card">
                <h2>TATUAGENS</h2>
                <p>Lorem ipsum is simply dummy text of the printing and typesetting industry. text ever since the 1500s,</p>
            </div>
            <div class="service-card">
                <h2>TATUAGENS</h2>
                <p>Lorem ipsum is simply dummy text of the printing and typesetting industry. text ever since the 1500s,</p>
            </div>
            <div class="service-card">
                <h2>TATUAGENS</h2>
                <p>Lorem ipsum is simply dummy text of the printing and typesetting industry. text ever since the 1500s,</p>
            </div>
            <div class="service-card">
                <h2>TATUAGENS</h2>
                <p>Lorem ipsum is simply dummy text of the printing and typesetting industry. text ever since the 1500s,</p>
            </div>
        </div>
    </div>
</section>

<!-- Seção FAQ -->
<section id="faq-section">
    <div class="faq-container">
        <div class="faq-header">
            <div class="faq">FAQ</div>
            <div class="principais">PRINCIPAIS</div>
            <div class="perguntas">PERGUNTAS</div>
        </div>
        <div class="faq-items">
            <div class="faq-item">
                <div class="question">QUANTO TEMPO LEVA PARA FAZER UMA TATUAGEM?</div>
                <div class="number">01</div>
                <button class="faq-button">+</button>
                <div class="answer">
                    O tempo varia dependendo do tamanho e complexidade da tatuagem. Uma tatuagem pequena pode levar cerca de 1 hora, enquanto designs maiores podem levar várias sessões de 3 a 5 horas cada.
                </div>
            </div>
            <div class="faq-item">
                <div class="question">QUAIS SÃO OS CUIDADOS APÓS FAZER UMA TATUAGEM?</div>
                <div class="number">02</div>
                <button class="faq-button">-</button>
                <div class="answer">
                    Mantenha a tatuagem limpa, aplique uma pomada cicatrizante recomendada pelo tatuador, evite exposição ao sol e não coce ou retire as casquinhas durante a cicatrização, que leva cerca de 2 a 4 semanas.
                </div>
            </div>
        </div>
        <div class="faq-description">
            Lorem ipsum is simply dummy text of the printing and typesetting industry, text ever since the 1500s, when an unknown printer
        </div>
    </div>
</section>

<div class="container2">
    <div class="metade-esquerda">
        <div class="boxEsq">
            <div class="contato">TRABALHE</div>
            <div class="conosco">CONOSCO</div>
        </div>
        <div class="description1">
            Somos um estúdio de tatuagem que vai além da tinta na pele, aqui respiramos arte, criatividade e autenticidade todos os dias. Nosso espaço é moderno, acolhedor e focado em proporcionar a melhor experiência tanto para os nossos clientes quanto para os profissionais que trabalham conosco.
            Estamos em busca de tatuadores(as) talentosos, apaixonados pela arte e comprometidos com o atendimento de qualidade. Seja você iniciante ou experiente, aqui você terá liberdade para criar, desenvolver seu estilo e crescer junto com a gente.
            Você é um artista e busca um espaço onde sua arte seja valorizada?
            <div class="geforce">
                <a href="artistaCadastro.jsp">Então venha fazer parte do nosso time!</a>
            </div>
        </div>
    </div>
    <div class="metade-direita">
        <div class="form">FORM</div>
        <div class="input-container">
            <input type="text" placeholder="Digite sua dúvida"/>
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
            <p>
                <strong>ENDEREÇO</strong><br/>Rua Dr. Simões Mendes <br/>03475900
            </p>
        </div>
        <div>
            <p><strong>TELEFONE</strong><br/>(11) 9999-9999</p>
        </div>
        <div>
            <p><strong>EMAIL</strong><br/><a href="/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="a2d1d6d7c6c6cbcd8cd6c3d6d6cde2c5cfc3cbce8cc1cdcf">[email protected]</a></p>
        </div>
    </div>
    <div class="social">
        <p>
            <a href="https://www.instagram.com/">INSTAGRAM</a>
            <a href="https://www.facebook.com/">FACEBOOK</a>
            <a href="https://x.com/">TWITTER</a>
            <br/>
            Siga para atualizações e inspirações
        </p>
    </div>
</div>

<script>
    function openModal(id) {
        document.getElementById(id).style.display = "flex";
    }

    function closeModal(id) {
        document.getElementById(id).style.display = "none";
    }

    let carouselIndices = {
        'artists': 0
    };

    function updateCarousel(carouselId) {
        const carousel = document.getElementById(carouselId);
        const items = carousel.querySelectorAll('.artist');
        const totalItems = items.length;
        const slideWidth = 100 / 3; // Cada item ocupa 33.33% do carrossel
        const maxIndex = Math.max(0, totalItems - 3); // Mostra 3 itens por vez
        if (carouselIndices[carouselId] > maxIndex) carouselIndices[carouselId] = maxIndex;
        if (carouselIndices[carouselId] < 0) carouselIndices[carouselId] = 0;
        carousel.style.transform = `translateX(-${carouselIndices[carouselId] * slideWidth}%)`;
    }

    function nextSlide(carouselId) {
        carouselIndices[carouselId]++;
        updateCarousel(carouselId);
    }

    function prevSlide(carouselId) {
        carouselIndices[carouselId]--;
        updateCarousel(carouselId);
    }

    // Toggle FAQ answers
    document.querySelectorAll('.faq-button').forEach(button => {
        button.addEventListener('click', () => {
            const faqItem = button.parentElement;
            const answer = faqItem.querySelector('.answer');
            const isHidden = answer.style.display === 'none' || answer.style.display === '';

            if (isHidden) {
                answer.style.display = 'block';
                button.textContent = '−';
            } else {
                answer.style.display = 'none';
                button.textContent = '+';
            }
        });
    });
</script>
<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="./script.js"></script>
</body>
</html>