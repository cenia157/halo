// 이곳은 Modal의 스크립트를 모아둔 곳이다

// 일반적인 모달 열기
function openModal() {
	document.getElementById('myModal').style.display = 'flex';
	document.getElementById('myModal-tbl').style.display = 'flex';
}

// 일반적인 모달 닫기
function closeModal() {
	document.getElementById('myModal').style.display = 'none';
	document.getElementById('myModal-tbl').style.display = 'none';
}

// noticeViewPage  모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModal')) {
		closeModal();
	}
}


// 이건 실험용









// noticeViewPage 모달 열기
function openModalV() {
	document.getElementById('myModalV').style.display = 'flex';
	document.getElementById('myModal-tblV').style.display = 'flex';
}

// noticeViewPage 모달 닫기
function closeModalV() {
	document.getElementById('myModalV').style.display = 'none';
	document.getElementById('myModal-tblV').style.display = 'none';
	// 아래의 2줄은 noticeRegPage가 열린 상태에서 외부클릭 시 View와 Reg 동시에 닫히도록 하기 위해 작성됨
	document.getElementById('myModalR').style.display = 'none';
	document.getElementById('myModal-tblR').style.display = 'none';
}

// noticeViewPage  모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModalV')) {
		closeModalE();
	}
}

// noticeRegPage 모달 열기
function openModalR() {
	document.getElementById('myModal-tblR').style.display = 'flex';
}

// noticeRegPage 모달 닫기
function closeModalR() {
	document.getElementById('myModalR').style.display = 'none';
	document.getElementById('myModal-tblR').style.display = 'none';
}

// noticeRegPage 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModalE')) {
		closeModalV();
	}
}

// noticeNEWRegPage 모달 열기
function openModalNR() {
	document.getElementById('myModalNR').style.display = 'flex';
	document.getElementById('myModal-tblNR').style.display = 'flex';
}

// noticeNEWRegPage 모달 닫기
function closeModalNR() {
	document.getElementById('myModalNR').style.display = 'none';
	document.getElementById('myModal-tblNR').style.display = 'none';
}

// noticeNEWRegPage 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModalNR')) {
		closeModalV();
	}
}
