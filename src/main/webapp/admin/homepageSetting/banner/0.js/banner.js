document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('thumbnail1').addEventListener('change', handleFileUpload);

	changeInformBox(1);
	changeInformBox(2);
	changeInformBox(3);

});
// 셀렉 -> 상품판매 선택시 인풋박스 변화
function changeInformBox(indexNo) {
	let selectedOption = document.getElementsByName("banner_menu" + indexNo)[0].value;
	let informBox = document.getElementById("informBox" + indexNo);
	if (selectedOption === "sales") {
		informBox.style.display = "block";
	} else {
		informBox.style.display = "none";
	}
}

// 파일 선택시 ajax -> 미리보기	
function handleFileUpload(event) {
	event.preventDefault();
	const fileInput = event.target;
	const files = fileInput.files;


	if (files.length > 0) {
		const selectedFile = files[0];
		console.log('선택된 파일:', selectedFile);

		var formData = new FormData(document.getElementById('bannerUploadForm'));
		// 여기에서 파일을 서버로 업로드하거나 다른 작업을 수행할 수 있습니다.
		// 예: AJAX를 사용하여 서버에 파일 업로드 요청을 보내기

		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',	// 필수
			url: 'BannerUploadC',
			data: formData,		// 필수
			processData: false,	// 필수
			contentType: false,	// 필수
			cache: false,
			success: function(fileName) {
				alert(11);
				//미리보기 이미지 띄우기
				//$('.banner-td-img-box').css('background-image', 'url("user/upload_imgs/banner' + fileName + '")');
				$('#banner_preview').attr('src', 'user/upload_imgs/banner/' + fileName);
				//버튼 누를때 파라미터 (수정할 이미지 이름) 넘기기
				$('#banner_btn_submit').attr('onclick', "location.href='BannerUpdateC?newFileName=" + fileName + "'")
			},
			error: function(e) {
				console.log('에러 : ' + e);
			}
		});
	}
}