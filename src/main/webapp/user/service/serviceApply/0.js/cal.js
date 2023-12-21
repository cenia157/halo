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
            condition = `<div class="date" id="${viewYear}-${formattedMonth+1}-${formattedDay}" style="cursor:pointer">
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
    }
});


/////////////////테스트중 ///////////////////////////////////






    const startDateInput = document.getElementById('start-date-sel');
    const endDateInput = document.getElementById('end-date-sel');
let startOldDate = null; 
let endOldDate = null; 

    // 시작일 input에서 날짜 선택
startDateInput.addEventListener('change', function(select) {
	
    const selectedDate = event.target.value; // 선택한 날짜
    console.log('선택된 시작 날짜:', selectedDate);
	const startDateCal = document.getElementById(selectedDate);
    console.log('달력 시작 날짜:', startDateCal.value);
	const old = document.getElementById(startOldDate);
	
    console.log('종료일 날짜:', endDateInput.value);
	
	if(endDateInput.value && endDateInput.value < selectedDate){
		alert('종료일 이후 날짜는 선택할 수 없습니다.')
		startDateInput.value = '';
		return;
		
	}else if(endDateInput.value && endDateInput.value == selectedDate ){
		
	startDateInput.style.backgroundColor = 'gray';
	startDateInput.style.color = 'white';
	startDateCal.style.backgroundColor = 'purple';
	startDateCal.style.color = 'white';
	startDateCal.querySelector('.this').innerHTML = startDateCal.querySelector('.this').innerHTML.replace('<br>종료일', '');
	startDateCal.querySelector('.this').insertAdjacentHTML('beforeend', '<br>당일');
	startOldDate = selectedDate;
		

	} else if(startOldDate){
	    startDateInput.style.removeProperty('background-color');
	    startDateInput.style.removeProperty('color');
    	old.style.backgroundColor = '';
    	old.style.color = '';
    	old.querySelector('.this').innerHTML = old.querySelector('.this').innerHTML.replace('<br>시작일', '');
		
	}else {startDateInput.style.backgroundColor = 'gray';
	startDateInput.style.color = 'white';
	startDateCal.style.backgroundColor = 'red';
	startDateCal.style.color = 'white';
	startDateCal.querySelector('.this').insertAdjacentHTML('beforeend', '<br>시작일');
	startOldDate = selectedDate;
	}
});

    // 종료일 input에서 날짜 선택
endDateInput.addEventListener('change', function(event) {
	
    const selectedDate = event.target.value; // 선택한 날짜
    console.log('선택된 종료 날짜:', selectedDate);
	const endDateCal = document.getElementById(selectedDate);
    console.log('달력 종료 날짜:', endDateCal.value);
	const old = document.getElementById(endOldDate);
	
    console.log('시작일 날짜:', startDateInput.value);

	if(startDateInput.value && startDateInput.value > selectedDate ){
		alert('시작일 이전 날짜는 선택할 수 없습니다.')
		endDateInput.value = '';
		return;
	} else if(startDateInput.value && startDateInput.value == selectedDate){
		endDateInput.style.backgroundColor = 'gray';
		endDateInput.style.color = 'white';
		endDateCal.style.backgroundColor = 'purple';
		endDateCal.style.color = 'white';
		endDateCal.querySelector('.this').innerHTML = endDateCal.querySelector('.this').innerHTML.replace('<br>시작일', '');
		endDateCal.querySelector('.this').insertAdjacentHTML('beforeend', '<br>당일');
		endOldDate = selectedDate;
		
	}else if (endOldDate){
		endDateInput.style.removeProperty('background-color');
		endDateInput.style.removeProperty('color');
   		old.style.backgroundColor = '';
    	old.style.color = '';
    	old.querySelector('.this').innerHTML = old.querySelector('.this').innerHTML.replace('<br>종료일', '');
	}else{
		

		endDateInput.style.backgroundColor = 'gray';
		endDateInput.style.color = 'white';
		endDateCal.style.backgroundColor = 'blue';
		endDateCal.style.color = 'white';
		endDateCal.querySelector('.this').insertAdjacentHTML('beforeend', '<br>종료일');
		endOldDate = selectedDate;

	}
});



/////////////////테스트중 ///////////////////////////////////

const setDate = (day, clickedElement) => {
    const formattedMonth = `${viewMonth + 1}`.padStart(2, '0');
    const formattedDay = `${day}`.padStart(2, '0');
    const selectedDate = `${viewYear}-${formattedMonth}-${formattedDay}`;

    const startDateInput = document.getElementById('start-date-sel');
    const endDateInput = document.getElementById('end-date-sel');

	const startOld = document.getElementById(startOldDate);
	const endOld = document.getElementById(endOldDate);




	if (startDateInput.value && selectedDate < startDateInput.value) {
        return; // 선택된 날짜가 시작 날짜보다 이전이면 함수 실행을 멈춥니다.
    }

	
	 // Reset function for clearing the colors and values
    const resetColorAndValue = (e) => {
		
//			if(endDateInput.value){
//				alert('종료일 선택 해제 해주세요');
//				return;
//			}
		if(e.style.backgroundColor == 'red' && !endDateInput.value ){
    		
			e.querySelector('.this').innerHTML = e.querySelector('.this').innerHTML.replace('<br>시작일', '');
			endDateInput.style.backgroundColor = 'gray';
			endDateInput.style.color = 'white';
			e.style.backgroundColor = 'purple';
			e.style.color = 'white';
			e.querySelector('.this').innerHTML += '<br>당일';
			console.log('선택 값은????' + e.value);
			endDateInput.value = e.id;
		
		}else if(e.style.backgroundColor == 'purple'){
	        startDateInput.value = '';
	        startDateInput.style.removeProperty('background-color');
	        startDateInput.style.removeProperty('color');
	        endDateInput.value = '';
	        endDateInput.style.removeProperty('background-color');
	        endDateInput.style.removeProperty('color');
    	    e.style.backgroundColor = '';
    	    e.style.color = '';
    		e.querySelector('.this').innerHTML = e.querySelector('.this').innerHTML.replace('<br>당일', '');

		}else if(e.style.backgroundColor == 'blue'){
	        endDateInput.value = '';
	        endDateInput.style.removeProperty('background-color');
	        endDateInput.style.removeProperty('color');
    	    e.style.backgroundColor = '';
    	    e.style.color = '';
    		e.querySelector('.this').innerHTML = e.querySelector('.this').innerHTML.replace('<br>종료일', '');
		} 
		return;
    };

	
	if(!startDateInput.value && !clickedElement.style.backgroundColor){
		startDateInput.value = selectedDate;
	}else if (startDateInput.value && !clickedElement.style.backgroundColor && !endOldDate ){
		endDateInput.value = selectedDate;
//		let startOldDate = null; 
//let endOldDate = null; 
		endOldDate = selectedDate;
		console.log('왔더?' + selectedDate);
	} else if(startDateInput.value && !clickedElement.style.backgroundColor && endOldDate ){
		resetColorAndValue(endOldDate);
		endDateInput.value = selectedDate;
		endOldDate = endDateInput.value;
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
		clickedElement.style.color = 'white';
		clickedElement.querySelector('.this').innerHTML += '<br>시작일';
//	}else if(endDateInput.value === clickedElement.id){
	}else if(endDateInput.value.substring(8,10) === String(clickedNumber).padStart(2, '0')){
		console.log('뭘까요?1' + clickedElement.id);
		console.log('뭘까요?2' + endDateInput.value);
        endDateInput.style.backgroundColor = 'gray';
		endDateInput.style.color = 'white';
		clickedElement.style.backgroundColor = 'blue';
		clickedElement.style.color = 'white';
		clickedElement.querySelector('.this').innerHTML += '<br>종료일';
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
