function search() {
  const commentDisplayBtn = document.getElementById('comment-display-btn');
  const commentHidden = document.getElementById('comment-hidden');
  const hidden = document.querySelectorAll('.hidden');

  if (!commentDisplayBtn) return null;

  commentDisplayBtn.addEventListener('mouseover', () => {
    commentDisplayBtn.style.boxShadow = '0 0 5px rgb(150, 150, 150)';
    commentDisplayBtn.style.cursor = 'pointer';
  });
  
  commentDisplayBtn.addEventListener('mouseout', () => {
    commentDisplayBtn.style.boxShadow = '';
    commentDisplayBtn.style.cursor = '';
  });
  
  commentDisplayBtn.addEventListener('click', () => {
    commentHidden.style.display = 'contents';
    hidden.forEach((h) => {
      h.style.display = 'none';
    })
  });
};

window.addEventListener('load', search);