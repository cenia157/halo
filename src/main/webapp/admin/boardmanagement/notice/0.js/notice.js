function toggle() {

	// 아래의 코드는 카테고리를 선택했을 때 토글다운을 보여준다
	document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
};

// 아래의 코드는 나타난 토글다운을 클릭하고 선택한 목록을 #kategorie 바로 뒤에 추가, #kategorie의 내용물은 토글다운의 div로 대체된다 F12로 확인
document.querySelectorAll('.toggle-item').forEach(function(item) {
	item.addEventListener('click', function() {
		document.querySelector('#kategorie').innerHTML = item.innerHTML;
		document.querySelector('#toggle-down').style.display = 'none';
		document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';

		// 아래의 코드는 #kategorie 아라에 새로 들어온 '선택된 토글다운'의 name을 select로 바꿔준다. 이걸로 form 안에서 select라는 이벤트가 발생하고 이걸 DAO에서 잡아챈다
		document.querySelector('#kategorie').children[0].name = 'select';

		// 아래는 확인용, 삭제해도 무방
		console.log(document.querySelector('#toggle').children[0].textContent);
		console.log(document.querySelector('#toggle').children[0].textContent);

		let children = document.querySelector('#toggle').children[0];
		let kategorie = children.children[0];
		let kategorieChildren = kategorie.children[0];

		console.log(children);
		console.log(kategorie);
		console.log(kategorieChildren);
	});
});





function noValue() {





	// 여기에 예외처리를 해야할 것 같다... 아마 값을 입력하지 않을 시 alart을 띄워 다시 입력하게 해야 한다.

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
	


	// 제목, 카테고리, 내용 중 하나라도 입력하지 않았을 시 
/*	if (!document.querySelector('#real-title-editor').value || document.querySelector('#kategorie').children[0] == null || !document.querySelector('#classicNR').value) {
		alert("필수 값을 입력하세요");


	};
*/



};



























