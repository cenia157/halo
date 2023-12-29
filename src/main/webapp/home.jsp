<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <div class="slogan-tbl">
        <div>
          "더 행복한 내일을 함께하는 요양서비스 ハロー<br />가족처럼
          모시겠습니다."
        </div>
      </div>
	<!-- TODO 서효원 메인페이지 - 주요메뉴 3칸 변경 가능하도록 연결 -->
      <div class="quick-menu-tbl">
        <div class="quick-menu-tr" onclick="location.href=''">채용공고</div>
        <div class="quick-menu-tr" onclick="location.href=''">신청</div>
        <div class="quick-menu-tr" onclick="location.href=''">문의</div>
      </div>
      <div class="main-notice-tbl" id="page1">
      <!--  TODO 서효원 메인페이지에 공지사항 최신순으로 뿌리기 (공지사항 제목, 내용/클릭시 해당 공지 디테일페이지 연결) -->
      <!--  TODO 공지사항 바로가기 버튼 (컨트롤러 연결)-->
        <div class="main-notice-tr1" onclick="location.href=''">공지사항</div>
        <div class="main-notice-tr2">
          <div class="main-notice-td" onclick="location.herf=''">
            <div class="main-notice-td-title"><a href="">●공지제목1</a></div>
            <div class="main-notice-td-txt">공지내용1 asdasd</div>
          </div>
          <div class="main-notice-td" onclick="location.href=''">
            <div class="main-notice-td-title">●공지제목2</div>
            <div class="main-notice-td-txt">공지내용2 asdasd</div>
          </div>
          <div class="main-notice-td" onclick="location.href=''">
            <div class="main-notice-td-title">●공지제목3</div>
            <div class="main-notice-td-txt">공지내용3 asdasd</div>
          </div>
        </div>
      </div>
      <div class="main-map-tbl" id="page2">
        <div class="main-map-tr1">
		<!-- TODO 서효원 구글맵 API 연동된거 미리보기 & 누르면 해당 구글맵으로 이동 -->
          <div class="main-map-box">구글맵 연동~~</div>
        </div>
        <div class="main-map-tr2">
        <!-- TODO 서효원 오시는길 페이지로 이동 -->
          <div class="main-map-td1" onclick="location.href=''">오시는길~</div>
          <div class="main-map-td2">
            <div>●주소<br />大阪府守口市馬場町3-14-6メゾンエミール701号</div>
          </div>
        </div>
      </div>

</body>
</html>