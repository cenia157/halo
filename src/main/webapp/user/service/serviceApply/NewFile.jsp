<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="calendar.css">
<style>
    /* �߰��� CSS */
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
      width: 350px; /* �޷� ũ�� ���� */
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      background-color: #f9f9f9;
    }

    .month {
      text-align: center;
      margin-bottom: 15px;
      font-size: 20px; /* �� �ؽ�Ʈ ũ�� ���� */
    }

    .weekdays {
      display: flex;
      justify-content: space-between;
    }

    .weekdays div {
      width: calc(100% / 7);
      text-align: center;
      font-weight: bold; /* ���� �ؽ�Ʈ ���� */
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
      padding: 10px 0; /* ���� ���� �� �е� ���� */
      margin-bottom: 10px;
      font-size: 16px; /* ���� �ؽ�Ʈ ũ�� ���� */
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
    // JavaScript �ڵ� (����)
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
          // ���⿡ ���õ� ��¥�� ���� �߰����� ó���� �� �� �ֽ��ϴ�.
          // ��: ������ ���õ� ��¥ ����, ���� ó�� ��
        });
        daysContainer.appendChild(dateElement);
      }
    }

    generateCalendar(currentDate.getFullYear(), currentDate.getMonth());
  </script>
</body>
</html>