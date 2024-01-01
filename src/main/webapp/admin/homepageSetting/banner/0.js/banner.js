document.addEventListener('DOMContentLoaded', function() {

	
	
	changeInformBox(1);
	changeInformBox(2);
	changeInformBox(3);
	
});

function changeInformBox(indexNo){
	let selectedOption = document.getElementsByName("banner_menu")[indexNo - 1].value;
	let informBox = document.getElementById("informBox" + indexNo);
	if(selectedOption === "sales" ){
		informBox.style.display = "block";
	}else{
		informBox.style.display = "none";
	}
	
}