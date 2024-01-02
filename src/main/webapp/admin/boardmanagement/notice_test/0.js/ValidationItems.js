
function noValue() {
	// 여기에 예외처리를 해야할 것 같다... 아마 값을 입력하지 않을 시 alart을 띄워 다시 입력하게 해야 한다.
	/*
		// 제목을 입력하지 않았을 시 
		if (!document.querySelector('#real-title-editor').value) {
			alert("제목의 값을 입력하세요");
		};
	
		// 카테고리를 설정하지 않았을 시 
		if (document.querySelector('#kategorie').children[0] == null) {
			alert("카테고리의 값을 입력하세요");
		};
	
		// 내용을 입력하지 않았을 시
		if (!document.querySelector('#classicNR').value) {
			alert("내용을 입력하세요");
		};
	
	*/


	// 제목, 카테고리, 내용 중 하나라도 입력하지 않았을 시
	if (!document.querySelector('#real-title-editor').value ||
		document.querySelector('#kategorie').children[0] == null ||
		!document.querySelector('#classicNR').value) {
		alert("필수 값을 입력하세요");

	};
};

