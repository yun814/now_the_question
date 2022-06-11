function drill() {
  // ドリル要素を取得
  const drills = document.querySelectorAll('.drill')

  drills.forEach((drill) => {
    // ドリルにカーソルを合わせると影を表示
    drill.addEventListener('mouseover', () => {
      drill.style.boxShadow = '0 0 10px rgb(180, 180, 180)'
    });
    // ドリルからカーソルを離すと元に戻る
    drill.addEventListener('mouseout', () => {
      drill.style.boxShadow = ''
    });
  });
};

window.addEventListener('load', drill)