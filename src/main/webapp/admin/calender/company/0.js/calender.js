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

// 일별 일정 배열
let arrayDate = new Array(32);

// 연, 월 버튼 초기값
let clickButton = "";

// 일정 상세 모달창 초기값
let dateModal = 0;


function getAllSchedule() {

	// 전체 회사 일정 ajax 호출
	fetch('CompanyScheduleList')
		.then(response => response.json())
		.then(data => {

			// javascript배열에 ajax로 가져온 배열 입력
			CompanyScheduleList = CompanyScheduleList.concat(data);

			// 전체데이터 출력
			console.log(CompanyScheduleList);

			// 클릭버튼 초기값

			// 페이지 입장 시 출력
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
			});

			// 날짜클릭
			calendar.addEventListener("click", function(e) {
				if (e.target.classList.contains('month-date')) {
					if (dateModal == 0 || dateModal == 1) {
						// 클릭시 마우스 좌표에 모달창 visible
						document.querySelector('.date-modal').style.left = e.clientX + 'px';
						document.querySelector('.date-modal').style.top = e.clientY + 'px';
						document.querySelector('.date-modal').style.visibility = 'visible';

						// 모달 title 해당 달력 연 월 표시
						document.querySelector('.date-modal-title').textContent = document.querySelector('.year-month').textContent + '.' + e.target.textContent;
						dateModal = 1;

						let modalTitleData = arrayDate[e.target.closest('.day.current').children[0].textContent].title.split(',');
						document.querySelector('.date-modal-content').innerHTML = '';

						for (i = 0; i < arrayDate[e.target.closest('.day.current').children[0].textContent].stockOfTitle; i++) {
							document.querySelector('.date-modal-content').innerHTML += '<div>' + modalTitleData[i] + '</div>';
						}
					}
					if (dateModal == 1) {
						document.querySelector('.modal-close').addEventListener("click", function() {
							document.querySelector('.date-modal').style.visibility = 'hidden';
							dateModal = 0;
						});
					}
				}
			})

			//스위치 토글
			let toggleList = document.querySelectorAll(".toggleSwitch");

			toggleList.forEach(function($toggle) {
				$toggle.onclick = function() {
					$toggle.classList.toggle('active');
				}
			});
			renderMonth(CompanyScheduleList, clickButton);
		})

		.catch(error => {
			console.error('데이터를 가져오는 중 오류 발생:', error);
		});
}


// 초기 및 클릭 렌더링
function renderMonth(CompanyScheduleList, clickButton) {
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
	let thisMonthValue = document.querySelector('.input-date').value.slice(0, -1);
	console.log(thisMonthValue);
	console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(thisMonthValue)));

	let arrayThisMonth = CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(thisMonthValue));
	console.log(arrayThisMonth.length);

	renderCalender(thisMonth, arrayThisMonth);
}


function renderCalender(thisMonth, arrayThisMonth) {

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

	// console.log(prevDate, prevDay, nextDate, nextDay);

	// 현재 월 표기
	document.querySelector('.year-month').textContent = currentYear + '.' + (currentMonth + 1);

	// 렌더링 html 요소 생성
	calendar = document.querySelector('.dates');
	calendar.innerHTML = '';

	// 지난달
	for (let i = prevDate - prevDay + 1; i <= prevDate; i++) {
		calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
	}

	// 이번달 1일부터 next date까지 돌림
	for (let i = 1; i <= nextDate; i++) {

		if (today.getMonth() == currentMonth && today.getFullYear() == currentYear && fixedDate() == i) {

			// 오늘 날짜 표기
			calendar.innerHTML = calendar.innerHTML + '<div class="day current date' + i + '"><div><div>' + i + '<div><input type="checkbox" class="dateCheckBox" value=0></div><img src="user/0.img/logo.png">' + '</div>'
			todayDate = today.getDate();
			let currentMonthDate = document.querySelectorAll('.dates .current');
			currentMonthDate[todayDate - 1].classList.add('today');
		} else {
			//오늘 외 날짜
			calendar.innerHTML = calendar.innerHTML + '<div class="day current date' + i + '"><div><div class="month-date">' + i + '</div><input type="checkbox" class="dateCheckBox" value=0></div></div>'

		}
	}

	// 다음달
	for (let i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
		calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
	}

	// 렌더링전 월 배열 데이터 있는지 확인
	if (arrayThisMonth.length != 0) {
		console.log('월 배열 데이터값 있음')

		for (let i = 1; i < nextDate; i++) {
			// 일별 데이터에 해당 일 추가
			let dateData = {
				date: i,
				title: '',
				stockOfTitle: ''
			};

			let foldingCnt = '';
			for (let j = 0; j < arrayThisMonth.length; j++) {
				// 해당월 일정안 date를 split
				let splitDates = arrayThisMonth[j].date.split(',');

				// split한 데이터의 개수를 돌림
				for (let k = 0; k < splitDates.length; k++) {
					// 1~nextDate까지의 일과 데이터의 값이 일치할경우 객체에 추가
					if (parseInt(splitDates[k]) === i) {
						dateData.title += arrayThisMonth[j].title + ',';
						foldingCnt++;
						if (document.querySelector('.dates .date' + i).children.length < 4) {
							if (arrayThisMonth[j].title.length >= 5) {
								document.querySelector('.dates .date' + i).innerHTML += '<div class="schedule">' + arrayThisMonth[j].title.slice(0, 5) + '...' + '</div>';
							} else {
								document.querySelector('.dates .date' + i).innerHTML += '<div class="schedule">' + arrayThisMonth[j].title + '</div>';
							}
						}
					}
				}
			}

			// 3개부터 폴딩
			if (document.querySelector('.dates .date' + i).children.length > 3) {
				document.querySelector('.dates .date' + i).children[3].textContent = '++' + (foldingCnt - 2) + '件';
			}
			dateData.stockOfTitle = foldingCnt;
			dateData.title = dateData.title.slice(0, -1);
			arrayDate[i] = dateData;
		}

		console.log(arrayDate);

	} else {
		console.log('월 배열 데이터값 없음')
	}
}


window.onload = function() {
	getAllSchedule();
};


function insertCompanyC() {
	document.querySelector('.company-form').submit();
}