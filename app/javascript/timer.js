// 1秒毎にtimer要素の中身を書き換える関数
function countDown(timerArea) {
  let timerNum = Number(timerArea.innerHTML)
  timerNum -= 1
  timerArea.innerHTML = String(timerNum)
}

// 時間切れ時の処理
function timeOut(timer) {
  clearInterval(timer)
  const finishBtn = document.getElementById('finish-btn')
  alert('※時間切れです。')
  finishBtn.click()
}

function timer() {
  // timer要素が存在するページのみ処理を実行
  let timerArea = document.getElementById('timer');
  if (!timerArea) return null;
  
  // 1秒毎にcountDown関数を実行する
  const timer = setInterval(countDown, 1000, timerArea)
  setTimeout(timeOut, Number(timerArea.innerHTML) * 1000, timer)
}

window.addEventListener('load', timer)