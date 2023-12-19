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
</head>
<body>

	<div class="content-step-page-td">
		<!-- step별 페이지  시작-->
		<select id="time" name="time">
			<option value="" disabled selected>시간 선택</option>
			<option value="AM">오전 : 08:00~12:00</option>
			<option value="PM">오후 : 14:00~18:00</option>
		</select>
		<hr />
	</div>
	<div class="content-time-btn-td">
		<a href="ServiceC?step=4" class="content-time-btn">다음으로</a>
	</div>
	<!-- step별 페이지  끝-->

</body>
</html>