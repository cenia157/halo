function fixedDate() {
	let date = new Date(); // 현재 날짜(로컬 기준) 가져오기
	let utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
	let kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
	let today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

	return today.getDate();
}

/////////////////////////////////////////날짜/////////////////////////////////////////////

let date = new Date(); // 현재 날짜(로컬 기준) 가져오기
let utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
let kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
let today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

// 달력에서 표기하는 날짜 객체
let thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());


let currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
let currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
let currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

// kst 기준 현재시간
// console.log(thisMonth);

// 전체 일정 배열리스트
let CompanyScheduleList = new Array;

// 날짜 체크박스 클릭 배열
let dateArr = new Array(32).fill(0);

// 전월 현월 다음월 일정 배열
let arrayCalenderList = new Array();

// 일별 일정 배열
let arrayDate = new Array();

// 연, 월 버튼 초기값
let clickButton = "";

let modalArrayNumber = '';

// 일정 상세 모달창 초기값
let dateModal = 0;

// 디테일 모달 초기
let dateDetailModal = 0;

// 일정 렌더링을 위한 이전달 개수
let prevDateLength = 0;

// 모달생성시 해당날짜
let modalDivDate = '';

// 회사 일정 디테일창 객체
let selectDetailSchedule = new Array();

// 토글스위치
let toggle = '';

// 토글 리스트
let toggleList = [0, 1, 2];

function getAllSchedule() {

	// 전체 회사 일정 ajax 호출
	fetch('CompanyScheduleList')
		.then(response => response.json())
		.then(data => {

			// javascript배열에 ajax로 가져온 배열 입력
			CompanyScheduleList = CompanyScheduleList.concat(data);

			// 전체데이터 출력
			console.log(CompanyScheduleList);

			// 페이지 입장 시 렌더링
			renderMonth(CompanyScheduleList, clickButton);

			// 전년도로 이동
			document.querySelector('.go-year-prev').addEventListener('click', function() {
				let clickButton = 'yearPrev';
				renderMonth(CompanyScheduleList, clickButton);
			});

			// 이전달로 이동
			document.querySelector('.go-prev').addEventListener('click', function() {
				let clickButton = 'monthPrev';
				renderMonth(CompanyScheduleList, clickButton);
			});

			// 다음달로 이동
			document.querySelector('.go-next').addEventListener('click', function() {
				let clickButton = 'monthNext';
				renderMonth(CompanyScheduleList, clickButton);
			});

			// 다음해로 이동
			document.querySelector('.go-year-next').addEventListener('click', function() {
				let clickButton = 'yearNext';
				renderMonth(CompanyScheduleList, clickButton);
			});

			// 버튼클릭
			calendar.addEventListener("click", function(e) {
				if (e.target.classList.contains('dateCheckBox')) {
					checkDate(e);
				}
			});

			// ++건수 클릭
			calendar.addEventListener("click", function(e) {
				if (e.target.textContent.includes('++') && e.target.closest('.current')) {
					expandSchedule(e);
				}
			})

			// 달력에서 일정 클릭
			calendar.addEventListener("click", function(e) {
				if (e.target.className.includes('schedule') && e.target.children.length > 0 && e.target.closest('.current')) {
					let directDetail = true;
					getScheduleDetailModal(e, directDetail);
				}
			})

			// 날짜 모달 내 세부사항 클릭
			document.querySelector('.date-modal-content').addEventListener("click", function(e) {
				if (e.target.classList.contains('getScheduleDetail')) {
					let directDetail = false;
					getScheduleDetailModal(e, directDetail)
				}
			})
		})


		.catch(error => {
			console.error('데이터를 가져오는 중 오류 발생:', error);
		});
}


// 초기 및 클릭 렌더링
function renderMonth(CompanyScheduleList, clickButton) {
	if (dateDetailModal == 1) {
		document.querySelector('.detail-schedule').style.visibility = 'hidden';
		dateDetailModal = 0;
	}

	if (dateModal == 1) {
		document.querySelector('.date-modal').style.visibility = 'hidden';
		dateModal = 0;
	}


	document.querySelector('.date-modal').style.visibility = 'hidden';
	dateModal = 0;

	if (clickButton == 'monthNext') {
		thisMonth = new Date(currentYear, currentMonth + 1, 1);

	} else if (clickButton == 'yearNext') {
		thisMonth = new Date(currentYear, currentMonth + 12, 1);

	} else if (clickButton == 'monthPrev') {
		thisMonth = new Date(currentYear, currentMonth - 1, 1);

	} else if (clickButton == 'yearPrev') {
		thisMonth = new Date(currentYear, currentMonth - 12, 1);
	}

	document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';
	dateArr = new Array(32).fill(0);

	renderCalender(CompanyScheduleList);
}


