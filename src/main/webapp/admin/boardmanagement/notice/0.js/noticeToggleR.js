function toggleR() {

	document.querySelector('#toggle-downR').style.display = (document.querySelector('#toggle-downR').style.display === 'flex') ? 'none' : 'flex';};

	document.querySelectorAll('.toggle-item').forEach(function(item) {
		item.addEventListener('click', function() {
			document.querySelector('#kategorieR').innerHTML = item.innerHTML;
			document.querySelector('#toggle-downR').style.display = 'none';
			document.querySelector('#toggle-downR').style.display = (document.querySelector('#toggle-downR').style.display === 'flex') ? 'none' : 'flex';

		document.querySelector('#kategorieR').children[0].name = 'select';

	});
});






