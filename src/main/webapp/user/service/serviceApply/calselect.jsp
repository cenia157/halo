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
    <link rel="stylesheet" href="0.css/calselect.css" />
  </head>
  <body>
    <div class="content-box-tr">
      <div class="content-box-td">
        <div class="content-tabbox-td">
          <div class="content-tab1-td tab1-pos">서비스 안내</div>
          <div class="content-tab2-td tab2-pos">서비스 신청</div>
        </div>
        <div class="content-subtab-td">
          <img src="0.img/home.png" alt="" /> 서비스 > 서비스신청
        </div>
        <div class="content-procedure-box-td">
          <div class="content-title-box-td">서비스 신청 순서</div>
          <ul class="content-procedure-box-ul">
            <li class="content-box-li">
              <div class="content-service-step-box-td">Step1.</div>
              <div class="content-service-txt-box-td">
                신청할 서비스 선택하기
              </div>
            </li>
            <li class="content-box-li-pagepos">
              <div class="content-service-step-box-td">Step2.</div>
              <div class="content-service-txt-box-td">
                이용할 ‘기간’ 캘린더에서 선택하기
              </div>
            </li>
            <li class="content-box-li">
              <div class="content-service-step-box-td">Step3.</div>
              <div class="content-service-txt-box-td">이용 ‘시간’ 선택하기</div>
            </li>
            <li class="content-box-li">
              <div class="content-service-step-box-td">Step4.</div>
              <div class="content-service-txt-box-td">정보 입력하기</div>
            </li>
            <li class="content-box-li">
              <div class="content-service-step-box-td">Step5.</div>
              <div class="content-service-txt-box-td">이용약관 동의</div>
            </li>
            <li class="content-box-li">
              <div class="content-service-step-box-td">Step6.</div>
              <div class="content-service-txt-box-td">신청 완료</div>
            </li>
          </ul>
        </div>
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
          <script src="0.js/cal.js"></script>
        </div>
        <div class="content-cal-btn-box-td">
          <button id="next-btn">다음으로</button>
        </div>
      </div>
    </div>
  </body>
</html>
