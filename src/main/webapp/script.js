let currentIndex = 0;
const artistsPerView = 3;

function scrollCarousel(id, direction, event) {
    event.preventDefault();
    const carousel = document.getElementById(id);
    const wrapper = carousel.querySelector('.carousel-wrapper');
    const artists = wrapper.querySelectorAll('.artist');
    const totalArtists = artists.length;

    if (!carousel || !wrapper || !artists.length) {
        console.error(`Carousel elements not found: ID=${id}, wrapper=${wrapper}, artists=${artists.length}`);
        return;
    }

    const artistWidth = artists[0].offsetWidth + 20; // Include padding
    const maxIndex = Math.max(0, totalArtists - artistsPerView);

    currentIndex = Math.min(Math.max(currentIndex + direction, 0), maxIndex);
    console.log(`Scrolling: direction=${direction}, currentIndex=${currentIndex}, maxIndex=${maxIndex}`);

    wrapper.style.transform = `translateX(-${currentIndex * artistWidth}px)`;
}

function openModal(artistName, specialty, description, photos) {
    const modal = document.getElementById('modal');
    const modalTitle = document.getElementById('modalTitle');
    const modalSpecialty = document.getElementById('modalSpecialty');
    const modalDescription = document.getElementById('modalDescription');
    const modalGallery = document.getElementById('modalGallery');

    if (!modal || !modalTitle || !modalSpecialty || !modalDescription || !modalGallery) {
        console.error('Modal elements not found:', { modal, modalTitle, modalSpecialty, modalDescription, modalGallery });
        return;
    }

    modalTitle.innerText = artistName ? `Galeria de ${artistName}` : 'Galeria de Artista';
    modalSpecialty.innerText = specialty ? `Especialidade: ${specialty}` : 'Especialidade: Não informada';
    modalDescription.innerText = description || 'Sem descrição disponível';

    const validPhotos = (photos || []).filter(photo => photo && photo.trim() !== '' && photo !== 'null');
    console.log('Photos passed to modal:', photos, 'Valid photos:', validPhotos);

    modalGallery.innerHTML = validPhotos.length > 0
        ? validPhotos.map(photo => `<img src="${photo}" alt="Galeria de ${artistName || 'Artista'}" onerror="this.src='${window.location.pathname.replace(/\/[^/]*$/, '')}/imgL/placeholder.jpg'; this.alt='Imagem não carregada';">`).join('')
        : '<p>Sem imagens disponíveis</p>';

    modal.style.display = 'flex';
}

function closeModal() {
    const modal = document.getElementById('modal');
    if (modal) {
        modal.style.display = 'none';
    } else {
        console.error('Modal element not found');
    }
}

// FAQ Toggle
document.querySelectorAll('.faq-button').forEach(button => {
    button.addEventListener('click', () => {
        const faqItem = button.parentElement;
        const answer = faqItem.querySelector('.answer');
        if (answer.style.display === 'block') {
            answer.style.display = 'none';
            button.textContent = '+';
        } else {
            answer.style.display = 'block';
            button.textContent = '-';
        }
    });
});

// Carousel Arrow Visibility
document.addEventListener('DOMContentLoaded', () => {
    const carousel = document.getElementById('artistCarousel');
    const prevButton = document.querySelector('.carousel-button.prev');
    const nextButton = document.querySelector('.carousel-button.next');

    if (!carousel || !prevButton || !nextButton) {
        console.error('Carousel or buttons not found:', { carousel, prevButton, nextButton });
        return;
    }

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                prevButton.style.display = 'flex';
                nextButton.style.display = 'flex';
                console.log('Carousel is visible, showing arrows');
            } else {
                prevButton.style.display = 'none';
                nextButton.style.display = 'none';
                console.log('Carousel is out of view, hiding arrows');
            }
        });
    }, {
        root: null, // Use viewport as root
        threshold: 0.7, // Trigger when 70% of carousel is visible
        rootMargin: '-50px 0px' // Delay trigger by 50px
    });

    observer.observe(carousel);
});