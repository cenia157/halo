

function asd() {


	document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
};


document.querySelectorAll('.toggle-item').forEach(function(item) {
	item.addEventListener('click', function() {
		document.querySelector('#kategorie').innerHTML = item.innerHTML;
		document.querySelector('#toggle-down').style.display = 'none';
		document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
	});
});
;