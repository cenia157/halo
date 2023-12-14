<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/calselect.css" />
  </head>
  <body>
   
        <!-- step별 페이지 -->
        <div class="content-calbox-td">
          <div class="content-date-select-box-td">
            <label for="date">날짜 선택:</label>
            <input type="date" id="date" name="date" />
          </div>
          <div class="calendar">
            <div class="header">
              <div class="year-month"></div>
              <div class="nav">
                <button class="nav-btn go-prev" onclick="prevMonth()">
                  &lt;
                </button>
                <button class="nav-btn go-today" onclick="goToday()">
                  Today
                </button>
                <button class="nav-btn go-next" onclick="nextMonth()">
                  &gt;
                </button>
              </div>
            </div>
            <div class="main">
              <div class="days">
                <div class="day">일</div>
                <div class="day">월</div>
                <div class="day">화</div>
                <div class="day">수</div>
                <div class="day">목</div>
                <div class="day">금</div>
                <div class="day">토</div>
              </div>
              <div class="dates"></div>
            </div>
          </div>
          <script src="${pageContext.request.contextPath}/user/service/serviceApply/0.js/cal.js">
          </script>
        </div>
        <div class="content-cal-btn-box-td">
          <button id="next-btn">다음으로</button>
        </div>
  </body>
</html>
