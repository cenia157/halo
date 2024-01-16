//나중에지우기
let update_start_btn = document.querySelector("#update_start_btn");
update_start_btn.addEventListener("click", function(event) {
	let view_ckForm = document.querySelector("#view_ck-form");
	const content = window.editor.getData();
	const view_formData = new FormData(view_ckForm);
	view_formData.set("txt", content);
	console.log("--------------------");
	console.log(content);
	console.log(view_formData);
	const payload = new URLSearchParams(view_formData); 
	console.log(payload);
	for (var pair of formData.entries()) {
		console.log(pair[0] + ": " + pair[1]);
	}


	var isTitleValid = false;
	var isTxtValid = false;
	var iskategorieValid = false;

	for (var pair of view_formData.entries()) {

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
		closeModal('.modal-background ', '#myModal-tblNR');
	}

	console.log("--------------------");
	let CkeditorC123 = fetch("CkeditorC", {
		method: "POST",
		body: payload,
		headers: {
			"Content-Type": "application/x-www-form-urlencoded", // 헤더 설정
		},
	})
		.then((response) => {
			if (!response.ok) {
				throw new Error("Network response was not ok");
			}
			return response.text();
		})
		.then((data) => {
			console.log("POST 요청 성공: 이거맞음?????", data);
			ckForm.submit();
			console.log(CkeditorC123);
		})
		.catch((error) => {
			console.error("POST 요청 실패:", error);
		});
}); 

