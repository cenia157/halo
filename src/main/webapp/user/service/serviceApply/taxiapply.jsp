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
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/taxiapply.css" />
</head>
<body>


	<!-- 신청폼 -->
		<form action="TexiapplyC" method="post">
		<input type="hidden" name="selectedStart" value="${selectedStart }">
		<input type="hidden" name="selectedEnd" value="${selectedEnd }">
		<input type="hidden" name="selectedTime" value="${selectedTime }">
		<input type="hidden" name="addr" value="${addr }">
		<input type="hidden" name="niText" value="${niText }">
		<input type="hidden" id="getYear" value="${userYear }">
		<input type="hidden" id="getMonth" value="${userMonth }">
		<input type="hidden" id="getDay" value="${userDay }">
		
	<div class="content-applyform-td">
		<div class="content-applyform-tr-1">
			<div class="categotyselect" name="category" id="category">
				‘개호택시’ 신청에 필요한 정보를 입력해주세요.</div>
		</div>
		<div class="content-applyform-td2">
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">신청자 이름* :</span> <input
					name="applicant" value="${applicant }" class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">연락처* :</span> <input
						name="phoneNum" value="${phoneNum }" class="content-applyform-tr-2-2" type="text">
				</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">간호 대상자 성함* :</span> <input
					name="userName" value="${userName }" class="content-applyform-tr-2-2" type="text">
			</div>
					<div class="content-applyform-tr-2">
					<span class="content-applyform-tr-2-1">간호 대상자 성별* :
					</span> 
					<div class="content-applyform-tr-2-2">
					<div class="content-applyform-tr-2-3">
					<input name="userGender" type="radio" value="m" ${manChecked }>男 
					</div>
					<div class="content-applyform-tr-2-3">
					<input name="userGender" class="content-applyform-tr-2-3" type="radio" value="w" ${womanChecked }>女
					</div>
					</div>
				</div>
				<div class="content-applyform-tr-2">
					<span class="content-applyform-tr-2-1">간호 대상자 생년월일* :</span>
					<div class="content-applyform-tr-2-2">
					 <label for="userYear">年:</label>
					<select id="userYear" name="userYear" value="${userYear }" ></select>

					<label for="userMonth">月:</label>
					<select id="userMonth" name="userMonth" value="${userMonth }"></select>

					<label for="userDay">日:</label>
					<select id="userDay" name="userDay" value="${userDay }"></select>
					</div>
				</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">출발지* :</span> <input
					name="startAddr" class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">목적지* :</span> <input
					name="endAddr" class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">비고란(요청사항)* :</span> <textarea
					 name="tiText" class="content-applyform-tr-2-2" ></textarea>
			</div>
		</div>
		<div class="content-cal-btn-box-td">
		<button class="content-cal-btn-td">다음으로</button>
		</div>
	</div>
	</form>

</body>
<script type="text/javascript">
var selectedYear = document.getElementById("getYear").value;
var selectedMonth = document.getElementById("getMonth").value;
var selectedDay = document.getElementById("getDay").value;

console.log(selectedYear);
console.log(selectedMonth);
console.log(selectedDay);

var yearSelect = document.getElementById("userYear");
var currentYear = new Date().getFullYear();
for (var year = currentYear; year >= 1900; year--) {
    var option = document.createElement("option");
    option.text = year;
    option.value = year;
    if (year === parseInt(selectedYear)) {
        option.selected = true;
    }
    yearSelect.appendChild(option);
}

var monthSelect = document.getElementById("userMonth");
for (var month = 1; month <= 12; month++) {
    var option = document.createElement("option");
    option.text = month;
    option.value = month;
    if (month === parseInt(selectedMonth)) {
        option.selected = true;
    }
    monthSelect.appendChild(option);
}

var daySelect = document.getElementById("userDay");
for (var day = 1; day <= 31; day++) {
    var option = document.createElement("option");
    option.text = day;
    option.value = day;
    if (day === parseInt(selectedDay)) {
        option.selected = true;
    }
    daySelect.appendChild(option);
}

</script>
</html>