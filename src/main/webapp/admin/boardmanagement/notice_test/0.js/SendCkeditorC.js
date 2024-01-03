
	let regBtn = document.querySelector('#reg-btn');
	regBtn.addEventListener("click", function(event) {
		let ckForm = document.querySelector('#ck-form');
		const content = window.editor.getData();
		const formData = new FormData(ckForm);
		formData.set('txt', content);
		console.log('--------------------')
		console.log(content)
		console.log(formData);
		const payload = new URLSearchParams(formData);
		console.log(payload)
		for (var pair of formData.entries()) {
			console.log(pair[0] + ': ' + pair[1]);
		}
		console.log('--------------------')
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

$(document).ready(function(){
	$('.ck-content').on('click', 'figure', function(e){
		imgIdx = $(this).index();
	});
	
	$('.ck-content').on('keydown', function(e){
		if(e.key === 'Delete'&& $('figure').length > 0){
			$('[name=saveFname]').eq(imgIdx).attr('disabled', 'disabled');
			$('[name=saveFname]').eq(imgIdx).hide();
		}
	});
});
