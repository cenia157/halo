// 공통 함수: 모달 열기
function openModal(modalId, tblId) {
	document.getElementById(modalId).style.display = 'flex';
	document.getElementById(tblId).style.display = 'flex';

	// 아래 6줄은 모달창 열 때 스크롤 감추기 & 터치, 휠 불가
	$('html, body').css({ 'overflow': 'hidden', 'height': '100%' }); // 모달팝업 중 html,body의 scroll을 hidden시킴
	$('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지
		event.preventDefault();
		event.stopPropagation();
		return false;
	});
}

// 공통 함수: 모달 닫기
function closeModal(modalId, tblId) {
	document.getElementById(modalId).style.display = 'none';
	document.getElementById(tblId).style.display = 'none';

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

// 공통 함수: 모달 외부 클릭 시 닫기
function closeModalOnOutsideClick(modalId) {
	window.onclick = function(event) {
		if (event.target == document.getElementById(modalId)) {
			closeModal(modalId, getTblId(modalId));
		}
	};
}

// 공통 함수: 모달의 tbl 아이디 가져오기
function getTblId(modalId) {
	return modalId.replace('myModal', 'myModal-tbl');
}

// 자주묻는질문(frequenthyask) 모달
function openModalF() {
	openModal('myModalF', 'myModal-tblF');
	closeModalOnOutsideClick('myModalF');
}

function closeModalF() {
	closeModal('myModalF', 'myModal-tblF');
}

// 문의사항(ask) 모달
// 미답변 모달
function openModalN() {
	openModal('myModalN', 'myModal-tblN');
	closeModalOnOutsideClick('myModalN');
}

function closeModalN() {
	closeModal('myModalN', 'myModal-tblN');
}

//	답변 모달
function openModalA() {
	openModal('myModalA', 'myModal-tblA');
	closeModalOnOutsideClick('myModalA');
}

function closeModalA() {
	closeModal('myModalA', 'myModal-tblA');
}

// 공지사항(notice) 모달
// ViewPage를 띄우기 위한 모달
function openModalV() {
	openModal('myModalV', 'myModal-tblV');
	closeModalOnOutsideClick('myModalV');
}

function closeModalV() {
	closeModal('myModalV', 'myModal-tblV');
	closeModal('myModalR', 'myModal-tblR');
}

// RegPage를 띄우기 위한 모달
function openModalR() {
	openModal('myModalR', 'myModal-tblR');
}

function closeModalR() {
	closeModal('myModalR', 'myModal-tblR');
}

// NEWRegPage를 띄우기 위한 모달
function openModalNR() {
	openModal('myModalNR', 'myModal-tblNR');
	closeModalOnOutsideClick('myModalNR');
}

function closeModalNR() {
	closeModal('myModalNR', 'myModal-tblNR');
}


//문의사항@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function getData(q_seq, q_title, q_content, q_reg_date, q_contact_number, q_email, q_name, q_password, q_category) {

	// 첫 번째 Ajax 요청
	$.ajax({
		url: "GetDataC",
		type: "post",
		dataType: "json",
		data: {
			q_seq: q_seq,
			q_title: q_title,
			q_content: q_content,
			q_reg_date: q_reg_date,
			q_contact_number: q_contact_number,
			q_email: q_email,
			q_name: q_name,
			q_password: q_password,
			q_category: q_category
		},
		success: function(data) {
			try {
				console.log("Data:", data);

				if (Array.isArray(data) && data.length > 0) {
					let qSeq = data[0].q_seq;
					let qTitle = data[0].q_title;
					let qContent = data[0].q_content;
					let qRegDate = new Date(data[0].q_reg_date);
					let formattedDate = formatDate(qRegDate);
					let qCN = data[0].q_contact_number;
					let qEmail = data[0].q_email;
					let qName = data[0].q_name;
					let qPW = data[0].q_password;
					let qCategory = data[0].q_category;

					console.log("qSeq: ", qSeq);


					// A questions 데이터 표시
					$('#A_QUESTION_TITLE').html(qTitle);
					$('#A_QUESTION_DATE').html(formattedDate);
					$('#A_QUESTION_NAME').html(qName);
					$('#A_QUESTION_CONTENT').html(qContent);

					// N questions 데이터 표시
					$('#N_QUESTION_TITLE').html(qTitle);
					$('#N_QUESTION_DATE').html(formattedDate);
					$('#N_QUESTION_NAME').html(qName);
					$('#N_QUESTION_CONTENT').html(qContent);
					$('#q_seq').val(qSeq);
					//확인
					$('#QUESTION_SEQ').html(qSeq);


					// comments 데이터를 가져와서 표시
					getComments(q_seq);

				} else {
					console.error("데이터가 비어있거나 배열이 아닙니다.");
				}

			} catch (error) {
				console.error("데이터 처리 오류:", error);
			}
		},
		error: function(xhr, status, error) {
			console.log("에러:", xhr, status, error);
		}
	});
}

