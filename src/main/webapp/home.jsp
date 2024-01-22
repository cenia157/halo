<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="user/introduce/announcement/0.css/announcement_contentPage.css" />
<script
	src="user/introduce/announcement/0.js/announcement_contentPage_modal.js"></script>
<script
	src="user/introduce/announcement/0.js/announcement_contentPage_ajax.js"></script>
<script
	src="admin/_js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="slogan-tbl">
		<div>
			"더 행복한 내일을 함께하는 요양서비스 ハロー<br />가족처럼 모시겠습니다."
		</div>
	</div>
	<!-- TODO 서효원 메인페이지 - 주요메뉴 3칸 변경 가능하도록 연결 -->
	<div class="quick-menu-tbl">
		<c:forEach var="bannerInform" items="${topBanners}">
			<div class="quick-menu-tr btn-pointer"
				onclick="location.href='${bannerInform.b_url}'">${bannerInform.b_m_text }</div>
		</c:forEach>
	</div>
	<div class="main-notice-tbl" id="page1">
		<!--  TODO 서효원 메인페이지에 공지사항 최신순으로 3줄(공지사항 제목, 내용/클릭시 해당 공지 디테일페이지 연결) -->
		<div class="main-notice-tr1 btn-pointer"
			onclick="location.href='Announced_C'">공지사항</div>
		<div class="main-notice-tr2">
		
			<c:forEach var="announcement" items="${announcements}">
			<div class="main-notice-td btn-pointer ancTitleDiv" data-anseq="${announcement.an_seq }">
				<div class="main-notice-td-title">
					<span>&nbsp;●${announcement.an_title} </span>
				</div>
				<div class="main-notice-td-txt textOverflow ck-content">${announcement.an_content}</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="main-map-tbl" id="page2">
		<div class="main-map-tr1">
			<!-- TODO 서효원 구글맵 API 연동된거 미리보기 & 누르면 해당 구글맵으로 이동 -->
			<div class="main-map-box">
				<iframe 
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d243.7276948376925!2d135.56083939750414!3d34.72545567378211!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6000e1803b163eff%3A0x63157d2c53eb5a5a!2z44Oh44K-44OzIOOCqOODn-ODvOODqw!5e0!3m2!1sko!2skr!4v1705184709627!5m2!1sko!2skr"
					width="100%" height="100%" style="border: 0;" allowfullscreen=""
					loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
		</div>
		<div class="main-map-tr2">
			<!-- TODO 서효원 오시는길 페이지로 이동 -->
			<div class="main-map-td1 btn-pointer"
				onclick="location.href='HC?link=2'">오시는길~</div>
			<div class="main-map-td2">
				<div>
					●주소<br />大阪府守口市馬場町3-14-6メゾンエミール701号
				</div>
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		<div class="modal-content">
			<!-- 여기서 소스 활용 시작 -->
			<!-- 문의글 게시판 (디테일) -->
			<div class="qd-content-box-td1-1">
				<span> お知らせ</span>
			</div>
			<div class="qd-content-box-td1-2">
				<div class="qd-content-box-td1-2-1">タイトル</div>
				<div class="qd-content-box-td1-2-2" id="modalTitle">일정공지</div>
			</div>

			<div class="qd-content-box-td1-3">
				<div class="qd-content-box-td1-3-1">投稿者</div>
				<div class="qd-content-box-td1-3-2" id="modalWriter">오오데아키코</div>
			</div>

			<div class="qd-content-box-td1-4">
				<div class="qd-content-box-td1-4-content">
					<span class="qd-content-box-td1-4-1">投稿日&nbsp:&nbsp</span> <span
						class="qd-content-box-td1-4-2" id="modalregDate">23-12-15</span>
				</div>
			</div>

			<!-- 본문 예시 -->
			<div class="qd-content-box-td2-1">
				<div class="qd-content-box-td2-1-content ck-content" id="modalContent">
					안녕하세요, 운영자입니다. <br /> 일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br />
					평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이 가능한지 궁금합니다. <br /> 안녕하세요,
					운영자입니다. <br /> 일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br /> 평일 중 2일과
					주말 1일을 정기적으로 한 달 동안 이용하는 것이 가능한지 궁금합니다. <br /> 안녕하세요, 운영자입니다. <br />
					일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br /> 평일 중 2일과 주말 1일을 정기적으로 한
					달 동안 이용하는 것이 가능한지 궁금합니다. <br /> 안녕하세요, 운영자입니다. <br /> 일정관리를 다음과
					같이 알려드립니다. 시세확장때문에 하는데요. <br /> 평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는
					것이 가능한지 궁금합니다. <br /> 안녕하세요, 운영자입니다. <br /> 일정관리를 다음과 같이 알려드립니다.
					시세확장때문에 하는데요. <br /> 평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이 가능한지
					궁금합니다. <br /> 부모님의 편의를 생각해서 가능한 빠른 답변 부탁드립니다. 다음 주에도 가능하다면 좋겠어요. <br />
					<br /> 부모님을 위한 편리한 이동이라는 목적으로 서비스를 검토 중이니, <br /> 어떤 혜택이나 특별한
					안내사항이 있는지도 함께 알려주시면 감사하겠습니다 오버플로우 오토로 줬어요. <br />
				</div>
			</div>

			<div class="qd-content-box-td2-2">
				<button class="qd-content-box-td2-2-button" id="closeModalBtn">
					閉じる</button>
			</div>
		</div>
	</div>

</body>
</html>