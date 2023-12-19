let date = new Date();
let viewYear, viewMonth;

const renderCalendar = () => {

    viewYear = date.getFullYear();
    viewMonth = date.getMonth();
	const formattedMonth = viewMonth < 10 ? `0${viewMonth}` : viewMonth;
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
        let formattedDay = day < 10 ? `0${day}` : day;
        if (i >= firstDateIndex && i < lastDateIndex + 1) {
            condition = `<div class="date" style="cursor:pointer">
  <span class="this">${formattedDay}</span>
</div>`;
        } else {
            condition = `<div class="date"><span class="other"></span></div>`;
        }
        dates[i] = condition;
    });

    const datesElement = document.querySelector(".dates");
    datesElement.innerHTML = dates.join("");


	datesElement.addEventListener("click", (e) => {
  const clickedElement = e.target;
  if (clickedElement.classList.contains('date')) {
    const formattedDay = clickedElement.textContent.trim();
	console.log(formattedDay);
    setDate(formattedDay, clickedElement);
  }
});

// setDate 초기화 함수
const resetSetDate = () => {
    const dates = document.querySelectorAll('.date');
    dates.forEach(dateElement => {
        dateElement.removeEventListener('click', setDate); // click 이벤트 제거
    });
};




// Add an event listener to the parent container (.dates) for delegation
datesElement.addEventListener("click", (e) => {
    const clickedElement = e.target;
    if (clickedElement.classList.contains('this')) {
        const formattedDay = clickedElement.textContent.trim();
        setDate(formattedDay);
    }
});

const setDate = (day, clickedElement) => {
    const formattedMonth = `${viewMonth + 1}`.padStart(2, '0');
    const formattedDay = `${day}`.padStart(2, '0');
    const selectedDate = `${viewYear}-${formattedMonth}-${formattedDay}`;

    const startDateInput = document.getElementById('start-date-sel');
    const endDateInput = document.getElementById('end-date-sel');

	
	 // Reset function for clearing the colors and values
    const resetColorAndValue = (e) => {
		
		if(e.style.backgroundColor == 'red'){
	        startDateInput.value = '';
	        startDateInput.style.removeProperty('background-color');
	        startDateInput.style.removeProperty('color');
		}else if(e.style.backgroundColor == 'blue'){
	        endDateInput.value = '';
	        endDateInput.style.removeProperty('background-color');
	        endDateInput.style.removeProperty('color');
		}
    	    e.style.backgroundColor = '';
    };
	
	if(!startDateInput.value && !clickedElement.style.backgroundColor){
		startDateInput.value = selectedDate;
	}else if (startDateInput.value && !clickedElement.style.backgroundColor && !endDateInput.value ){
		endDateInput.value = selectedDate;
	}
	
	if(clickedElement.style.backgroundColor){
        resetColorAndValue(clickedElement);
		return;
	}
	
	console.log('start : ' + startDateInput.value);
	console.log('end : ' + endDateInput.value.substring(8,10));
	console.log('selected date : ' + selectedDate);
	console.log(startDateInput.style.backgroundColor);
	console.log(endDateInput.style.backgroundColor);
	console.log('clickedElement :' + clickedElement.textContent);
	
	const clickedText = clickedElement.textContent.trim(); // 클릭된 요소의 텍스트 값

// 텍스트를 숫자로 변환하여 비교
	const clickedNumber = parseInt(clickedText, 10); // 숫자로 변환 (10진수 기준)
    
	if(startDateInput.value && !endDateInput.value){
        startDateInput.style.backgroundColor = 'gray';
		startDateInput.style.color = 'white';
		clickedElement.style.backgroundColor = 'red';
	}else if(endDateInput.value.substring(8,10) === String(clickedNumber).padStart(2, '0')){
        endDateInput.style.backgroundColor = 'gray';
		endDateInput.style.color = 'white';
		clickedElement.style.backgroundColor = 'blue';
		}
};
}
/*
const applyDateStyles = (start, end) => {
	
	
    const dates = document.querySelectorAll('.date');
    dates.forEach(dateElement => {
        const dateContent = dateElement.textContent.trim();
        if (dateContent === start.split('-')[2]) {
            dateElement.classList.add('start-date');
            dateElement.style.backgroundColor = 'red';
        } else if (dateContent === end.split('-')[2]) {
            dateElement.classList.add('end-date');
            dateElement.style.backgroundColor = 'blue';
        }
    });
};
*/






// 이동 버튼 이벤트 리스너 설정
document.getElementById('prev-button').addEventListener('click', () => changeMonth(-1));
document.getElementById('next-button').addEventListener('click', () => changeMonth(1));

// 날짜 이동 함수
const changeMonth = (change) => {
//	document.querySelector("#start-date-sel").value = "";
//	document.querySelector("#end-date-sel").value = "";
	
    date.setMonth(date.getMonth() + change);
    viewYear = date.getFullYear();
    viewMonth = date.getMonth() + 1;
    const formattedMonth = viewMonth < 10 ? `0${viewMonth}` : viewMonth;
    isStartDateSelected = false; // 달 변경 시 선택 상태 초기화
    renderCalendar();
	console.log('~~~~~~~~~~')
    // 이후에 날짜를 렌더링하거나 필요한 처리를 수행할 수 있습니다.
    // ...
};

renderCalendar();


let isStartDateSelected = false;



const resetSelectedDates = (start, end) => {
    const dates = document.querySelectorAll('.date');
    dates.forEach(dateElement => {
        const dateContent = dateElement.textContent.trim();
        if (dateContent === start.split('-')[2]) {
            dateElement.classList.remove('start-date');
            dateElement.style.backgroundColor = '';
        } else if (dateContent === end.split('-')[2]) {
            dateElement.classList.remove('end-date');
            dateElement.style.backgroundColor = '';
        }
    });
};



const goToday = () => {
	renderCalendar();
}



// 초기에 기본 힌트를 설정
const dateInput = document.getElementById('date-sel');
dateInput.value = ''; // 빈 값으로 초기화
dateInput.addEventListener('focus', function() {
  this.setAttribute('placeholder', '날짜를 선택해주세요');
});

// 여기에 추가된 부분입니다.
document.getElementById('prev-button').addEventListener('click', () => changeMonth(-1));
document.getElementById('next-button').addEventListener('click', () => changeMonth(1));

// 초기 렌더링
//renderCalendar();
