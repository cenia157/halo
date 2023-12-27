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
		<input type="hidden" name="selectedStart" value="${selectedStart }">
		<input type="hidden" name="selectedEnd" value="${selectedEnd }">
		<input type="hidden" name="selectedTime" value="${selectedTime }">
	<div class="content-applyform-td">
		<div class="content-applyform-tr-1">
			<div class="categotyselect" name="category" id="category">
				‘개호택시’ 신청에 필요한 정보를 입력해주세요.</div>
		</div>
		<div class="content-applyform-td2">
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">신청자 이름* :</span> <input
					class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">서비스 받으실 분 성함* :</span> <input
					class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">출발지* :</span> <input
					class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">목적지* :</span> <input
					class="content-applyform-tr-2-2" type="text">
			</div>
			<div class="content-applyform-tr-2">
				<span class="content-applyform-tr-2-1">비고란(요청사항)* :</span> <input
					class="content-applyform-tr-2-2" type="text">
			</div>
		</div>
		<div class="content-cal-btn-box-td">
		<a href="ServiceC?step=6" class="content-cal-btn-td">다음으로</a>
		</div>
	</div>


</body>
</html>