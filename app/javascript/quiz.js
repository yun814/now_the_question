function quiz() {
  // クイズ要素を取得し、配列化
  const quizzes = document.querySelectorAll('.quiz')
  let quizzesArray = Array.prototype.slice.call(quizzes);
  // クイズ追加フォームを取得
  const quizForm = document.getElementById('quiz-form');
  // クイズ追加フォームが存在する場合はクイズ配列に追加
  if (quizForm) quizzesArray.push(quizForm);

  quizzesArray.forEach((quiz) => {
    // クイズにカーソルを合わせると影を表示
    quiz.addEventListener('mouseover', () => {
      quiz.style.boxShadow = '0 0 10px rgb(180, 180, 180)'
    });
    // クイズからカーソルを離すと元に戻る
    quiz.addEventListener('mouseout', () => {
      quiz.style.boxShadow = ''
    });
  });
};

window.globalFunction.quiz = quiz;
window.addEventListener('load', quiz)