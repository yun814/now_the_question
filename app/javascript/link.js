function link() {
  // 画面内のリンクを取得し、配列化
  const links = document.getElementsByTagName('a');
  const linksArray = Array.prototype.slice.call(links);
  // 画面内のロゴを取得し、配列化
  const logos = document.querySelectorAll('.logo');
  const logosArray = Array.prototype.slice.call(logos);
  // 画面内のボタンを取得し、配列化
  const btns = document.querySelectorAll('.btn');
  const btnsArray = Array.prototype.slice.call(btns);
  // 画面内のミニボタンを取得し、配列化
  const miniBtns = document.querySelectorAll('.mini-btn');
  const miniBtnsArray = Array.prototype.slice.call(miniBtns);


  // 普通のリンクの処理
  linksArray.forEach((link) => {
    // リンクがロゴの場合は処理を行わない
      // リンクがボタン型以外の場合の処理
      if (!logosArray.includes(link) && !btnsArray.includes(link) && !miniBtnsArray.includes(link)) {
        // リンクにカーソルを合わせると下線を表示
        link.addEventListener('mouseover', () => {
          link.style.textDecoration = 'underline';
        });
        // リンクからカーソールを離すと下線を削除
        link.addEventListener('mouseout', () => {
          link.style.textDecoration = '';
        });
      };
  });

  // ボタン型のリンクの処理
  btns.forEach((btn) => {
    // ボタンにカーソルを合わせると処理を実行
    btn.addEventListener('mouseover', () => {
      // ボタンをへこます表現を表示
      btn.style.borderStyle = 'inset';
      btn.style.backgroundColor = 'rgba(205, 110, 72, 0.5)';
      // カーソルを指に変更
      btn.style.cursor = 'pointer';
    });
    // ボタンからカーソルを離すと処理を実行
    btn.addEventListener('mouseout', () => {
      // ボタンを元に戻す
      btn.style.borderStyle = '';
      btn.style.backgroundColor = '';
      // カーソルを元に戻す
      btn.style.cursor = '';
    });
  });

  // ミニボタン型のリンクの処理
  miniBtns.forEach((miniBtn) => {
    miniBtn.addEventListener('mouseover', () => {
      miniBtn.style.boxShadow = '0 0 5px rgb(150, 150, 150)'
    });
    miniBtn.addEventListener('mouseout', () => {
      miniBtn.style.boxShadow = ''
    });
  });
};

window.addEventListener('load', link)