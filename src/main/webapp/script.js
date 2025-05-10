function scrollCarousel(id, direction) {
  const carousel = document.getElementById(id);
  const cardWidth = carousel.querySelector('.card')?.offsetWidth || 300;
  carousel.scrollBy({ left: cardWidth * direction, behavior: 'smooth' });
}

function openModal(artistName) {
  document.getElementById('modalTitle').innerText = `Galeria de ${artistName}`;
  document.getElementById('modal').style.display = 'flex';
}

function closeModal() {
  document.getElementById('modal').style.display = 'none';
}
document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.faq-button');
    buttons.forEach(button => {
        button.addEventListener('click', function () {
            const answer = this.nextElementSibling;
            if (answer.style.display === 'block') {
                answer.style.display = 'none';
            } else {
                answer.style.display = 'block';
            }
        });
    });
});