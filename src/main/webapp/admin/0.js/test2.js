// 공통 함수: 모달 열기



function openModal(modalId, tblId) {
	document.getElementById(modalId).style.display = 'flex';
	document.getElementById(tblId).style.display = 'flex';
}

// 공통 함수: 모달 닫기
function closeModal(modalId, tblId) {
	document.getElementById(modalId).style.display = 'none';
	document.getElementById(tblId).style.display = 'none';
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
function openModalN(q_seq) {
	getData(q_seq);
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


function getData(q_seq) {
    $.ajax({
        url: 'AskContentC?q_seq='+ encodeURIComponent(q_seq),
        type: 'get',
        dataType: 'json',
        success: function (question) {
			console.log(question);
			updateModalContent(question);
        },
        error: function (error) {
            console.error('Error fetching data:', error);
        }
    });
}

function updateModalContent (questionJson){
	$('#myModal-tblA #q_seq').html(<div> ${questionJson.q_seq} </div>);
	$('#myModal-tblA #q_title').html(<div>${questionJson.q_title}</div>);
	$('#myModal-tblA #q_content').html(<div>${questionJson.q_content}</div>);
	$('#myModal-tblA #q_reg_date').html(<div>${questionJson.q_reg_date}</div>);
	$('#myModal-tblA #q_contact_number').html(<div>${questionJson.q_contact_number}</div>);
	$('#myModal-tblA #q_email').html(<div>${questionJson.q_email}</div>);
	$('#myModal-tblA #q_name').html(<div>${questionJson.q_name}</div>);
	$('#myModal-tblA #q_password').html(<div>${questionJson.q_password}</div>);
	$('#myModal-tblA #q_category').html(<div>${questionJson.q_category}</div>);

}
























