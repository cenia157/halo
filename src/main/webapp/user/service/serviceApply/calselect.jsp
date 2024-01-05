<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/calselect.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/seviceapply.css" />
</head>
<body>

	<!-- step별 페이지 -->
	<form action="CalselectC" class="content-calbox-td" method="post">
		<div class="content-date-select-box-td">
			<div class="date-sel-start-box-td">
				開始日<br>
				<input type="date" required="required" id="start-date-sel" name="selectedStart" class="date-sel" />
					</div>
					<div class="date-sel-txt-box-td"> <br> ~ </div>
					<div class="date-sel-end-box-td">
					 終了日<br>
					 <input type="date" id="end-date-sel" name="selectedEnd" class="date-sel" />
					</div>
		</div>
		<div class="calendar">
			<div class="header">
					<button class="nav-btn go-prev" id="prev-button">&lt;先月</button>
				<div class="year-month"></div>
<!-- 				<div class="nav"> -->
					<button class="nav-btn go-next" id="next-button">来月&gt;</button>
<!-- 				</div> -->
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
		<div class="content-cal-btn-box-td">
			<button class="next-btn">다음으로</button>
		</div>
	</form>
</body>
<script>
	// 페이지를 벗어났을 때 실행되는 이벤트 처리
	window.onbeforeunload = function() {
		// 'selectedService' 키에 해당하는 세션 스토리지 데이터 제거
		sessionStorage.removeItem('selectedService');
	}

	function saveData() {
		// 사용자가 입력한 데이터를 가져와서 Session Storage에 저장
		var selectedService = sessionStorage.getItem('selectedService');

		if (!selectedService) {
			// 데이터가 없을 때 에러 메시지 표시
			alert('데이터가 없습니다. 다시 입력해주세요!');
			return; // 함수 종료
		}

		// 다음 페이지로 이동
		window.location.href = 'CalselectC';
	}
</script>
</html>
