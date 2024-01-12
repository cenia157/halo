// 공통 함수: 모달 열기
function openModal(modalId, tblId) {
	console.log('이거 작동되나봄');
	console.log(modalId);
	console.log(tblId);
	document.querySelector(modalId).style.display = 'flex';
	document.querySelector(tblId).style.display = 'flex';

	// 아래 6줄은 모달창 열 때 스크롤 감추기 & 터치, 휠 불가
	$('html, body').css({ 'overflow': 'hidden', 'height': '100%' }); // 모달팝업 중 html,body의 scroll을 hidden시킴
	$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
}
//
//function openModal2(modalId, tblId) {
//	console.log('이거 작동되나봄');
//	console.log(modalId);
//	console.log(tblId);
//	document.querySelector(modalId).style.display = 'flex';
//	document.querySelector(tblId).style.display = 'flex';
//
//	// 아래 6줄은 모달창 열 때 스크롤 감추기 & 터치, 휠 불가
//	$('html, body').css({ 'overflow': 'hidden', 'height': '100%' }); // 모달팝업 중 html,body의 scroll을 hidden시킴
//	$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지
//		event.preventDefault();
//		event.stopPropagation();
//		return false;
//	});
//}

// 공통 함수: 모달 닫기
function closeModal(modalId, tblId) {

	
	console.log(document.querySelector(modalId));
	console.log('여기 sdfsdf?')
	console.log(document.querySelector(tblId));
	
	document.querySelector(modalId).style.display = 'none';
	document.querySelector(tblId).style.display = 'none';
	


	// 아래 2줄은 모달창 닫을 때 스크롤 보여주기 & 터치, 휠 가능
	$('html, body').css({ 'overflow': 'auto', 'height': '100%' }); //scroll hidden 해제
	$('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능


	// input 초기화
	var titleInput = document.getElementById("real-title-editor");
	titleInput.value = "";

	// 사진 input 삭제
	var imageInputs = document.querySelectorAll("#img-url");
	imageInputs.forEach(function(input) {
		input.parentNode.removeChild(input);
	});

	// #kategorie 안의 input(#select)과 그 안의 텍스트 둘 다 삭제 및 '카테고리' 재설정
	var kategorieInput = document.querySelector('#kategorie input');
	if (kategorieInput) {
		kategorieInput.remove();
		document.querySelector('#kategorie').textContent = '카테고리';
	}
	// CKEditor 초기화
	window.editor.setData(""); // CKEditor의 내용을 빈 문자열로 설정합니다.

}


function closeModalR2(modalId, tblId) {
	document.getElementById(modalId).style.display = 'none';
	document.getElementById(tblId).style.display = 'none';

	// 아래 2줄은 모달창 닫을 때 스크롤 보여주기 & 터치, 휠 가능
	$('html, body').css({ 'overflow': 'auto', 'height': '100%' }); //scroll hidden 해제
	$('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능



	// input 초기화
	var titleInputR = document.getElementById("real-title-editorN");
	titleInputR.value = "";

	// 사진 input 삭제
	var imageInputsR = document.querySelectorAll("#img-url");
	imageInputsR.forEach(function(input) {
		input.parentNode.removeChild(input);
	});

	// #kategorie 안의 input(#select)과 그 안의 텍스트 둘 다 삭제 및 '카테고리' 재설정
	var kategorieInputR = document.querySelector('#kategorieR input');
	if (kategorieInputR) {
		kategorieInputR.remove();
		document.querySelector('#kategorieR').textContent = '카테고리';
	}
	// CKEditor 초기화
	window.editor.setData(""); // CKEditor의 내용을 빈 문자열로 설정합니다.
}

function closeModalOnOutsideClick(modalId, myModalBackground) {
	window.onclick = function(event) {
		if (event.target == document.querySelector(modalId)) {
			closeModal(modalId, myModalBackground);
		}
	};
}

//function openModalF() {
//	openModal('myModalF', 'myModal-tblF');
//	closeModalOnOutsideClick('myModalF');
//}

//function closeModalF() {
//	closeModal('myModalF', 'myModal-tblF');
//}

function openModalN() {
	openModal('myModalN', 'myModal-tblN');
	closeModalOnOutsideClick('myModalN');
}

function closeModalN() {
	closeModal('myModalN', 'myModal-tblN');
}

function openModalA() {
	openModal('myModalA', 'myModal-tblA');
	closeModalOnOutsideClick('myModalA');
}

function closeModalA() {
	closeModal('myModalA', 'myModal-tblA');
}

function openModalV() {
	openModal('.selectModal', '.selectModal-tbl');
	closeModalOnOutsideClick('.selectModal', '.selectModal-tbl');
}

function closeModalV() {
	closeModal('myModalV', 'myModal-tblV');
	closeModal('myModalR', 'myModal-tblR');
}

//function openModalR() {
//	openModal('myModalR', 'myModal-tblR');
//}

//function closeModalR() {
//	closeModalR2('myModalR', 'myModal-tblR');
//}

function closeModalNR() {
	closeModal('.modal-background ', '.myModal-tblNR');
}

function closeSelectModal() {
	closeModal('.selectModal ', '.selectModal-tbl');
}

function closeRegModal() {
		
	closeModal('.regModal-background', '.regModal-tbl');
}

function openModalNR() {
	openModal('#myModalNR', '#myModal-tblNR');
	closeModalOnOutsideClick('#myModalNR', '#myModal-tblNR');
}


//<<<<<<< HEAD


//날짜 바꾸기
function formatDate(date) {
	const pad = (num) => (num < 10 ? '0' + num : num);

	const year = date.getFullYear();
	const month = pad(date.getMonth() + 1);
	const day = pad(date.getDate());

	return `${year}-${month}-${day}`;
}
//=======
//};

function updateModalContent(questionJson) {
	$('#myModal-tblA #q_seq').html(`<div>${questionJson.q_seq}</div>`);
	$('#myModal-tblA #q_title').html(`<div>${questionJson.q_title}</div>`);
	$('#myModal-tblA #q_content').html(`<div>${questionJson.q_content}</div>`);
	$('#myModal-tblA #q_reg_date').html(`<div>${questionJson.q_reg_date}</div>`);
	$('#myModal-tblA #q_contact_number').html(`<div>${questionJson.q_contact_number}</div>`);
	$('#myModal-tblA #q_email').html(`<div>${questionJson.q_email}</div>`);
	$('#myModal-tblA #q_name').html(`<div>${questionJson.q_name}</div>`);
	$('#myModal-tblA #q_password').html(`<div>${questionJson.q_password}</div>`);
	$('#myModal-tblA #q_category').html(`<div>${questionJson.q_category}</div>`);
};

//>>>>>>> 36e0fd5048773fd508dc36122a0cc5d8316894cf



//CRUD: update
function updateComments() {

	let c_seq = $('#hidden_c_seq').val();
	let c_comment_content = $('#COMMENT_CONTENT').val();

	$.ajax({
		url: 'CommentUpdateC',
		method: 'post',
		data: {
			c_seq: c_seq,
			c_comment_content: c_comment_content
		},

		success: function() {
			console.log("업데이트 성공")
		},
		error: function(xhr, status, error) {
			console.log("업데이트 실패 에러:", xhr, status, error);
		}
	});

}

//CRUD: insert
function submitComments() {

	let c_comment_content = $('#c_comment_content').val();
	let q_seq = $('#q_seq').val();

	$.ajax({
		url: 'CommentSubmitC',
		method: 'post',
		data: {
			q_seq: q_seq,
			c_comment_content: c_comment_content
		},

		success: function() {
			console.log("Submit 성공");
			location.reload(true);
		},
		error: function(xhr, status, error) {
			console.log("Submit 에러: ", xhr, status, error);
		}

	});
}

//CRUD: delete
function deleteQuestion(q_seq) {
	let ok = confirm("削除しますか?");
	if (ok) {
		$.ajax({
			url: 'AskDeleteC',
			method: 'post',
			data: {
				q_seq: q_seq
			},
			success: function() {
				console.log("삭제 성공");
				location.reload();
			},
			error: function(xhr, status, error) {
				console.log("삭제 에러: ", xhr, status, error);
			}


		});
	}
}


//체크박스 제출
$(document).ready(function() {
	// 체크박스의 change 이벤트를 감지
	$('input[type="checkbox"]').change(function() {
		// 체크박스가 변경되면 바로 폼을 제출
		$('#checkbox').submit();
	});

	// 폼 제출 시의 동작을 처리하는 함수
	$('#checkbox').submit(function() {
		// 폼이 제출될 때 수행할 동작 추가
		console.log('Form submitted!');
		// 추가로 필요한 로직을 여기에 작성
		var checkboxData = [];
		$('input[type="checkbox"]').each(function() {
			checkboxData.push({
				value: $(this).val(),
				checked: $(this).prop('checked')
			});
		});
		filterByCheckbox(checkboxData);

		return true;
	});
});


function getNOTICEDataV(an_seq) {

	$.ajax({
		url: "getNOTICEDetailC",
		method: "post",
		data: {
			an_seq: an_seq
		},

		success: function(data) {

			console.log("data: ", data);

			if (Array.isArray(data) && data.length > 0) {
				let an_seq = data[0].an_seq;
				let an_title = data[0].an_title;
				let an_content = data[0].an_content;
				let an_writer = data[0]. an_writer;
				let an_reg_date = data[0].an_reg_date;
				let an_category = data[0].an_category;
				console.log('an_seq :' + an_seq);
				console.log('an_title :' + an_title);
				console.log('an_content :' + an_content);
				console.log('an_writer :' + an_writer);
				console.log('an_reg_date :' + an_reg_date);
				console.log('an_category :' + an_category);

			
				$('.showModalTitleColum').val(an_title);
				$('.showCategoryColum').text(an_category);
				$('.classicNR').html(an_content);
//				$('#real-title-editor').val(an_title);


//				document.getElementById('aaaaaaaaaaaaaaaaaaaaaaaaaa').onclick = function() {
//
//					$('#real-title-editorN').val(an_title);
//					$('#CCCCCCCCCCCC').html(an_category);
//					$('#classicR').html(an_content);
//					window.editorR.setData(an_content);
//					$('#kategorieR').html(an_category);
//					$('#seq').val(an_seq);
//
//					if (an_category == 'announcement') {
//						$('#kategorieR').html('안내');
//					} else if (an_category == 'schedule') {
//						$('#kategorieR').html('스케줄');
//					} else if (an_category == 'general') {
//						$('#kategorieR').html('일반');
//					} else if (an_category == 'service') {
//						$('#kategorieR').html('서비스');
//					} else if (an_category == 'product') {
//						$('#kategorieR').html('상품');
//					}
//
//					let mmmmmmmm = document.getElementById('kategorieR');
//					let newInput = document.createElement("input");
//
//					newInput.type = "hidden";
//					newInput.value = an_category;
//					newInput.name = 'select';
//					newInput.id = 'myInputR';
//					mmmmmmmm.appendChild(newInput);
//
//					window.editor.setData(an_content);
//					openModalR();
//				}; 

				openModalV();
			} else {
				console.log("NOTICE 데이터 가져오기 성공");
			}

//		openModalV();

		},
		error: function(xhr, status, error) {
			console.log("NOTICE 데이터 가져오기 실패");
			console.log("error:", xhr, status, error);
		}
	})

}




function getNOTICEDataR(an_seq, an_title, an_content, an_writer, an_reg_date, an_category) {
	console.log("an_seq: ", an_seq);

	$.ajax({
		url: "getNOTICEDetailC",
		method: "post",
		data: {
			an_seq: an_seq,
			an_title: an_title,
			an_content: an_content,
			an_writer: an_writer,
			an_reg_date: an_reg_date,
			an_categor: an_category
		},

		success: function(data) {

			console.log("data: ", data);
			console.log("NOTICE 데이터 가져오기 성공");


			if (Array.isArray(data) && data.length > 0) {
				let an_seq = data[0].an_seq;
				let an_title = data[0].an_title;
				let an_content = data[0].an_content;
				let an_writer = data[0].an_content;
				console.log('111111111111111111111111111111111111111111');
				console.log("qa_content: ", an_content);
				console.log('111111111111111111111111111111111111111111');
				let an_reg_date = data[0].an_reg_date;
				let an_category = data[0].an_category;


				$('#modal-seq').val(an_seq);
				//				$('#classicNR_Title').val(qa_title);
				//				이거 활성화하면 타이틀에 value로 들어가는 대신 placeholder로 들어가게 된다... 옵션
				//				$('#real-title-editor').attr('placeholder', qa_title);	





				openModalR();
			} else {
				console.log("NOTICE 데이터 가져오기 성공");
			}


		},
		error: function(xhr, status, error) {
			console.log("NOTICE 데이터 가져오기 실패");
			console.log("error:", xhr, status, error);
		}
	})

}

function getNOTICEDataUpdateView(an_seq) {
	console.log("an_seq: ", an_seq);

	$.ajax({
		url: "getNOTICEDetailC",
		method: "post",
		data: {
			an_seq: an_seq
		},

		success: function(data) {

			console.log("data: ", data);
			console.log('수정후 이게 실행되야됨');
			console.log("NOTICE 데이터 가져오기 성공");

			if (Array.isArray(data) && data.length > 0) {
				let an_seq = data[0].an_seq;
				let an_title = data[0].an_title;
				let an_content = data[0].an_content;
				let an_writer = data[0].an_content;
				console.log('111111111111111111111111111111111111111111');
				console.log("qa_content: ", an_content);
				console.log('111111111111111111111111111111111111111111');
				let an_reg_date = data[0].an_reg_date;
				let an_category = data[0].an_category;

				$('#modal-seq').val(an_seq);
				$('#real-title-V').html(an_title);
				$('#Display-Category').html(an_category);
				$('#modal-content-txt-in').html(an_content);
				$('#real-title-editor').val(an_title);

				openModalV();

			}
		}
	})
}

let updateSEQ = document.querySelector('#updateSEQ');
console.log('수정 안하면 이건 뭐가되냐?' + updateSEQ.value);
if (updateSEQ.value != '') {
	getNOTICEDataUpdateView(updateSEQ.value);
}


function deleteNotice(seq) {

	let pageVal = document.querySelector('#pageNum').value;
	let checkVal = document.getElementsByName('checkVal')[0];
	console.log(checkVal + "체크벨류");
	console.log(checkVal.value + "체크벨류값");

	if (confirm('정말 삭제 합니까?')) {
		location.href = "deleteNoticeC?an_seq=" + seq + "&p=" + pageVal +"&checkVal=" + checkVal.value;
	} else {
		return;
	}
};

function searchCheckBoxVal() {
	let checkBoxArr = document.querySelectorAll('.noticeCheck');
	let checkVal = '';
	for (let i = 0; i < checkBoxArr.length; i++) {
		console.log(checkBoxArr[i]);
		console.log(checkBoxArr[i].checked);
		if (checkBoxArr[i].checked == true) {
			checkVal += checkBoxArr[i].value;
		}
	}
	console.log("써치체크박스벨류");
	return checkVal;
}

function noticeSearch() {
	
	let pageVal = document.querySelector('#pageNum').value;
	if(pageVal == ''){
		pageVal = 1;
	}

	console.log("노티스써치");
	if(searchCheckBoxVal()){
		location.href = 'NoticePagingC?p=' + pageVal + '&checkVal=' + searchCheckBoxVal();
	}else{
		alert('하나이상의 체크박스에 체크를 해야합니다.');
		history.go(0);
	}

}

function noticeSearchCheckBoxCheck() {
	let url = new URL(window.location.href);

	let searchParams = new URLSearchParams(url.search);

	let checkVal = searchParams.get("checkVal");
	
	for(let i=0; i<checkVal.length; i++){
		let check = checkVal.charAt(i);
		document.querySelectorAll('.noticeCheck')[check].checked = true;
		
	}
	console.log("노티스써치체크박스체크시키는기능");
	
}
noticeSearchCheckBoxCheck();





