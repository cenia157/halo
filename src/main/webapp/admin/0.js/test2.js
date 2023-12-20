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

// 답변 모달
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





























let ckForm = document.querySelector('.ck-form');
		console.log(ckForm);
		
		
		ckForm.addEventListener("submit", function(event){
	     event.preventDefault(); // 기본 submit 동작 방지
		
	     
	 	 const titleValue = document.querySelector('input[name="title"]').value;
	 	 const selectValue = document.querySelector('select[name="select"]').value;
			    // URL 생성
		 const url = `CkeditorC?title=${titleValue}&select=${selectValue}&txt=${textareaValue}`;
		 const content = window.editor.getData();
		 console.log(event);
		 console.log(titleValue);
		 console.log(selectValue);
		 console.log(content);
		 const formData = new FormData(event.target);
		 
		 const payload = new URLSearchParams(formData);
		 
		 for (var pair of formData.entries()) {
		        console.log(pair[0] + ': ' + pair[1] + ': ' + pair[2]);
		    }
		 
		let CkeditorC123 = fetch('CkeditorC',  {
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





