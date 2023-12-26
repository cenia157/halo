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
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/seviceapply.css" />
  </head>
  <body>
   
        <!-- step별 페이지 -->
        <div class="content-calbox-td">
          <div class="content-date-select-box-td">
           <div class="date-sel-text"> 시작일 :<input type="date" id="start-date-sel" class="date-sel" />~
           종료일 :<input type="date" id="end-date-sel" class="date-sel" /></div> <br>
          </div>
          <div class="calendar">
            <div class="header">
              <div class="year-month"></div>
              <div class="nav">
                <button class="nav-btn go-prev" id="prev-button" >
                  &lt;
                </button>
                <button class="year-month"  onclick="goToday()">
                today
                </button>
                <button class="nav-btn go-next" id="next-button">
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
        </div>
        <div class="content-cal-btn-box-td">
        <a href="ServiceC?step=3" class="next-btn">다음으로</a>
        </div>
  </body>
        
</html>
