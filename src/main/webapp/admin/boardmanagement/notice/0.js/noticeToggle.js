function toggle() {

	document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';};

	document.querySelectorAll('.toggle-item').forEach(function(item) {
		item.addEventListener('click', function() {
			document.querySelector('#kategorie').innerHTML = item.innerHTML;
			document.querySelector('#toggle-down').style.display = 'none';
			document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
	
			// 아래의 코드는 #kategorie 아라에 새로 들어온 '선택된 토글다운'의 name을 select로 바꿔준다. 이걸로 form 안에서 select라는 이벤트가 발생하고 이걸 DAO에서 잡아챈다
			document.querySelector('#kategorie').children[0].name = 'select';

		});
	});