// 댓글 불러오기
function getComments(q_seq, c_commenter_name, c_comment_content, c_reg_date, c_answer, c_seq) {

	console.log("콘솔: ", q_seq);

	$.ajax({
		url: "GetCommentsC",
		type: "post",
		dataType: "json",
		data: {
			q_seq: q_seq,
			c_seq: c_seq,
			c_commenter_name: c_commenter_name,
			c_comment_content: c_comment_content,
			c_reg_date: c_reg_date,
			c_answer: c_answer
		},
		success: function(commentData) {
			try {

				if (Array.isArray(commentData) && commentData.length > 0) {
					let cSeq = commentData[0].c_seq;
					let c_commenter_name = commentData[0].c_commenter_name;
					let CRegDate = new Date(commentData[0].c_reg_date);
					let formattedDate = formatDate(CRegDate);
					let c_comment_content = commentData[0].c_comment_content;
					let c_answer = commentData[0].c_answer;
					let qSeq = commentData[0].q_seq;

					$('#COMMENT_CONTENT').val(c_comment_content);
					$('#COMMENT_NAME').html(c_commenter_name);
					$('#hidden_c_seq').val(cSeq);

					//모달창 열기
					if (c_comment_content != null) {
						openModalA();
					}

				} else {
					console.log("댓글이 없습니다.");
					console.log("QSEQ: " + q_seq);
					//모달창 열기
					if (c_comment_content == null) {
						openModalN(q_seq);
					}
				}
			} catch (error) {
				console.error("댓글 처리 오류:", error);
			}
		},
		error: function(xhr, status, error) {
			console.log("댓글 불러오기 에러:", xhr, status, error);
		}
	});
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

function filterByCheckbox(data){
	console.log(data);
	console.log("---------");
	
	
}


//FAQ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function getFAQData(qa_seq, qa_title, qa_content, qa_reg_date) {
	console.log("qa_seq: ", qa_seq);

	$.ajax({
		url: "getFAQDetailC",
		method: "post",
		data: {
			qa_seq: qa_seq,
			qa_title: qa_title,
			qa_content: qa_content,
			qa_reg_date: qa_reg_date
		},

		success: function(data) {

			console.log("data: ", data);
			console.log("FAQ 데이터 가져오기 성공");


			if (Array.isArray(data) && data.length > 0) {
				let qa_seq = data[0].qa_seq;
				let qa_title = data[0].qa_title;
				let qa_content = data[0].qa_content;
				console.log("qa_content: ", qa_content);
				let qa_reg_date = data[0].qa_reg_date;

				$('#modal-seq').val(qa_seq);
//				$('#classicNR_Title').val(qa_title);
//				이거 활성화하면 타이틀에 value로 들어가는 대신 placeholder로 들어가게 된다... 옵션
//				$('#real-title-editor').attr('placeholder', qa_title);	
				$('#real-title-editor').val(qa_title);
				$('#classicNR').html(qa_content);



				// CKEditor에 데이터 설정
				window.editor.setData(qa_content);

				//				let classicNR = document.getElementById("classicNR");
				//				classicNR.innerHTML = "나옴?";

				openModalF();
			}


		},
		error: function(xhr, status, error) {
			console.log("FAQ 데이터 가져오기 실패");
			console.log("error:", xhr, status, error);
		}
	})

}

function deleteFAQ(qa_seq) {
	let ok = confirm("削除しますか?");
	if (ok) {
		console.log(qa_seq);
		$.ajax({
			url: 'DeleteFAQC',
			method: 'POST',
			data: {
				qa_seq: qa_seq
			},
			success: function() {
				console.log("FAQ 삭제성공");
				location.reload();
			},
			error: function(xhr, status, error) {
				console.log("삭제 error: ", xhr, status, error);
			}
		});
	}
}