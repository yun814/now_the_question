// 1秒毎にtimer要素の中身を書き換える関数
function countDown(timer) {
  let timerNum = Number(timer.innerHTML)
  timerNum -= 1
  timer.innerHTML = String(timerNum)

  // 時間切れ時の処理
  if (timerNum == -1) {
    const finishBtn = document.getElementById('finish-btn')
    alert('※時間切れです。')
    finishBtn.click()
  }
}

function timer() {
  // timer要素が存在するページのみ処理を実行
  const timer = document.getElementById('timer');
  if (!timer) return null;

  // 1秒毎にcountDown関数を実行する
  setInterval(countDown, 1000, timer)
}

window.addEventListener('load', timer)