function renderCalender(CompanyScheduleList) {

	// 렌더링을 위한 데이터 정리
	currentYear = thisMonth.getFullYear();
	currentMonth = thisMonth.getMonth();
	currentDate = thisMonth.getDate();

	// 이전 달의 마지막 날 날짜와 요일 구하기
	let startDay = new Date(currentYear, currentMonth, 0);
	let prevDate = startDay.getDate();
	let prevDay = startDay.getDay();

	// 이번 달의 마지막날 날짜와 요일 구하기
	let endDay = new Date(currentYear, currentMonth + 1, 0);
	let nextDate = endDay.getDate();
	let nextDay = endDay.getDay();

	prevDateLength = prevDate - (prevDate - prevDay + 1);

	// console.log(prevDate, prevDay, nextDate, nextDay);

	// 현재 월 표기
	document.querySelector('.year-month').textContent = currentYear + '.' + (currentMonth + 1);

	// 렌더링 html 요소 생성
	calendar = document.querySelector('.dates');
	calendar.innerHTML = '';

	// 지난달
	for (let i = prevDate - prevDay + 1; i <= prevDate; i++) {
		let prevCalenderMonth = (currentMonth === 0) ? 12 : currentMonth
		let prevClanederYear = (prevCalenderMonth === 12) ? currentYear - 1 : currentYear;

		calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable year' + prevClanederYear + ' month' + prevCalenderMonth + ' date' + i + '"><div><div class="month-date">' + i + '</div></div>'
	}

	// 이번달 1일부터 next date까지 돌림
	for (let i = 1; i <= nextDate; i++) {
		let currentCalenderMonth = currentMonth + 1 == 13 ? 1 : currentMonth + 1;

		if (today.getMonth() == currentMonth && today.getFullYear() == currentYear && fixedDate() == i) {

			// 오늘 날짜 표기
			calendar.innerHTML = calendar.innerHTML + '<div class="day current year' + currentYear + ' month' + currentCalenderMonth + ' date' + i + '"><div><div class="month-date">' + i + '</div><input type="checkbox" class="dateCheckBox" value=0><img src="user/0.img/logo.png"></div></div>'
			todayDate = today.getDate();
			let currentMonthDate = document.querySelectorAll('.dates .current');
			currentMonthDate[todayDate - 1].classList.add('today');
			document.querySelector('.current.today img').style.top = -(document.querySelector('.month-date').getBoundingClientRect().height / 1.5) + 'px';
		} else {
			//오늘 외 날짜
			calendar.innerHTML = calendar.innerHTML + '<div class="day current year' + currentYear + ' month' + currentCalenderMonth + ' date' + i + '"><div><div class="month-date">' + i + '</div><input type="checkbox" class="dateCheckBox" value=0></div></div>'

		}
	}

	// 다음달
	for (let i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
		let nextCalenderMonth = (currentMonth + 2 === 13) ? 1 : currentMonth + 2;
		let prevClanederYear = (nextCalenderMonth == 1) ? (currentYear + 1) : currentYear;

		calendar.innerHTML = calendar.innerHTML + '<div class="day next disable year' + prevClanederYear + ' month' + nextCalenderMonth + ' date' + i + '"><div><div class="month-date">' + i + '</div></div>'
	}

	// 달력에 표시된 전월 현월 다음월 일 수 만큼 배열리스트 할당
	arrayDate = new Array(prevDate - (prevDate - prevDay + 1) + (nextDate + 1) + (7 - nextDay == 7 ? 0 : 7 - nextDay));

	for (let i = 0; i < arrayDate.length; i++) {
		let divYear = calendar.children[i].className.match(/year(\d+)/);
		let divMonth = calendar.children[i].className.match(/month(\d+)/);
		let divDate = calendar.children[i].className.match(/date(\d+)/);

		prevDateLength = prevDate - (prevDate - prevDay + 1);

		// 일별 데이터에 해당 일 추가
		let dateData = {
			date: (divYear && divYear[1]) + '.' + (divMonth && divMonth[1]) + '.' + (divDate && divDate[1]),
			title: '',
			titleLength: ''
		};

		let foldingCnt = '';

		for (let j = 0; j < CompanyScheduleList.length; j++) {
			if (CompanyScheduleList[j].year == divYear[1] && CompanyScheduleList[j].month == divMonth[1]) {
				// 해당월 일정안 date를 split
				let splitDates = CompanyScheduleList[j].date.split(',');
				// split한 데이터의 개수를 돌림	
				for (let k = 0; k < splitDates.length; k++) {
					// 일과 데이터의 값이 일치할경우 객체에 추가
					if (splitDates[k] == (divDate && divDate[1])) {
						dateData.title += CompanyScheduleList[j].no + '.' + CompanyScheduleList[j].title + ',';
						foldingCnt++;
					}
				}
			}
		}

		dateData.titleLength = foldingCnt;
		dateData.title = dateData.title.slice(0, -1);
		arrayDate[i] = dateData;
	}

	writeSchedule();

	console.log(arrayDate)
}


