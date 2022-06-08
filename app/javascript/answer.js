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
    e.preventDefault()

    // 正解が記述してある要素を取得
    const correctAnswer = document.querySelectorAll('.correct-answer');
    // 回答を格納する配列と正解を格納する配列を生成
    const answersArray = [];
    const correctAnswersArray = [];
    
    // 回答と正解の内容を取り出して配列に格納
    answer.forEach((ans) => {
      const ansNum = ans.innerHTML;
      answersArray.push(ansNum);
    });
    correctAnswer.forEach((correctAns) => {
      const correctAnsNum = correctAns.innerHTML;
      correctAnswersArray.push(correctAnsNum);
    });
    
    // 回答が正解と等しいかを判定し、正解数をカウント
    let correctAnsCount = 0;
    answersArray.forEach((ans, i) => {
      if (ans == correctAnswersArray[i]) {
        correctAnsCount++;
      };
    });

    // 正答率を計算
    const correctAnsRate = (correctAnsCount / correctAnswersArray.length) * 100

    // 今回の回答回数の要素を取得し、内容を数値に変換
    const times = document.getElementById('times');
    const timesNum = Number(times.innerHTML);

    // 送信用のフォームを取得
    const answerForm = document.getElementById('answer-form');
    // 送信内容のフォームを生成
    const timesObj = `<input value=${timesNum} name='times' type="hidden">`;
    const numOfQuestionsObj = `<input value=${correctAnswer.length} name='number_of_questions' type="hidden">`;
    const numOfCorrectAnsObj = `<input value=${correctAnsCount} name='number_of_correct_answers' type="hidden">`;
    const correctAnsRateObj = `<input value=${correctAnsRate} name='correct_answer_rate' type="hidden">`;
    // 生成したフォームを挿入
    answerForm.insertAdjacentHTML('beforeend', timesObj);
    answerForm.insertAdjacentHTML('beforeend', numOfQuestionsObj);
    answerForm.insertAdjacentHTML('beforeend', numOfCorrectAnsObj);
    answerForm.insertAdjacentHTML('beforeend', correctAnsRateObj);
    // フォームの内容を送信
    answerForm.submit();
  });
};

window.addEventListener('load', answer);