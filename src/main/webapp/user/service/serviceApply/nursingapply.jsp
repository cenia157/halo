<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nursing Apply</title>
<link rel="stylesheet"
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/nursingapply.css" />
</head>
<body>
	<!-- 신청폼 -->
	<form action="${service}" method="post">
		<input type="hidden" name="selectedStart" value="${selectedStart }">
		<input type="hidden" name="selectedEnd" value="${selectedEnd }">
		<input type="hidden" name="selectedTime" value="${selectedTime }">
		<div class="na-content-applyform-td">
			<div class="na-content-applyform-tr-1">
				<div class="categotyselect" name="category" id="category">신청에
					필요한 정보를 입력해주세요.</div>
			</div>
			<div class="na-content-applyform-td2">
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">신청자 이름* :</span> <input
						name="applicant" class="na-content-applyform-tr-2-2" type="text" required="required">
				</div>
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">연락처* :</span> <input
						name="phoneNum" class="na-content-applyform-tr-2-2" type="text" pattern="[0-9]+" required="required">
				</div>
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">간호 대상자 성함* :</span> <input
						name="userName" class="na-content-applyform-tr-2-2" type="text" required="required">
				</div>
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">간호 대상자 성별* : </span>
					<div class="na-content-applyform-tr-2-2">
						<div class="na-content-applyform-tr-2-3">
							<input name="userGender" type="radio" value="m" checked>男
						</div>
						<div class="na-content-applyform-tr-2-3">
							<input name="userGender" class="na-content-applyform-tr-2-3"
								type="radio" value="w">女
						</div>
					</div>
				</div>
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">간호 대상자 생년월일 * :</span>
					<div class="na-content-applyform-tr-2-2">
					 <label for="userYear">年:</label>
					<select id="userYear" name="userYear" ></select>

					<label for="userMonth">月:</label>
					<select id="userMonth" name="userMonth"></select>

					<label for="userDay">日:</label>
					<select id="userDay" name="userDay"></select>
					</div>
				</div>
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">지역 (방문할 주소)* :</span> <input
						name="addr" class="na-content-applyform-tr-2-2" type="text" required="required">
				</div>
				<div class="na-content-applyform-tr-2">
					<span class="na-content-applyform-tr-2-1">비고란(요청사항)* :</span>
					<textarea name="niText" class="na-content-applyform-tr-2-2"></textarea>
				</div>
			</div>
			<div class="na-content-cal-btn-box-td">
				<button class="na-content-cal-btn-td">다음으로</button>
				>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
// 년도 선택 옵션 생성
var yearSelect = document.getElementById("userYear");
var currentYear = new Date().getFullYear();
for (var year = currentYear; year >= 1900; year--) {
  var option = document.createElement("option");
  option.text = year;
  option.value = year;
  yearSelect.appendChild(option);
}

// 월 선택 옵션 생성
var monthSelect = document.getElementById("userMonth");
for (var month = 1; month <= 12; month++) {
  var option = document.createElement("option");
  option.text = month;
  option.value = month;
  monthSelect.appendChild(option);
}

// 일 선택 옵션 생성 (1일부터 31일까지)
var daySelect = document.getElementById("userDay");
for (var day = 1; day <= 31; day++) {
  var option = document.createElement("option");
  option.text = day;
  option.value = day;
  daySelect.appendChild(option);
}

// //사용자가 선택한 값 가져오기
// var selectedYear = document.getElementById("userYear").value;
// var selectedMonth = document.getElementById("userMonth").value;
// var selectedDay = document.getElementById("userDay").value;

// // JSON 객체 생성
// var jsonData = {
//     userYear: selectedYear,
//     userMonth: selectedMonth,
//     userDay: selectedDay
// };

// fetch('UserDate', {
//     method: 'POST',
//     headers: {
//         'Content-Type': 'application/json'
//     },
//     body: JSON.stringify(jsonData)
// })
// .then(response => {
//     if (!response.ok) {
//         throw new Error('서버 응답 실패');
//     }
//     return response.json(); // JSON 형태의 데이터로 변환
// })


</script>
</html>