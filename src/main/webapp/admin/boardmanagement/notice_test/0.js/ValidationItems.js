
function noValue() {
	// 여기에 예외처리를 해야할 것 같다... 아마 값을 입력하지 않을 시 alart을 띄워 다시 입력하게 해야 한다.

	let titleCheck = document.querySelector('#real-title-editor').value;
	let kategorieCheck = document.querySelector('#kategorie').children[0];
	let contentCheck = window.editor.getData();

	if (!titleCheck) {
		alert("제목의 값을 입력하세요");
	} else if (kategorieCheck == null) {
		alert("카테고리의 값을 입력하세요");
	} else if (contentCheck == "") {
		alert("내용을 입력하세요");
	}
};