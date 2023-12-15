// 이곳은 Modal의 스크립트를 모아둔 곳이다

// noticeEditPage 모달 열기
function openModalV() {
	document.getElementById('myModalV').style.display = 'flex';
	document.getElementById('myModal-tblV').style.display = 'flex';
}

// noticeEditPage 모달 닫기
function closeModalV() {
	document.getElementById('myModalV').style.display = 'none';
	document.getElementById('myModal-tblV').style.display = 'none';
	document.getElementById('myModalR').style.display = 'none';
	document.getElementById('myModal-tblR').style.display = 'none';
}

// noticeEditPage 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModalV')) {
		closeModalE();
	}
}








function openModalR() {
	document.getElementById('myModal-tblR').style.display = 'flex';
}

// noticeViewPage 모달 닫기
function closeModalR() {
	document.getElementById('myModalR').style.display = 'none';
	document.getElementById('myModal-tblR').style.display = 'none';
}

// noticeViewPage 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModalE')) {
		closeModalV();
	}
}








function openModalNR() {
	document.getElementById('myModalNR').style.display = 'flex';
	document.getElementById('myModal-tblNR').style.display = 'flex';
}

// noticeViewPage 모달 닫기
function closeModalNR() {
	document.getElementById('myModalNR').style.display = 'none';
	document.getElementById('myModal-tblNR').style.display = 'none';
}

// noticeViewPage 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
	if (event.target == document.getElementById('myModalNR')) {
		closeModalV();
	}
}