





//if (title != "" && txt != "" && select != null) {};




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
	var iskategorieValid = false;

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





		if (pair[0] === 'select') {
			console.log('카테고리 O');
			var iskategorieValid = true;
		}




	}


	if (isTitleValid && isTxtValid && iskategorieValid) {
		closeModalNR();
	}
















	/*	for (var pair of formData.entries()) {
			if (pair[0] === 'title') {
				if (pair[1] === '') {
					console.log('제목을 입력을 하지 않았습니다');
	
	
	
					if (pair[0] === 'txt') {
						if (pair[1] === '') {
							console.log('내용을 입력을 하지 않았습니다');
	
						}
					}
	
				} else {
					console.log('제목을 입력 했습니다');
				}
			}
		}
	*/







	/*
			else 
			if (pair[0] === 'txt') {
				if (pair[1] === '') {
					console.log('내용을 입력을 하지 않았습니다');
				}
			} else {
				closeModalNR()
			}
	*/







	// || pair[0] === 'select' || 





	/*
		for (var pair of formData.entries()) {
	
			var ttt = pair[0] === 'title';
			var kkk = pair[0] === 'select';
			var ccc = pair[0] === 'txt';
	
	
	
	
			console.log('ttt : ' + ttt);
	
			if (ttt || kkk || ccc) {
			}
	
	
	
		}
	
	*/

























	let CkeditorC123 = fetch('CkeditorC', {
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



