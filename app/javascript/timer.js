function countDown(timer) {
  let timerNum = Number(timer.innerHTML)
  timerNum -= 1
  timer.innerHTML = String(timerNum)
  console.log(timerNum);
}

function timer() {
  // 回答終了ボタンが存在するページのみ処理を実行
  const timer = document.getElementById('timer');
  if (!timer) return null;

  setInterval(countDown, 1000, timer)
}

window.addEventListener('load', timer)