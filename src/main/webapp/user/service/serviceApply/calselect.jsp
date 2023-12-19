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
            <input type="date" id="start-date-sel" name="date-sel" /> <br>
            <input type="date" id="end-date-sel" name="date-sel" />
          </div>
          <div class="calendar">
            <div class="header">
              <div class="year-month"></div>
              <div class="nav">
                <button class="nav-btn go-prev" onclick="prevMonth()">
                  &lt;
                </button>
                <button class="year-month" onclick="goToday()">
                today
                </button>
                <button class="nav-btn go-next" onclick="nextMonth()">
                  &gt;
                </button>
              </div>
            </div>
            <div class="main">
              <div class="days">
                <div class="day">日</div>
                <div class="day">月</div>
                <div class="day">火</div>
                <div class="day">水</div>
                <div class="day">木</div>
                <div class="day">金</div>
                <div class="day">土</div>
              </div>
              <div class="dates"></div>
            </div>
          </div>
          <script src="${pageContext.request.contextPath}/user/service/serviceApply/0.js/cal.js">
          </script>
        </div>
        <div class="content-cal-btn-box-td">
        <a href="ServiceC?step=3" class="next-btn">다음으로</a>
        </div>
  </body>
</html>