// 일정 추가를 위한 체크
function checkDate(e) {
	if (e.target.value == 0) {
		e.target.closest('.day.current').children[0].style.backgroundColor = '#ACF6B3';
		dateArr[e.target.closest('.day.current').children[0].textContent] = 1;

		e.target.value = 1;
	} else {
		e.target.closest('.day.current').children[0].style.backgroundColor = '';
		dateArr[e.target.closest('.day.current').children[0].textContent] = 0;
		e.target.value = 0;
	}

	document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';

	for (let i = 1; i <= dateArr.length; i++) {
		if (dateArr[i] == 1) {
			document.querySelector('.input-date').value += i + ',';
		}
	}

	// 사용자가 보기위한 출력
	document.querySelector('.input-date').value = document.querySelector('.input-date').value.slice(0, -1);
}


// ++ 건수 펼치기
function expandSchedule(e) {
	console.log(e.target);
	
	if (dateDetailModal == 1) {
		document.querySelector('.detail-schedule').style.visibility = 'hidden';
		dateDetailModal = 0;
	}


	if (dateModal == 0 || dateModal == 1) {
		// 클릭시 마우스 좌표에 모달창 visible
		document.querySelector('.date-modal').style.visibility = 'visible';
		document.querySelector('.date-modal').style.left = e.clientX + 'px';

		modalDivDate = e.target.closest('.current').className.match(/date(\d+)/);

		// 모달 title 해당 달력 연 월 표시
		document.querySelector('.date-modal-title').textContent = arrayDate[parseInt(modalDivDate[1]) + prevDateLength].date;

		// 모달 title 표시
		document.querySelector('.date-modal-content').innerHTML = '';
		let modalTitleData = arrayDate[parseInt(modalDivDate[1]) + prevDateLength].title.split(',');
		for (i = 2; i < modalTitleData.length; i++) {
			if (modalTitleData[0] != '') {
				document.querySelector('.date-modal-content').innerHTML += '<div class="modalTitleData"><input class="detailValue" value="' + (modalTitleData[i].split('.'))[0]
					+ '" type="hidden"><div>' + (modalTitleData[i].split('.'))[1] + '</div><a class="getScheduleDetail">상세보기</a></div>';
			}
		}

		if (e.target.getBoundingClientRect().y > window.innerHeight * 0.8) {
			document.querySelector('.date-modal').style.top = e.clientY - document.querySelector('.date-modal').getBoundingClientRect().height + 'px';
		} else {
			document.querySelector('.date-modal').style.top = e.clientY + 'px';
		}
		dateModal = 1;
	}

	if (dateModal == 1) {
		document.querySelector('.modal-close').addEventListener("click", function() {
			document.querySelector('.date-modal').style.visibility = 'hidden';
			dateModal = 0;
		});
	}
}

