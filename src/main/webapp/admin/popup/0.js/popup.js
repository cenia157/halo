document.addEventListener('DOMContentLoaded', function() {
//	changeInformBox();
//	submitBannerData(1);
	

});
// 셀렉 -> 상품판매 선택시 인풋박스 변화
function changeInformBox() {
	let selectedOption = document.getElementsByName("banner_menu1")[0].value;
	let urlBox = document.getElementById("urlBox");
	if (selectedOption === "url") {
		urlBox.style.display = "block";
	} else {
		urlBox.style.display = "none";
	}
}