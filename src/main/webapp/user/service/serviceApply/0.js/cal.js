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

	const datesElement = document.querySelector(".dates");
	datesElement.innerHTML = dates.join("");

datesElement.addEventListener("click", function (e) {
        const clickedElement = e.target;
        const selectedDate = clickedElement.dataset.date;

        const startDateInput = document.getElementById('start-date-sel');
        const endDateInput = document.getElementById('end-date-sel');

        // 색상 초기화 함수
        const resetColor = () => {
            clickedElement.style.backgroundColor = "";
            startDateInput.style.backgroundColor = "";
            endDateInput.style.backgroundColor = "";
        };

        // 시작일과 종료일을 선택했을 때의 동작
        if (startDateInput !== null && startDateInput.value === selectedDate) {
            resetColor(); // 색상 초기화
            clickedElement.style.backgroundColor = "red"; // 시작일을 빨간색으로 변경
            startDateInput.style.backgroundColor = "red"; // 선택된 시작일 input도 빨간색으로 변경
        } else if (endDateInput !== null && endDateInput.value === selectedDate) {
            resetColor(); // 색상 초기화
            clickedElement.style.backgroundColor = "blue"; // 종료일을 파란색으로 변경
            endDateInput.style.backgroundColor = "blue"; // 선택된 종료일 input도 파란색으로 변경
        } else {
            resetColor(); // 선택 해제 시 색상 초기화
        }
    });
};




renderCalendar();
let isStartDateSelected = false;

const setDate = (day) => {
    const formattedDay = day < 10 ? `0${day}` : day;
    const selectedDate = `${viewYear}-${viewMonth + 1}-${formattedDay}`;

    const startDateInput = document.getElementById('start-date-sel');
    const endDateInput = document.getElementById('end-date-sel');

    const selectedStartDate = startDateInput.value;
    const selectedEndDate = endDateInput.value;

    if (!isStartDateSelected) {
        startDateInput.value = selectedDate;
        endDateInput.value = '';
        isStartDateSelected = true;

        removeSelectedDateStyle(selectedEndDate);
    } else {
        const endDate = new Date(selectedDate);
        const startDate = new Date(selectedStartDate);

        if (endDate >= startDate) {
            endDateInput.value = selectedDate;
            isStartDateSelected = false;

            removeSelectedDateStyle(selectedStartDate);
        } else {
            alert('종료 날짜는 시작 날짜 이후여야 합니다.');
            // 선택된 날짜가 시작 날짜보다 이전인 경우 처리
        }
    }

    const dates = document.querySelectorAll('.date');
    dates.forEach(dateElement => {
        const dateContent = dateElement.textContent.trim();
        if (dateContent === String(day)) {
            dateElement.classList.remove('start-date', 'end-date');
            if (dateContent === startDateInput.value.split('-')[2]) {
                dateElement.classList.add('start-date');
                dateElement.style.backgroundColor = 'red';
            } else if (dateContent === endDateInput.value.split('-')[2]) {
                dateElement.classList.add('end-date');
                dateElement.style.backgroundColor = 'blue';
            } else {
                dateElement.style.backgroundColor = '';
            }
        }
    });

    const startDate = new Date(startDateInput.value);
    const endDate = new Date(endDateInput.value);

    if (startDate && endDate) {
        const allDates = document.querySelectorAll('.date');
        allDates.forEach(date => {
            const dateValue = parseInt(date.textContent);
            const currentDate = new Date(viewYear, viewMonth, dateValue);

            if (currentDate > startDate && currentDate < endDate) {
                date.parentNode.classList.add('between-dates');
            } else {
                date.parentNode.classList.remove('between-dates');
            }
        });
    }
};

const removeSelectedDateStyle = (date) => {
    const dates = document.querySelectorAll('.date');
    dates.forEach(dateElement => {
        const dateContent = dateElement.textContent.trim();
        if (dateContent === date.split('-')[2]) {
            dateElement.classList.remove('start-date', 'end-date');
            dateElement.style.backgroundColor = '';
        }
    });
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

