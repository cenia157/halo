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

//모달창 데이터
function getData(q_seq, q_title, q_content, q_reg_date, q_contact_number, q_email, q_name, q_password, q_category) {
    console.log("q_seq: "+ q_seq);

    let c_comment_content = null;
    
    // 첫 번째 Ajax 요청
    $.ajax({
        url: "GetDataC",
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
        success: function (data) {
            try {
                console.log("Data:", data);

                if (Array.isArray(data) && data.length > 0) {
                    let qSeq = data[0].q_seq;
                    let qTitle = data[0].q_title;
                    let qContent = data[0].q_content;
                    let qRegDate = new Date(data[0].q_reg_date);
                    let formattedDate = formatDate(qRegDate);
                    let qCN = data[0].q_contact_number;
                    let qEmail = data[0].q_q_email;
                    let qName = data[0].q_name;
                    let qPW = data[0].q_password;
                    let qCategory = data[0].q_category;

                    $('#QUESTION_TITLE').html(qTitle);
                    $('#QUESTION_DATE').html(formattedDate);
                    $('#QUESTION_NAME').html(qName);
                    $('#QUESTION_CONTENT').html(qContent);
                    $('#q_seq').val(qSeq);
                    //확인
                    $('#QUESTION_SEQ').html(qSeq);
                    
                    
                } else {
                    console.error("데이터가 비어있거나 배열이 아닙니다.");
                }

                if (c_comment_content != null) {
                    openModalA();
                } else {
                    openModalN();
                }

            } catch (error) {
                console.error("데이터 처리 오류:", error);
            }
        },
        error: function (xhr, status, error) {
            console.log("에러:", xhr, status, error);
        }
    });

}





//날짜 바꾸기
function formatDate(date) {
    const pad = (num) => (num < 10 ? '0' + num : num);

    const year = date.getFullYear();
    const month = pad(date.getMonth() + 1);
    const day = pad(date.getDate());

    return `${year}-${month}-${day}`;
}














