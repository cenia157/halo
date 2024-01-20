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
	// 24-01-19 추가 등록버튼 여러번 반복시, 이미지아이콘 구분선 disabled되는 오류 추가 수정 
	$(".ck-button[data-cke-tooltip-text='パソコンから画像をアップロード']").removeClass("ck-disabled").prop("disabled", false);
	$(".ck-button[data-cke-tooltip-text='区切り']").removeClass("ck-disabled").prop("disabled", false);
}

function closeModalNR() {
	closeModal('myModalNR', 'myModal-tblNR');
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

	let mmmmmmmm = $("#kategorieR");
    let newInput = $("<input>");

	newInput.attr("type", "hidden");
    newInput.attr("value", an_category);
    newInput.attr("name", "select");
    newInput.attr("id", "myInputR");
    mmmmmmmm.append(newInput);


	openModalR();
	document.querySelector('.view-modal-tbl').style.display = 'none';
	
	//	24.01.18 업데이트 모달창 이미지 순차정렬 안되는 문제 해결 
	let $ckFormRDiv = $('#ck-formR');
    let $ckContentDivs = $ckFormRDiv.find('.ck-content');

    for (let i = 0; i < $ckContentDivs.length; i++) {
        let $figures = $ckContentDivs.eq(i).find('figure');

        for (let j = 0; j < $figures.length; j++) {
            let $img = $figures.eq(j).find('img');
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
	//	24.01.18 수정끝 

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
				let an_reg_date = data[0].an_reg_date;
				let an_category = data[0].an_category;


				$('#modal-seq').val(an_seq);

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

			if (Array.isArray(data) && data.length > 0) {
				let an_seq = data[0].an_seq;
				let an_title = data[0].an_title;
				let an_content = data[0].an_content;
				let an_writer = data[0].an_content;
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
}

noticeSearchCheckBoxCheck();

function noValue() {
    let titleCheck = document.querySelector('#real-title-editor').value;
    let kategorieCheck = document.querySelector('#kategorie').children[0];
    let contentCheck = window.editor.getData();

    let titleLengthCheck = titleCheck.length;
    let contentLengthCheck = contentCheck.length;

    if (!titleCheck) {
        alert("제목의 값을 입력하세요");
        return false;
    } else if (kategorieCheck == null) {
        alert("카테고리의 값을 입력하세요");
        return false;
    } else if (contentCheck == "") {
        alert("내용을 입력하세요");
        return false;
    } else if (titleLengthCheck > 50) {
        // alert('제목의 길이는 50자를 넘을 수 없습니다.\n현재 글자 수 : ' + titleLengthCheck);
        return false;
    } else if (contentLengthCheck > 10000) {
        alert('내용의 길이는 10,000 넘을 수 없습니다.\n현재 내용의 길이 : ' + contentLengthCheck);
        return false;
    } else {
        return true;
    }
};

function toggle() {

	document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';};

	document.querySelectorAll('.toggle-item').forEach(function(item) {
		item.addEventListener('click', function() {
			document.querySelector('#kategorie').innerHTML = item.innerHTML;
			document.querySelector('#toggle-down').style.display = 'none';
			document.querySelector('#toggle-down').style.display = (document.querySelector('#toggle-down').style.display === 'flex') ? 'none' : 'flex';
			document.querySelector('#kategorie').children[0].name = 'select';
	});
});

function toggleR() {

	document.querySelector('#toggle-downR').style.display = (document.querySelector('#toggle-downR').style.display === 'flex') ? 'none' : 'flex';};

	document.querySelectorAll('.toggle-item').forEach(function(item) {
		item.addEventListener('click', function() {
			document.querySelector('#kategorieR').innerHTML = item.innerHTML;
			document.querySelector('#toggle-downR').style.display = 'none';
			document.querySelector('#toggle-downR').style.display = (document.querySelector('#toggle-downR').style.display === 'flex') ? 'none' : 'flex';

		document.querySelector('#kategorieR').children[0].name = 'select';

	});
});

// 관리자 공지사항 수정완료후 뷰 페이지가 나오는데, 모달창 닫고 새로고침해도 seq url때문에 
// 여러번 새로고침해도 뷰 페이지 나오는 현상 수정
document.addEventListener('DOMContentLoaded', function() {
    let performanceEntries = performance.getEntriesByType("navigation");
    if (performanceEntries.length > 0 && performanceEntries[0].type === "reload") {
        let url = new URL(window.location.href);
        let params = new URLSearchParams(url.search);

        if (params.has('seq')) {
            params.delete('seq');
            window.history.replaceState(null, null, url.pathname + '?' + params.toString());
			closeModalV();
        }
    }
});




