// 숫자 및 연산자 버튼을 눌렀을 때 실행될 함수
function appendValue(value) {
  document.getElementById('result').value += value;
}

// 결과 지우기 버튼을 눌렀을 때 실행될 함수
function clearResult() {
  document.getElementById('result').value = '';
}

// 등호 버튼을 눌렀을 때 실행될 함수
function calculateResult() {
  var result = document.getElementById('result').value;
  document.getElementById('result').value = eval(result);
}
