function search() {
  const displayBtns = document.querySelectorAll('.display-btn');
  const searchResults = document.querySelectorAll('.search-result');


  displayBtns.forEach((btn, i) => {
    btn.addEventListener('mouseover', () => {
      btn.style.boxShadow = '0 0 5px rgb(150, 150, 150)';
      btn.style.cursor = 'pointer'
    });
    
    btn.addEventListener('mouseout', () => {
      btn.style.boxShadow = '';
      btn.style.cursor = ''
    });
    
    btn.addEventListener('click', () => {
      if (btn.innerHTML == "非表示") {
        btn.innerHTML = "表　示";
        searchResults[i].style.display = 'none';
      } else {
        btn.innerHTML = "非表示"
        searchResults[i].style.display = '';
      };
    });
  });
};

window.addEventListener('load', search);