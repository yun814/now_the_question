// 選択肢を4個ごとに区切り、配列に格納する関数
function choicesSlice(quizChoices) {
  quizChoices = Array.from(quizChoices);
  let quizChoicesArray = [];
  for (let i = 0; i < quizChoices.length; i++) {
    if (i % 4 == 0) {
      const quizChoicesSlice = quizChoices.slice(i, i + 4);
      quizChoicesArray.push(quizChoicesSlice);
    };
  };
  return quizChoicesArray;
};

// 画面読み込み時に起動
function answer() {
  // 回答終了ボタンが存在するページのみ処理を実行
  const finishBtn = document.getElementById('finish-btn');
  if (!finishBtn) return null;
  
  // 選択肢を4個ごとに区切り、配列に格納
  let quizChoices = document.querySelectorAll('.quiz-choices');
  const quizChoicesArray = choicesSlice(quizChoices);
  
  // 回答を選択する機能
  const quizzes = document.querySelectorAll('.quiz');
  const answer = document.querySelectorAll('.answer')
  // i番目のクイズにマウスを合わせると処理を実行
  quizzes.forEach((quiz, i) => {
    quiz.addEventListener('mouseover', () => {
      // i番目のクイズの選択肢を代入
      const currentQuizChoices = quizChoicesArray[i]
      // n番目の選択肢にマウスを合わせると処理を実行
      currentQuizChoices.forEach((currentQuizChoice, n) => {
        // マウスを合わせた選択肢のボーダーを変更
        currentQuizChoice.addEventListener('mouseover', () => {
          currentQuizChoice.style.borderStyle = 'inset';
        });
        
        // マウスを離した選択肢のボーダーを元に戻す
        currentQuizChoice.addEventListener('mouseout', () => {
          currentQuizChoice.style.borderStyle = '';
        });
        
        // 選択肢をクリックすると処理を実行
        currentQuizChoice.addEventListener('click', () => {
          // 4つの選択肢の背景色を元に戻す
          quizChoicesArray[i].forEach((quizChoice) => {
            quizChoice.style.backgroundColor = '';
          });
          // クリックした選択肢の背景色を変更
          currentQuizChoice.style.backgroundColor = 'rgba(240, 128, 128)';
          answer[i].innerHTML = n + 1;
        });
      });
    });
  });
  
  // 回答終了ボタンをクリックした時に処理を実行
  finishBtn.addEventListener('click', (e) => {
    e.preventDefault();
    // 回答を格納する配列を生成
    const answersArray = [];
    // 回答を数値化して配列に格納
    answer.forEach((ans) => {
      const ansNum = Number(ans.innerHTML)
      answersArray.push(ansNum);
    });
    
  });
};

window.addEventListener('load', answer);