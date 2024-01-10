function toggleR() {



	// 아래의 코드는 카테고리를 선택했을 때 토글다운을 보여준다
	document.querySelector('#toggle-downR').style.display = (document.querySelector('#toggle-downR').style.display === 'flex') ? 'none' : 'flex';

};

// 아래의 코드는 나타난 토글다운을 클릭하고 선택한 목록을 #kategorie 바로 뒤에 추가, #kategorie의 내용물은 토글다운의 div로 대체된다 F12로 확인
document.querySelectorAll('.toggle-item').forEach(function(item) {
	item.addEventListener('click', function() {
		document.querySelector('#kategorieR').innerHTML = item.innerHTML;
		document.querySelector('#toggle-downR').style.display = 'none';
		document.querySelector('#toggle-downR').style.display = (document.querySelector('#toggle-downR').style.display === 'flex') ? 'none' : 'flex';














		// 아래의 코드는 #kategorie 아라에 새로 들어온 '선택된 토글다운'의 name을 select로 바꿔준다. 이걸로 form 안에서 select라는 이벤트가 발생하고 이걸 DAO에서 잡아챈다
		document.querySelector('#kategorieR').children[0].name = 'select';
		/*
				// 아래는 확인용, 삭제해도 무방
				console.log(document.querySelector('#toggle').children[0].textContent);
				console.log(document.querySelector('#toggle').children[0].textContent);
		
				let children = document.querySelector('#toggle').children[0];
				let kategorie = children.children[0];
				let kategorieChildren = kategorie.children[0];
		
				console.log(children);
				console.log(kategorie);
				console.log(kategorieChildren);*/
	});
});






