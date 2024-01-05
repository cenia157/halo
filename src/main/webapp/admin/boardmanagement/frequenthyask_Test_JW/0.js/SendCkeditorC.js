let regBtn = document.querySelector('#reg-btn');
regBtn.addEventListener("click", function(event) {
	let ckForm = document.querySelector('#ck-form');
	const content = window.editor.getData();
	const formData = new FormData(ckForm);
	formData.set('txt', content);

	console.log('ckForm : ' + ckForm.value)
	console.log('content : ' + content)
	console.log('formData : ' + formData);
	const payload = new URLSearchParams(formData);
	console.log('payload : ' + payload)

	console.log('--------------------')
	for (var pair of formData.entries()) {
		//		console.log(pair[0] + ': ' + pair[1]);
		console.log(pair);
	}
	console.log('--------------------')

	var isTitleValid = false;
	var isTxtValid = false;

	for (var pair of formData.entries()) {

		if (pair[0] === 'title') {
			if (pair[1] !== '') {
				console.log('제목 O')
				isTitleValid = true;
			} else {
				console.log('제목 X')
			}
		} else if (pair[0] === 'txt') {
			if (pair[1] !== '') {
				console.log('내용 O');
				isTxtValid = true;
			} else {
				console.log('내용 X');
			}
		}
	}
// 여기서 제목, 내용입력 둘다 만족할 경우 모달창이 닫히도록 함
	if (isTitleValid && isTxtValid) {
		closeModalF();
	}

	let CkeditorC123 = fetch('CkeditorC_Frequenthyask', {
		method: 'POST',
		body: payload,
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded', // 헤더 설정
		}
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.text();
		})
		.then(data => {
			console.log('POST 요청 성공:', data);
			console.log(CkeditorC123);

		})
		.catch(error => {
			console.error('POST 요청 실패:', error);
		});
});


let imgIdx = 0;

$(document).ready(function() {
	$('.ck-content').on('click', 'figure', function(e) {
		imgIdx = $(this).index();
	});

	$('.ck-content').on('keydown', function(e) {
		if (e.key === 'Delete' && $('figure').length > 0) {
			$('[name=saveFname]').eq(imgIdx).attr('disabled', 'disabled');
			$('[name=saveFname]').eq(imgIdx).hide();
		}
	});
});