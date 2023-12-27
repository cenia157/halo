<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nursing Apply</title>
<link rel="stylesheet"
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/nursingapply.css" />
</head>
<body>
				<!-- 신청폼 -->
		<form action="${sevice}" method="post">
		<input type="hidden" name="selectedStart" value="${selectedStart }">
		<input type="hidden" name="selectedEnd" value="${selectedEnd }">
		<input type="hidden" name="selectedTime" value="${selectedTime }">
			<div class="na-content-applyform-td">
				<div class="na-content-applyform-tr-1">
					<div class="categotyselect" name="category" id="category">
					신청에 필요한 정보를 입력해주세요.
					</div>
				</div>
				<div class="na-content-applyform-td2">
					<div class="na-content-applyform-tr-2">
						<span class="na-content-applyform-tr-2-1">신청자 이름* :</span> <input
							name="" class="na-content-applyform-tr-2-2" type="text">
					</div>
					<div class="na-content-applyform-tr-2">
						<span class="na-content-applyform-tr-2-1">요양받으실 분 성함* :</span> <input
							class="na-content-applyform-tr-2-2" type="text">
					</div>
					<div class="na-content-applyform-tr-2">
						<span class="na-content-applyform-tr-2-1">지역 (방문할 주소)* :</span> <input
							class="na-content-applyform-tr-2-2" type="text">
					</div>
					<div class="na-content-applyform-tr-2">
						<span class="na-content-applyform-tr-2-1">비고란(요청사항)* :</span>
						<textarea class="na-content-applyform-tr-2-2" type="text"></textarea>
					</div>
				</div>
				<div class="na-content-cal-btn-box-td">
			<a href="ServiceC?step=${nextBtn }" class="na-content-cal-btn-td">다음으로</a>
		</div>
			</div>
		</form>

</body>
</html>