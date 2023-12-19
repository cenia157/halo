let date = new Date();
let viewYear, viewMonth;

const renderCalendar = () => {
	viewYear = date.getFullYear();
	viewMonth = date.getMonth();

	// year-month 채우기
	document.querySelector(".year-month").textContent = `${viewYear}年 ${viewMonth + 1}月`;

	// 지난 달 마지막 Date, 이번 달 마지막 Date
	const prevLast = new Date(viewYear, viewMonth, 0);
	const thisLast = new Date(viewYear, viewMonth + 1, 0);

	const PLDate = prevLast.getDate();
	const PLDay = prevLast.getDay();

	const TLDate = thisLast.getDate();
	const TLDay = thisLast.getDay();

	// Dates 기본 배열들
	const prevDates = [];
	const thisDates = [...Array(TLDate + 1).keys()].slice(1);
	const nextDates = [];

	// prevDates 계산
	if (PLDay !== 6) {
		for (let i = 0; i < PLDay + 1; i++) {
			prevDates.unshift(PLDate - i);
		}
	}

	// nextDates 계산
	for (let i = 1; i < 7 - TLDay; i++) {
		nextDates.push(i);
	}

	// Dates 합치기
	const dates = prevDates.concat(thisDates, nextDates);

	// Dates 정리
	const firstDateIndex = dates.indexOf(1);
	const lastDateIndex = dates.lastIndexOf(TLDate);
	dates.forEach((day, i) => {
		let condition;
		if (i >= firstDateIndex && i < lastDateIndex + 1) {
			condition = `<div class="date" onclick="setDate(${day})" style="cursor:pointer"><span class="this">${day}</span></div>`;
		} else {
			condition = `<div class="date"><span class="other">${day}</span></div>`;
		}
		dates[i] = condition;
	});
	//		dates[i] = `<div class="date" onclick="setDate(${day})" style="cursor:pointer"><span class="${condition}">${day}</span></div>`;
	//
	//		dates[i] = `<div class="date" style="cursor:pointer"><span class="${condition}">${day}</span></div>`;

	// Dates 그리기
//	document.querySelector(".dates").innerHTML = dates.join("");
//	dates.addEventListener("click", function(e) {
//		 console.log(e.target)
//	});
const datesElement = document.querySelector(".dates");
datesElement.innerHTML = dates.join("");

datesElement.addEventListener("click", function(e) {
  console.log(e.target); // 클릭한 요소(e.target) 출력
});
};




renderCalendar();
let isStartDateSelected = false;

const setDate = (day) => {
	const formattedDay = day < 10 ? `0${day}` : day;
	const selectedDate = `${viewYear}-${viewMonth + 1}-${formattedDay}`;

	const startDateInput = document.getElementById('start-date-sel');
	const endDateInput = document.getElementById('end-date-sel');

	if (!isStartDateSelected) {
		if (startDateInput !== null) {
			startDateInput.value = selectedDate;
			isStartDateSelected = true;

//			// 선택된 시작 날짜에 클래스 추가
//			const selectedDayElement = document.querySelector(`.date span:contains(${day})`);
//			if (selectedDayElement !== null) {
//				selectedDayElement.parentNode.classList.add('start-date');
//			}
//		}
//	} else {
//		if (endDateInput !== null) {
//			const endDate = new Date(selectedDate);
//			const startDate = new Date(startDateInput.value);
//
//			if (endDate >= startDate) {
//				endDateInput.value = selectedDate;
//				isStartDateSelected = false;
//
//				// 선택된 종료 날짜에 클래스 추가
//				const selectedDayElement = document.querySelector(`.date span:contains(${day})`);
//				if (selectedDayElement !== null) {
//					selectedDayElement.parentNode.classList.add('end-date');
//				}
//
//				// 시작일과 종료일 사이의 날짜들에 클래스 추가
//				const allDates = document.querySelectorAll('.date span');
//				allDates.forEach(date => {
//					const dateValue = parseInt(date.textContent);
//					const currentDate = new Date(viewYear, viewMonth, dateValue);
//
//					if (currentDate > startDate && currentDate < endDate) {
//						date.parentNode.classList.add('between-dates');
//					}
//				});
//			} else {
//				alert('종료 날짜는 시작 날짜 이후여야 합니다.');
//			}
//		}
//	}
//};


		}
	} else {
		if (endDateInput !== null) {
			const endDate = new Date(selectedDate);
			const startDate = new Date(startDateInput.value);

			if (endDate >= startDate) {
				endDateInput.value = selectedDate;
				isStartDateSelected = false; // Reset to allow selecting start date again
			} else {
				alert('종료 날짜는 시작 날짜 이후여야 합니다.');
				// 선택된 날짜가 시작 날짜보다 이전인 경우 경고창 또는 다른 처리를 할 수 있습니다.
			}
		}
	}
const selectedDayElement = document.querySelector(`.date:contains(${day})`);
if (selectedDayElement !== null) {
	selectedDayElement.parentNode.classList.add(isStartDateSelected ? 'start-date' : 'end-date');
}

// 시작 날짜와 끝 날짜 사이의 날짜에 회색 스타일 추가
const startDate = new Date(startDateInput.value);
const endDate = new Date(endDateInput.value);

if (startDate && endDate) {
	const allDates = document.querySelectorAll('.date');
	allDates.forEach(date => {
		const dateValue = parseInt(date.textContent);
		const currentDate = new Date(viewYear, viewMonth, dateValue);

		if (currentDate > startDate && currentDate < endDate) {
			date.parentNode.classList.add('between-dates');
		}
	});
}
};
const prevMonth = () => {
	date.setMonth(date.getMonth() - 1);
	renderCalendar();
};
const goToday = () => {
	date = new Date();
	renderCalendar();
}

const nextMonth = () => {
	date.setMonth(date.getMonth() + 1);
	renderCalendar();
};


// 초기에 기본 힌트를 설정
const dateInput = document.getElementById('date-sel');
dateInput.value = ''; // 빈 값으로 초기화
dateInput.addEventListener('focus', function() {
	this.setAttribute('placeholder', '날짜를 선택해주세요');
});
//
//// 날짜 입력 값을 업데이트하는 함수
//const updateDateInput = (event) => {
//	const selectedDay = event.target.textContent.trim();
//	dateInput.value = `${viewYear}-${viewMonth + 1}-${selectedDay}`;
//};
//
//// 'date' 클래스를 가진 모든 요소 가져오기
//const dates = document.querySelectorAll('.date');
//
//// 각 'date' 요소에 클릭 이벤트 리스너 추가하기
//dates.forEach((date) => {
//	date.addEventListener('click', updateDateInput);
//	date.addEventListener('click', function() {
//		const day = parseInt(this.textContent);
//		setDate(day);
//	});
//});

