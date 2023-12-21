function fixedDate() {
	let date = new Date(); // 현재 날짜(로컬 기준) 가져오기
	let utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
	let kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
	let today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

	return today.getDate();
}

/////////////////////////////////////////날짜/////////////////////////////////////////////
			// 날짜 담을 배열 생성
			let dateArr = new Array(32).fill(0);

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


window.onload = function() {
	let CompanyScheduleList = new Array;
	
	// 캘린더 렌더링
			renderCalender(thisMonth);

	// 전체 회사 일정
	fetch('CompanyScheduleList')
		.then(response => response.json())
		.then(data => {
/////////////////////////////////////////일정조회/////////////////////////////////////////////
			// 여기서 데이터 처리
			console.log(data);
			// javascript배열에 ajax로 가져온 배열 입력
			CompanyScheduleList = CompanyScheduleList.concat(data);

			// 객체배열의 0번째
			//			console.log(CompanyScheduleList[0]);

			//객체배열의 길이
			//			console.log(CompanyScheduleList.length);

			//객체배열 i번째 있는 date
			//			CompanyScheduleList.forEach(schedule => {
			//				console.log(schedule.date);
			//			})

			//			console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes('2023年 12月')));
			// '2023년 12월' 이 포함된 배열의 개수
			//			let filteredArray = CompanyScheduleList.filter(schedule => schedule.yearmonth.includes('2023年 12月'));



			// 전년도로 이동
			document.querySelector('.go-year-prev').addEventListener('click', function() {
				thisMonth = new Date(currentYear, currentMonth - 12, 12);
				renderCalender(thisMonth);
				document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + thisMonth.getMonth() + 1 + '月 ';
				dateArr = new Array(32).fill(0);
				let arrayThisMonth = document.querySelector('.input-date').value.slice(0, -1);
				console.log(arrayThisMonth);
				console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(arrayThisMonth)));
			});

			// 이전달로 이동
			document.querySelector('.go-prev').addEventListener('click', function() {
				thisMonth = new Date(currentYear, currentMonth - 1, 1);
				renderCalender(thisMonth);
				document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';
				dateArr = new Array(32).fill(0);
				let arrayThisMonth = document.querySelector('.input-date').value.slice(0, -1);
				console.log(arrayThisMonth);
				console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(arrayThisMonth)));
			});

			// 다음달로 이동
			document.querySelector('.go-next').addEventListener('click', function() {
				thisMonth = new Date(currentYear, currentMonth + 1, 1);
				renderCalender(thisMonth);
				document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';
				dateArr = new Array(32).fill(0);
				let arrayThisMonth = document.querySelector('.input-date').value.slice(0, -1);
				console.log(arrayThisMonth);
				console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(arrayThisMonth)));
			});

			// 다음해로 이동
			document.querySelector('.go-year-next').addEventListener('click', function() {
				thisMonth = new Date(currentYear, currentMonth + 12, 12);
				renderCalender(thisMonth);
				document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';
				dateArr = new Array(32).fill(0);
				let arrayThisMonth = document.querySelector('.input-date').value.slice(0, -1);
				console.log(arrayThisMonth);
				console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(arrayThisMonth)));
			});


			// 사용자가 보기 위한 초기값
			document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';

			// 해당 월의 배열 출력 초기값
			let arrayThisMonth = document.querySelector('.input-date').value.slice(0, -1);
			console.log(arrayThisMonth);
			console.log(CompanyScheduleList.filter(schedule => schedule.yearmonth.includes(arrayThisMonth)));



			//클릭
			calendar.addEventListener("click", function(e) {
				if (e.target.className.includes("current")) {
					if (!e.target.style.backgroundColor) {
						e.target.style.backgroundColor = '#ACF6B3';

						dateArr[e.target.textContent] = 1;
					} else {
						e.target.style.backgroundColor = '';

						dateArr[e.target.textContent] = 0;
					}

				}
				document.querySelector('.input-date').value = thisMonth.getFullYear() + '年 ' + (thisMonth.getMonth() + 1) + '月 ';
				selectDate = "";
				for (let i = 1; i <= dateArr.length; i++) {
					if (dateArr[i] == 1) {
						document.querySelector('.input-date').value += i + ',';

					}
				}

				// 사용자가 보기위한 출력
				document.querySelector('.input-date').value = document.querySelector('.input-date').value.slice(0, -1);

			});


			//스위치 토글
			let toggleList = document.querySelectorAll(".toggleSwitch");

			toggleList.forEach(function($toggle) {
				$toggle.onclick = function() {
					$toggle.classList.toggle('active');
				}
			});



		})
		.catch(error => {
			console.error('데이터를 가져오는 중 오류 발생:', error);
		});

};

function renderCalender(thisMonth) {

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
				calendar = document.querySelector('.dates')
				calendar.innerHTML = '';

				// 지난달
				for (let i = prevDate - prevDay + 1; i <= prevDate; i++) {
					calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
				}

				// 이번달
				for (let i = 1; i <= nextDate; i++) {

					if (today.getMonth() == currentMonth && today.getFullYear() == currentYear && fixedDate() == i) {
						// 오늘 날짜 표기
						calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '<img src="user/0.img/logo.png">' + '</div>'
						todayDate = today.getDate();
						let currentMonthDate = document.querySelectorAll('.dates .current');
						currentMonthDate[todayDate - 1].classList.add('today');
					} else {
						// 오늘 외 날짜
						calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
					}
				}

				// 다음달
				for (let i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
					calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
				}

			}


function insertCompanyC() {
	document.querySelector('.company-form').submit();
}