document.addEventListener('DOMContentLoaded', function() {
	alert(22);
	changeInformBox(1);
	

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

// 파일 선택시 ajax -> img 미리보기	
function handleFileUpload(idx) {
	alert(33);
	alert(idx);
	
//	const fileInput = event.target; // 이벤트 발생한 대상(파일입력요소)
	let fileInput = document.getElementById("thumbnail" + idx)[0];
	let selectedFile = fileInput.files; //파일입력요소에서 '선택된' 파일들
	console.log('선택된 파일:', selectedFile);
	
	if(selectedFile.length === 0){
		alert("파일을 선택해주세요");
		return;
	}
	
		const formData = new FormData();
		formData.append('thumbnail' + idexNo, selectedFile[0]);
	
	
	if (selectedFile.length > 0) {	// 선택된 파일이 하나 이상일때
		 //첫번째 선택된 파일
		console.log('선택된 파일:', selectedFile);

		// 파일 업로드 위한 form객체 생성, formData 변수에 할당.
		//서버에 파일 업로드 요청 ↓


		$.ajax({
			type: "POST", // post 방식 요청
			enctype: 'multipart/form-data',	// 파일 업로드 위한 인코딩 방식
			url: 'BannerUploadC', //서버로 요청 보낼 url
			data: formData,		// 서버로 보낼 데이터로 formData 객체 사용
			processData: false,	// 데이터 문자열로 변환하지 않도록
			contentType: false, 
			cache: false, // 캐시사용X
			success: function(fileName) { // 성공시 실행되는 콜백함수
				alert(11);
				//미리보기 이미지 띄우기
				var bannerPreview = $(fileInput).closest('.banner-tr').find('.banner-td-img-box');
				console.log('베너미리보기 이미지박스 : ' + bannerPreview)
                bannerPreview.css('backgroundImage', 'url("user/upload_imgs/banner/' + fileName + '")');				
				//$('#banner_preview').css('background-image', 'url("user/upload_imgs/banner/' + fileName + '")');
//				$('#banner_preview').attr('src', 'user/upload_imgs/banner/' + fileName);
				//버튼 누를때 파라미터 (수정할 이미지 이름) 넘기기
				$('#banner_btn_submit').attr('onclick', "location.href='BannerUpdateC?newFileName=" + fileName + "'")
			},
			error: function(e) {
				console.log('에러 : ' + e);
			}
		});
	}
}