<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Landingpage</title>
    <link href="https://fonts.cdnfonts.com/css/annabelle" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="style.css"/>
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

<section id="artistas" class="section">
    <div class="container">
        <div class="header">
            <h1>ARTISTAS</h1>
        </div>

        <div class="carousel-container" style="position: relative; width: 100%; overflow: hidden;">
            <div class="carousel-wrapper" id="carouselWrapper" style="display: flex; transition: transform 0.5s ease;">
                <c:forEach var="tatuador" items="${tatuadores}">
                    <div class="artist" style="flex: 0 0 33.3333%; box-sizing: border-box; padding: 10px;">
                        <div class="artist-image" style="background-image: url('${tatuador.foto1}'); height: 400px; background-size: cover; background-position: center;"></div>
                        <h2>${tatuador.nome}</h2>
                        <p><strong>Especialidade:</strong> ${tatuador.especialidade}</p>
                        <a href="#" class="btn-gallery" onclick="openModal('modal-${tatuador.idTatuador}')">Ver Galeria</a>

                        <div id="modal-${tatuador.idTatuador}" class="modal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background: rgba(0,0,0,0.8); justify-content:center; align-items:center;">
                            <div style="background:#fff; padding:20px; border-radius:8px; max-width:600px; width:90%; position:relative;">
                                <button style="position:absolute; top:10px; right:10px;" onclick="closeModal('modal-${tatuador.idTatuador}')">X</button>
                               <h2 style="color: red;">${tatuador.nome} - Galeria</h2>
                                <p>${tatuador.descricao}</p>
                                <div style="display: flex; gap: 10px; justify-content: center; margin-top: 15px;">
                                    <img src="${tatuador.foto1}" alt="Foto 1" style="flex: 1; max-width: 33%; object-fit: cover; border-radius: 5px;">
                                    <img src="${tatuador.foto2}" alt="Foto 2" style="flex: 1; max-width: 33%; object-fit: cover; border-radius: 5px;">
                                    <img src="${tatuador.foto3}" alt="Foto 3" style="flex: 1; max-width: 33%; object-fit: cover; border-radius: 5px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<script>
    const wrapper = document.getElementById('carouselWrapper');
    const totalItems = wrapper.children.length;
    const itemsPerSlide = 3;
    const totalSlides = Math.ceil(totalItems / itemsPerSlide);
    let currentIndex = 0;

    function moveCarousel() {
        currentIndex++;
        if (currentIndex >= totalSlides) {
            currentIndex = 0;
        }
        const offset = -(currentIndex * 100);
        wrapper.style.transform = `translateX(${offset}%)`;
    }

    setInterval(moveCarousel, 4000);
</script>


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
                <div class="answer" style="display:none;">
                    O tempo varia dependendo do tamanho e complexidade da tatuagem. Uma tatuagem pequena pode levar cerca de 1 hora, enquanto designs maiores podem levar várias sessões de 3 a 5 horas cada.
                </div>
            </div>
            <div class="faq-item">
                <div class="question">QUAIS SÃO OS CUIDADOS APÓS FAZER UMA TATUAGEM?</div>
                <div class="number">02</div>
                <button class="faq-button">-</button>
                <div class="answer" style="display:block;">
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
            Somos um estúdio de tatuagem que vai além da tinta na pele, aqui respiramos arte, criatividade e autenticidade todos os dias. Nosso espaço é moderno, acolhedor e focado em proporcionar a melhor experiência tanto para os nossos clientes quanto para os profissionais. Venha fazer parte dessa família artística!
        </div>
        <button class="btn_contato">CONTATO</button>
    </div>
    <div class="metade-direita">
        <div class="linha"><img src="imgL/linha.svg" alt="Linha"/></div>
        <img src="imgL/foto.svg" alt="Foto" class="img"/>
    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-left">
            <a href="#">Contato</a>
            <a href="#">Política de Privacidade</a>
            <a href="#">Termos de Uso</a>
        </div>
        <div class="footer-right">
            <a href="#"><img src="imgL/facebook.svg" alt="Facebook"/></a>
            <a href="#"><img src="imgL/instagram.svg" alt="Instagram"/></a>
            <a href="#"><img src="imgL/twitter.svg" alt="Twitter"/></a>
        </div>
    </div>
</footer>

<script>
    function openModal(id) {
        document.getElementById(id).style.display = 'flex';
    }

    function closeModal(id) {
        document.getElementById(id).style.display = 'none';
    }

    document.addEventListener('DOMContentLoaded', function () {
        const wrapper = document.querySelector('.carousel-wrapper');
        const cards = wrapper.querySelectorAll('.artist');
        const visible = 3;
        const total = cards.length;
        let index = 0;

        if (total <= visible) {
            wrapper.style.justifyContent = 'center';
            return;
        }

        function update() {
            const cardWidth = cards[0].offsetWidth + 20; // 20 = padding/margin
            wrapper.style.transform = `translateX(-${index * cardWidth}px)`;
        }

        function autoScroll() {
            index++;
            if (index > total - visible) {
                index = 0;
            }
            update();
        }

        setInterval(autoScroll, 4000); // troca a cada 4 segundos
        update();
    });
</script>


</body>
</html>
