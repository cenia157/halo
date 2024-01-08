<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/timeselect.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/seviceapply.css" />
</head>
<body>
	<form action="TimeselectC" method="post" class="content-form-box">
		<input type="hidden" name="selectedStart" value="${selectedStart }">
		<input type="hidden" name="selectedEnd" value="${selectedEnd }">
<!-- 		<div class="content-step-page-td"> -->
<!-- 			<!-- step별 페이지  시작--> -->
<!-- 			<select id="selectedTime" name="selectedTime" required="required"> -->
<!-- 				<option value="" disabled selected>시간 선택</option> -->
<!-- 				<option value="AM">오전 : 08:00~12:00</option> -->
<!-- 				<option value="PM">오후 : 14:00~18:00</option> -->
<!-- 			</select> -->
<!-- 			<hr /> -->
<!-- 		</div> -->
		<div class="content-time-select-box-td">
			<div class="content-time-option-td">
			<label >
				<input type="radio" name="selectedTime" value="allday"
					id="selectedTime" checked> <br> 終日 <br> 08:00~18:00 </label><br>
			</div>
			<div class="content-time-option-td">
				<label>
				<input type="radio" name="selectedTime" value="nursing" id="selectedTime">
				<br> 午前 <br> 08:00~12:00</label>
			</div>

			<div class="content-time-option-td">
			<label>
				<input type="radio" name="selectedTime" value="PM" id="selectedTime"> <br> 午後<br> 14:00~18:00</label>
			</div>
		</div>

		<div class="content-time-btn-box-td">
			<button class="content-time-btn">次へ</button>
		</div>
		<!-- step별 페이지  끝-->
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
		window.location.href = 'TimeselectC';
	}
</script>
</html>