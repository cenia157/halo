// 공통 함수: 모달 열기
// view 조회후 뽑은 값
let viewData = null;
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
	closeModalR2('myModalR', 'myModal-tblR');
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
		fetchData(checkboxData);
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

function filterByCheckbox(data) {
	$.ajax({
		url: "CheckboxC",
		method: "POST",
		dataType: "json",
		data: {
			completed: data.some(item => item.value === 'completed' && item.checked),
			uncompleted: data.some(item => item.value === 'uncompleted' && item.checked)
		},
		success: function(responseData) {
			console.log("responseData: ", responseData);
			refreshData(responseData);
		},
		success: function(data) {
			console.log("newQnCs: ", data);
			eval(data); // 업데이트된 QnCs를 처리하는 스크립트 실행
		},
		error: function(xhr, status, error) {
			console.log("에러발생: ", xhr, status, error)
		}
	});
}

function refreshData(QnCs) {
	var container = document.getElementById("FOREACH_ASK");
	container.innerHTML = ""; // 기존 내용 비우기
	let curPageNo = 1;

	// JSON 데이터 파싱
	var QnCs = JSON.parse(QnCs);

	// QnCs가 배열이 아니면 배열로 변환
	if (!Array.isArray(QnCs)) {
		QnCs = [];
	}

	// QnCs 데이터를 이용하여 화면 갱신
	QnCs.forEach(function(item, index) {
		// Date 객체로 변환
		let qRegDate = new Date(item.q_reg_date);

		// 날짜를 'YYYY-MM-DD' 형식으로 포맷
		let formattedDate = qRegDate.toLocaleDateString('ja-JP', { year: 'numeric', month: '2-digit', day: '2-digit' }).replace(/\//g, '-');

		var newElement = document.createElement("div");
		newElement.className = "ontent-m-td-2-content-txt-in";

		newElement.innerHTML = `
            <input type="hidden" name="q_seq" value="${item.q_seq}">
            <div class="ontent-m-td-2-content-txt-no-in">
                ${(index + 1) + (curPageNo - 1) * 8}
            </div>
            <div class="ontent-m-td-2-content-txt-kategorie-in">
                ${item.c_answer === '1' ? '完' : '未'}
            </div>
            <div class="ontent-m-td-2-content-txt-title-in">
                <a href="#" onclick="getData('${item.q_seq}');">${item.q_title}</a>
            </div>
            <div class="ontent-m-td-2-content-txt-writer-in">${item.q_name}</div>
            <div class="ontent-m-td-2-content-txt-date-in">${formattedDate}</div>
            <div class="ontent-m-td-2-content-txt-delete-in">
                <a href="#" onclick="deleteQuestion('${item.q_seq}')">削除</a>
            </div>
        `;
		container.appendChild(newElement);


		//페이징 추가 시도
		var pagingElement = document.createElement("div");
		pagingElement.className = "paging-div";
		pagingElement.innerHTML = `
		    var firstButton = document.createElement("button");
		    if (curPageNo > 5) {
		        var firstLink = document.createElement("a");
		        firstLink.href = "AskPagingC?p=" + (curPageNo - 5);
		        firstLink.appendChild(firstButton);
		        pagingDiv.appendChild(firstLink);
		    } else if (curPageNo <= 5 && curPageNo > 1) {
		        var firstLink = document.createElement("a");
		        firstLink.href = "AskPagingC?p=1";
		        firstLink.appendChild(firstButton);
		        pagingDiv.appendChild(firstLink);
		    } else {
		        firstButton.disabled = true;
		        pagingDiv.appendChild(firstButton);
		    }
		
		    // 이전 페이지로 가는 버튼
		    var prevButton = document.createElement("button");
		    if (curPageNo > 1) {
		        var prevLink = document.createElement("a");
		        prevLink.href = "AskPagingC?p=" + (curPageNo - 1);
		        prevLink.appendChild(prevButton);
		        pagingDiv.appendChild(prevLink);
		    } else {
		        prevButton.disabled = true;
		        pagingDiv.appendChild(prevButton);
		    }
		
		    // 페이지 번호 생성
		    var startPage = Math.max(1, curPageNo - 2);
		    var endPage = Math.min(curPageNo + 2, pageCount);
		
		    for (var i = startPage; i <= endPage; i++) {
		        var pageButton = document.createElement("button");
		        var pageLink = document.createElement("a");
		        pageLink.href = "AskPagingC?p=" + i;
		        pageLink.className = i === curPageNo ? 'page-number current-page' : 'page-number';
		        pageLink.textContent = "[" + i + "]";
		        pageLink.appendChild(pageButton);
		        pagingDiv.appendChild(pageLink);
		    }
		
		    // 다음 페이지로 가는 버튼
		    var nextButton = document.createElement("button");
		    if (curPageNo < pageCount) {
		        var nextLink = document.createElement("a");
		        nextLink.href = "AskPagingC?p=" + (curPageNo + 1);
		        nextLink.appendChild(nextButton);
		        pagingDiv.appendChild(nextLink);
		    } else {
		        nextButton.disabled = true;
		        pagingDiv.appendChild(nextButton);
		    }
		
		    // 마지막으로 가는 버튼
		    var lastButton = document.createElement("button");
		    if (curPageNo + 5 <= pageCount) {
		        var lastLink = document.createElement("a");
		        lastLink.href = "AskPagingC?p=" + (curPageNo + 5);
		        lastLink.appendChild(lastButton);
		        pagingDiv.appendChild(lastLink);
		    } else if (curPageNo + 5 > pageCount && curPageNo < pageCount) {
		        var lastLink = document.createElement("a");
		        lastLink.href = "AskPagingC?p=" + pageCount;
		        lastLink.appendChild(lastButton);
		        pagingDiv.appendChild(lastLink);
		    } else {
		        lastButton.disabled = true;
		        pagingDiv.appendChild(lastButton);
		    }
		
		    // 페이징 끝에 추가
		    document.body.appendChild(pagingDiv);
		}
        `;

		container.appendChild(pagingElement);
		//        console.log("html 확인: ", newElement.outerHTML);
	});
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



function getNOTICEDataV(an_seq) {
	console.log("an_seq: ", an_seq);

	$.ajax({
		url: "getNOTICEDetailC",
		method: "post",
		data: {
			an_seq: an_seq
		},

		success: function(data) {

			console.log("data: ", data);
			console.log("NOTICE 데이터 가져오기 성공");


			if (Array.isArray(data) && data.length > 0) {
				viewData = data;
				let an_seq = data[0].an_seq;
				let an_title = data[0].an_title;
				let an_content = data[0].an_content;
				let an_writer = data[0].an_content;
				let an_reg_date = data[0].an_reg_date;
				let an_category = data[0].an_category;


				//				$('#classicNR_Title').val(qa_title);
				//				이거 활성화하면 타이틀에 value로 들어가는 대신 placeholder로 들어가게 된다... 옵션
				//				$('#real-title-editor').attr('placeholder', qa_title);	
				$('#modal-seq').val(an_seq);
				$('#real-title-V').html(an_title);
				$('#Display-Category').html(an_category);
				$('#modal-content-txt-in').html(an_content);
				$('#real-title-editor').val(an_title);

				openModalV();
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

document.getElementById('aaaaaaaaaaaaaaaaaaaaaaaaaa').addEventListener("click",function() {

//	document.getElementById(myModal-tblV).style.display = 'none';
	
	let an_seq = viewData[0].an_seq;
	let an_title = viewData[0].an_title;
	let an_content = viewData[0].an_content;
	let an_writer = viewData[0].an_content;
	let an_reg_date = viewData[0].an_reg_date;
	let an_category = viewData[0].an_category;
	
	$('#real-title-editorN').val(an_title);
	$('#CCCCCCCCCCCC').html(an_category);
	$('#classicR').html(an_content);
	window.editorR.setData(an_content);
	$('#kategorieR').html(an_category);
	$('#seq').val(an_seq);

	if (an_category == 'announcement') {
		$('#kategorieR').html('안내');
	} else if (an_category == 'schedule') {
		$('#kategorieR').html('스케줄');
	} else if (an_category == 'general') {
		$('#kategorieR').html('일반');
	} else if (an_category == 'service') {
		$('#kategorieR').html('서비스');
	} else if (an_category == 'product') {
		$('#kategorieR').html('상품');
	}

	let mmmmmmmm = document.getElementById('kategorieR');
	let newInput = document.createElement("input");

	newInput.type = "hidden";
	newInput.value = an_category;
	newInput.name = 'select';
	newInput.id = 'myInputR';
	mmmmmmmm.appendChild(newInput);

	window.editor.setData(an_content);
	openModalR();
	
//	24.01.18수정시작
let $ckFormRDiv = $('#ck-formR');

            // "ck-content" 클래스를 가진 div 요소들을 선택합니다.
            let $ckContentDivs = $ckFormRDiv.find('.ck-content');

            // 각각의 "ck-content" 클래스를 가진 div 요소에 대해 반복합니다.
            for (let i = 0; i < $ckContentDivs.length; i++) {
                // 현재 div 요소 내에서 figure 요소를 선택합니다.
                let $figures = $ckContentDivs.eq(i).find('figure');

                // figure 요소에 대해 반복합니다.
                for (let j = 0; j < $figures.length; j++) {
                    // figure 요소 내에서 img 요소를 선택합니다.
                    let $img = $figures.eq(j).find('img');

                    // img 요소의 src 속성 값을 가져옵니다.
                    let srcValue = $img.attr('src');

                    // data-check 속성을 생성하고 src 값을 할당합니다.
                    $img.attr('data-check', srcValue);

                    // img-temporaryR div 요소를 선택합니다.
                    let $imgTemporaryRDiv = $('#img-temporaryR');

                    // input 요소를 생성합니다.
                    let $inputElement = $('<input>');

                    // input 요소의 type, name, id, data-check 속성, value 값을 설정합니다.
                    $inputElement.attr({
                        type: 'text',
                        name: 'saveFname',
                        id: 'img-url',
                        'data-check': srcValue,
                        value: srcValue
                    });

                    // input 요소를 img-temporaryR div에 추가합니다.
                    $imgTemporaryRDiv.append($inputElement);
                }
            }

//	24.01.18수정끝 
	
	


}); // addEventListener



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
			viewData = data;
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

	if (confirm('정말 삭제 합니까?')) {
		location.href = "deleteNoticeC?an_seq=" + seq + "&p=" + pageVal +"&checkVal="+searchCheckBoxVal();
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
	if (pageVal == '') {
		pageVal = 1;
	}

	console.log("노티스써치");
	if (searchCheckBoxVal()) {
		location.href = 'NoticePagingC?p=' + pageVal + '&checkVal=' + searchCheckBoxVal();
	} else {
		alert('하나이상의 체크박스에 체크를 해야합니다.');
		history.go(0);
	}

}

function noticeSearchCheckBoxCheck() {
	let url = new URL(window.location.href);

	let searchParams = new URLSearchParams(url.search);

	let checkVal = searchParams.get("checkVal");

	for (let i = 0; i < checkVal.length; i++) {
		let check = checkVal.charAt(i);
		document.querySelectorAll('.noticeCheck')[check].checked = true;

	}
	console.log("노티스써치체크박스체크시키는기능");

}
noticeSearchCheckBoxCheck();





// 임시 notice 김진욱