// 모달 arrayNumber에 i번째 삽입한 값을 가지고 삭제 할 때 이용하기
// 일정 디테일 모달 출력
function getScheduleDetailModal(e, directDetail) {
	let addLeft = '';
	let dateDivValue = '';
	console.log(e.target);
	
	if (directDetail) {
		addLeft = (e.target.getBoundingClientRect().width / 2);
		dateDivValue = e.target.children[0].value
	} else {
		addLeft = (document.querySelector('.getScheduleDetail').getBoundingClientRect().width / 2);
		dateDivValue = e.target.previousSibling.previousSibling.value;
	}
	
	document.querySelector('.detail-schedule').style.left = e.target.getBoundingClientRect().left + addLeft + 'px'; //여기 // (document.querySelector('.getScheduleDetail').getBoundingClientRect().width / 2) + 'px'; (e.target.getBoundingClientRect().width / 2)

	// 모달 title 해당 일정 표시 설계의 문제가 나타남.
	for (let i = 0; i < CompanyScheduleList.length; i++) {
		if (CompanyScheduleList[i].no == dateDivValue) {
			document.querySelector('.detail-schedule-title').textContent = CompanyScheduleList[i].title;

			selectDetailSchedule = CompanyScheduleList[i];
			selectDetailSchedule.arrayNo = i;
		}
	}

	document.querySelector('.detail-schedule-content').innerHTML = '';

	// 일정
	for (i = 0; i < selectDetailSchedule.date.split(',').length; i++) {
		if (i == 0) {
			document.querySelector('.detail-schedule-content').innerHTML += '<div class="datail-schedule-txt show" style="padding-bottom : 10%"><span>' + selectDetailSchedule.txt + '</span><a onclick="updateAtagClick(this)">수정</a></div>'
			document.querySelector('.detail-schedule-content').innerHTML += '<div class="datail-schedule-txt" style="padding-bottom : 10%"><input value="' + selectDetailSchedule.txt + '"><a onclick="updateTxt(this)" >저장</a><a onclick="updateAtagClick(this)" class="update-txt-cancel">취소</a></div>'
		}

		document.querySelector('.detail-schedule-content').innerHTML += '<div class="datail-schedule-data ' + (selectDetailSchedule.date.split(','))[i] + '"><div>' + selectDetailSchedule.year + '.' + selectDetailSchedule.month + '.' + (selectDetailSchedule.date.split(','))[i] + '</div><a onclick="deleteScheduleDateClick(this)" class="delete-detail-data">삭제</a><a onclick="deleteScheduleDate(this)" class="delete-detail-data">삭제 확인</a><a onclick="deleteScheduleDateClick(this)" class="delete-detail-data">취소</a></div>';

		if (i == selectDetailSchedule.date.split(',').length - 1) {
			document.querySelector('.detail-schedule-content').innerHTML += '<div class="delete-all-detail-data" style="padding-top : 10%"><a>전체삭제</a></div>'
		}
	}


	document.querySelector('.detail-schedule').style.top = e.target.getBoundingClientRect().top - document.querySelector('.detail-schedule').getBoundingClientRect().height + (e.target.getBoundingClientRect().height / 2) + 'px';
	document.querySelector('.detail-schedule').style.visibility = 'visible';
	dateDetailModal = 1;


	for (let i = 0; i < document.querySelectorAll('.datail-schedule-data').length; i++) {
		document.querySelectorAll('.datail-schedule-data')[i].children[1].style.display = 'flex';
		document.querySelectorAll('.datail-schedule-data')[i].children[2].style.display = 'none';
		document.querySelectorAll('.datail-schedule-data')[i].children[3].style.display = 'none';
		document.querySelectorAll('.datail-schedule-data')[i].children[3].style.marginLeft = '-30%';
	}

	if (dateDetailModal == 1) {
		document.querySelector('.detail-schedule-close').addEventListener("click", function() {
			document.querySelector('.detail-schedule').style.visibility = 'hidden';
			dateDetailModal = 0;
		})
	}
}


// 일정 렌더링을 위한 
function writeSchedule() {

	for (let i = 0; i < arrayDate.length; i++) {
		let splitDates = arrayDate[i].title.split(',');

		for (let j = 0; j < splitDates.length; j++) {
			if (splitDates[j].split('.')[1]) {
				if (calendar.children[i] && calendar.children[i].children.length < 4) {
					// 5글자 이상인경우 폴딩
					if (splitDates[j].split('.')[1].length >= 5) {
						calendar.children[i].innerHTML += '<div class="schedule array'+ i +'"><input class="detailValue" value=' + splitDates[j].split('.')[0] + ' type="hidden">' + splitDates[j].split('.')[1].slice(0, -1) + '...' + '</div>';

					}
					else {
						calendar.children[i].innerHTML += '<div class="schedule array'+ i +'"><input class="detailValue" value=' + splitDates[j].split('.')[0] + ' type="hidden">' + splitDates[j].split('.')[1] + '</div>';
					}
				}
			}
		}
		// 3개부터 폴딩
		if (calendar.children[i].children.length > 3) {
			calendar.children[i].children[3].textContent = '++' + (arrayDate[i].titleLength - 2) + '件';
		}
	}
}

