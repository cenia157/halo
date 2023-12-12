<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="calendar.css">
<style>
    /* 추가한 CSS */
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .calendar {
      font-family: Arial, sans-serif;
      border: 1px solid #ccc;
      width: 350px; /* 달력 크기 조정 */
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      background-color: #f9f9f9;
    }

    .month {
      text-align: center;
      margin-bottom: 15px;
      font-size: 20px; /* 월 텍스트 크기 조정 */
    }

    .weekdays {
      display: flex;
      justify-content: space-between;
    }

    .weekdays div {
      width: calc(100% / 7);
      text-align: center;
      font-weight: bold; /* 요일 텍스트 굵게 */
      padding: 5px 0;
    }

    .days {
      display: flex;
      flex-wrap: wrap;
    }

    .days div {
      width: calc(100% / 7);
      text-align: center;
      border: 1px solid #ccc;
      padding: 10px 0; /* 일자 간격 및 패딩 조정 */
      margin-bottom: 10px;
      font-size: 16px; /* 일자 텍스트 크기 조정 */
    }
  </style>
</head>
<body>
  <div class="calendar">
    <div class="month">
      <span id="currentMonthYear"></span>
    </div>
    <div class="weekdays">
      <div>Sun</div>
      <div>Mon</div>
      <div>Tue</div>
      <div>Wed</div>
      <div>Thu</div>
      <div>Fri</div>
      <div>Sat</div>
    </div>
    <div class="days" id="daysContainer"></div>
  </div>

  <script>
    // JavaScript 코드 (동일)
    const currentDate = new Date();
    const monthYearElement = document.getElementById('currentMonthYear');
    const daysContainer = document.getElementById('daysContainer');

    function generateCalendar(year, month) {
      const firstDay = new Date(year, month, 1);
      const lastDay = new Date(year, month + 1, 0);
      
      monthYearElement.textContent = firstDay.toLocaleString('default', { month: 'long' }) + ' ' + year;

      daysContainer.innerHTML = '';

      for (let i = 1; i <= lastDay.getDate(); i++) {
        const dateElement = document.createElement('div');
        dateElement.textContent = i;
        dateElement.addEventListener('click', function() {
          console.log(`Selected date: ${year}-${month + 1}-${i}`);
          // 여기에 선택된 날짜에 대한 추가적인 처리를 할 수 있습니다.
          // 예: 서버에 선택된 날짜 전송, 예약 처리 등
        });
        daysContainer.appendChild(dateElement);
      }
    }

    generateCalendar(currentDate.getFullYear(), currentDate.getMonth());
  </script>
</body>
</html>