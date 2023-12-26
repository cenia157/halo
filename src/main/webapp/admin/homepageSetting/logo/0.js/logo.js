function handleFileUpload() {
	const fileInput = event.target;
	const files = fileInput.files;

	if (files.length > 0) {
		const selectedFile = files[0];
		console.log('선택된 파일:', selectedFile);

		var formData = new FormData();
		formData.append('file', selectedFile);

		// 여기에서 파일을 서버로 업로드하거나 다른 작업을 수행할 수 있습니다.
		// 예: AJAX를 사용하여 서버에 파일 업로드 요청을 보내기

		$.ajax({
			url: 'LogoUpdateC',  // 서버의 파일 업로드 처리 URL로 변경
			type: 'POST',
			data: formData,
			contentType: false,
			processData: false,
			success: function(data) {
				// 서버에서 반환된 파일 경로를 사용하여 이미지를 미리 보기
				$('#logo_preview').attr('src', data.filePath);
			},
			error: function() {
				alert('로고 파일 업로드에 실패했습니다.');
			}
		});
	}
}

document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('logo_img').addEventListener('change', handleFileUpload);
});