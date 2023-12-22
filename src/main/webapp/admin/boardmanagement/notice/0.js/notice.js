

function toggle() {


	document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
};


document.querySelectorAll('.toggle-item').forEach(function(item) {
	item.addEventListener('click', function() {
		document.querySelector('#kategorie').innerHTML = item.innerHTML;
		document.querySelector('#toggle-down').style.display = 'none';
		document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
		console.log(document.querySelector('#toggle').children[0].textContent);

		let children = document.querySelector('#toggle').children[0];
		let childrenOfchildren = children.children[0].value;


		console.log(children);
		console.log(childrenOfchildren);
		return childrenOfchildren;
	});
});