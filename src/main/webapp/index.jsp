<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="br.com.estudio.model.Usuario" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>StudioTatto</title>
    <link href="https://fonts.cdnfonts.com/css/annabelle" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css?v=4"/>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#sobre">Sobre</a></li>
            <li><a href="#artistas">Artistas</a></li>
            <li><a href="#">Contato</a></li>
            <%
                Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
            %>
            <li>
                <% if (usuario != null) { %>
                    <a href="usuarioPerfil" title="Perfil do Usuário">👤 <%= usuario.getNome().split(" ")[0] %></a>
                <% } else { %>
                    <a href="login" title="Fazer Login">👤</a>
                <% } %>
            </li>

        <% if (usuario != null) { %>
        <li><a href="logout">Sair</a></li>
        <% } %>


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
        <img src="${pageContext.request.contextPath}/imgL/fotoT67.jpg" alt="Foto1"/>
        <img src="${pageContext.request.contextPath}/imgL/fotoT2.jpg" alt="Foto2"/>
        <img src="${pageContext.request.contextPath}/imgL/fotoT3.jpg" alt="Foto3"/>
        <img src="${pageContext.request.contextPath}/imgL/fotoT5.jpg" alt="Foto4"/>
    </div>
</section>

<section id="artistas" class="section">
    <div class="container">
        <div class="header">
            <h1>ARTISTAS</h1>
        </div>
        <div class="carousel-container">
            <button class="carousel-button prev" onclick="scrollCarousel('artistCarousel', -1, event)">❮</button>
            <div class="carousel" id="artistCarousel">
                <div class="carousel-wrapper">
                    <c:forEach var="tatuador" items="${tatuadores}">
                        <div class="artist">
                            <div class="artist-image" style="background-image: url('<c:out value='${pageContext.request.contextPath}/${tatuador.imagemPerfil}' default='${pageContext.request.contextPath}/imgL/placeholder.jpg'/>');"></div>
                            <h2><c:out value="${tatuador.nome}" default="Artista Desconhecido"/></h2>
                            <p><strong>Especialidade:</strong> <c:out value="${tatuador.especialidade}" default="Não informada"/></p>
                            <p><c:out value="${tatuador.descricao}" default="Sem descrição"/></p>
                            <a href="#" class="btn-gallery" onclick="openModal(
                                '<c:out value="${tatuador.nome}" default="Artista Desconhecido"/>',
                                '<c:out value="${tatuador.especialidade}" default="Não informada"/>',
                                '<c:out value="${tatuador.descricao}" default="Sem descrição"/>',
                                [
                                    '<c:out value="${pageContext.request.contextPath}/${tatuador.foto1}" default="${pageContext.request.contextPath}/imgL/placeholder.jpg"/>',
                                    '<c:out value="${pageContext.request.contextPath}/${tatuador.foto2}" default="${pageContext.request.contextPath}/imgL/placeholder.jpg"/>',
                                    '<c:out value="${pageContext.request.contextPath}/${tatuador.foto3}" default="${pageContext.request.contextPath}/imgL/placeholder.jpg"/>'
                                ]
                            )">Ver Galeria</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <button class="carousel-button next" onclick="scrollCarousel('artistCarousel', 1, event)">❯</button>
        </div>
    </div>
</section>

<!-- Single Modal for all artists -->
<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">×</span>
        <h2 id="modalTitle"></h2>
        <p id="modalSpecialty"></p>
        <p id="modalDescription"></p>
        <div class="gallery" id="modalGallery"></div>
    <a href="https://wa.me/11978355298?text=Olá,%20gostaria%20de%20conhecer%20seu%20trabalho!"
   class="whatsapp-button"
   target="_blank">
   Entre em Contato via WhatsApp
    </a>
    </div>
</div>

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
                <h2>TRADICIONAL</h2>
                <p>Estilo clássico com linhas bold e cores vibrantes, inspirado na arte tradicional americana, ideal para designs icônicos.</p>
            </div>
            <div class="service-card">
                <h2>REALISMO</h2>
                <p>Técnica avançada que cria tatuagens com detalhes realistas, como retratos ou paisagens, usando sombreado fino.</p>
            </div>
            <div class="service-card">
                <h2>DOTWORK</h2>
                <p>Técnica que utiliza pontos para formar padrões geométricos ou ilustrações, perfeita para designs minimalistas e únicos.</p>
            </div>
            <div class="service-card">
                <h2>COVER-UP</h2>
                <p>Serviço para cobrir tatuagens antigas com novos designs criativos, adaptando-se ao desenho original.</p>
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
                <div class="answer">
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
        <img src="${pageContext.request.contextPath}/img/tattoo_img.jpg" alt="Tattoo Artist Working" class="full-image"/>
    </div>
    <div class="metade-direita">
        <div class="form-title">FORM</div>
        <form class="contact-form">
            <div class="input-container">
                <input type="text" placeholder="NOME" required/>
            </div>
            <div class="input-container">
                <input type="email" placeholder="E-MAIL" required/>
            </div>
            <div class="input-container">
                <textarea placeholder="COMENTÁRIOS" rows="5" required></textarea>
            </div>
            <div class="button-container">
                <button type="submit">ENVIAR FEEDBACK</button>
            </div>
        </form>
    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-header">
            <span class="contato">CONTATO</span>
            <div class="fale-conosco-wrapper">
                <span class="fale">FALE</span>
                <span class="conosco">CONOSCO</span>
            </div>
        </div>
        <div class="footer-info">
            <div class="info-item">
                <h3>ENDEREÇO</h3>
                <p>XXXXXXXXXXXX XXXXXXXXXXXX</p>
            </div>
            <div class="info-item">
                <h3>TELEFONE</h3>
                <p>(11)9999-9999</p>
            </div>
            <div class="info-item">
                <h3>EMAIL</h3>
                <p>contato@thiago.com</p>
            </div>
        </div>
        <div class="footer-social">
            <span>Siga a gente</span>
            <a href="#">INSTAGRAM</a>
            <a href="#">FACEBOOK</a>
            <a href="#">TWITTER</a>
            <span>Siga para atualizações e inspirações</span>
        </div>
        <div class="footer-text"></div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/script.js"></script>
</body>
</html>