function result() {
  const confirmBtn = document.getElementById('confirm-btn');
  if (!confirmBtn) return null;

  confirmBtn.addEventListener('mouseover', () => {
    confirmBtn.style.boxShadow = '0 0 5px rgb(150, 150, 150)'
    confirmBtn.style.cursor = 'pointer';
  });

  confirmBtn.addEventListener('mouseout', () => {
    confirmBtn.style.boxShadow = ''
    confirmBtn.style.cursor = '';
  });

  confirmBtn.addEventListener('click', () => {
    const quizzes = document.querySelectorAll('.quiz');
    const hiddenBtn = document.getElementById('hidden-btn');

    quizzes.forEach((quiz) => {
      quiz.removeAttribute('hidden');
    });
    hiddenBtn.removeAttribute('hidden');
    confirmBtn.style.display = 'none';
  });
};

window.addEventListener('load', result)