/* 장바구니 숫자 증가 감소 */
function count(type, num) {
		
	// 결과를 표시할 element
	const resultElement = document.getElementById('result'+num);
		
	// 현재 화면에 표시된 값
	let number = resultElement.innerText;
		
	// 더하기/빼기
	if (type === 'plus'+num) {
		number = parseInt(number) + 1;
	} else if (type === 'minus'+num) {
		number = parseInt(number) - 1
		if (number == 0) {
			alert("1 이하로는 내릴수 없습니다.");
			number = 1;
		}
	}

	// 결과 출력
	resultElement.innerText = number;
}