// 일정 내용 업데이트 전 클릭
function updateAtagClick(atag) {
	const atagParent = atag.parentNode;
	atagParent.classList.remove('show');


	if (atag.innerText == '수정') {
		atagParent.nextSibling.classList.add('show');
	} else {
		atagParent.previousSibling.classList.add('show');
	}
}

// 일정 내용 업데이트
function updateTxt(atag) {
	let inputUpdateTxt = atag.previousSibling.value;

	let params = {
		txt: inputUpdateTxt,
		no: selectDetailSchedule.no
	}

	fetch('CompanyScheduleTxtUpdate', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		},
		body: new URLSearchParams(params).toString()
	})
		.then(response => response.text())
		.then(data => {
			if (data) {
				selectDetailSchedule.txt = atag.previousSibling.value;

				atag.parentNode.previousSibling.children[0].innerText = selectDetailSchedule.txt;

				atag.parentNode.classList.remove('show');
				atag.parentNode.previousSibling.classList.add('show');
			} else {

			}
		})
}

// 일정 데이터 한개삭제 전 클릭
function deleteScheduleDateClick(atag) {

	if (atag.innerText == '삭제') {
		atag.parentNode.children[1].style.display = 'none';
		atag.parentNode.children[2].style.display = 'flex';
		atag.parentNode.children[3].style.display = 'flex';
	} else {
		atag.parentNode.children[1].style.display = 'flex';
		atag.parentNode.children[2].style.display = 'none';
		atag.parentNode.children[3].style.display = 'none';
	}

}

// 일정 데이터 한개 삭제
function deleteScheduleDate(atag) {
	console.log(selectDetailSchedule.date);
	let remainDate = selectDetailSchedule.date.split(',');

	if (remainDate.indexOf(atag.parentNode.classList[1]) !== -1) {
		remainDate.splice(remainDate.indexOf(atag.parentNode.classList[1]), 1);
	}

	remainDate = remainDate.join(',');
	console.log(remainDate);
	let params = {
		remainDate: remainDate,
		no: selectDetailSchedule.no
	}

	fetch('CompanyScheduleDeleteDate', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
		},
		body: new URLSearchParams(params).toString()
	})
		.then(response => response.text())
		.then(data => {
			if (data) {
				console.log(arrayDate.indexOf('date'));
				
				console.log(atag.parentNode.remove());
				selectDetailSchedule.date = remainDate;
				
				console.log(selectDetailSchedule);
				console.log(CompanyScheduleList);
				
				
				
//				writeSchedule();
			} else {
			}
		})

}

window.onload = function() {

	getAllSchedule();

	toggleSwutch();
};


function toggleSwutch() {
	toggle = document.querySelectorAll(".toggleSwitch");

	let toggleInfo = {
		active: ''
	};

	if (window.location.pathname.includes('CompanyC')) {
		toggle[0].classList.toggle('active');
		toggleInfo.active = true;
		toggleList[0] = toggleInfo;
	}

	for (let i = 0; i < toggle.length; i++) {
		toggle[i].onclick = function() {
			toggle[i].classList.toggle('active');

			if (toggleList[i].active) {

				for (let j = 0; j < arrayDate.length && (7 + j) < document.querySelectorAll('.day').length; j++) {

					// children NodeList를 배열로 변환하여 실시간 업데이트를 피하기
					let childrenArray = Array.from(document.querySelectorAll('.day')[7 + j].children);

					for (let k = 0; k < childrenArray.length; k++) {
						let child = childrenArray[k];

						if (child.className == 'schedule') {
							// 자식 요소를 제거
							child.remove();
						}
					}
				}

				toggleInfo.active = false;
				toggleList[i] = toggleInfo;

			} else {

				toggleInfo.active = true;
				toggleList[i] = toggleInfo;

				writeSchedule();

			}
		};
	}
}


function insertCompanyC() {
	document.querySelector('.company-form').submit();
}