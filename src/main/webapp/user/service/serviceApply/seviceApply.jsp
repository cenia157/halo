<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/user/service/serviceApply/0.js/cal.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/svcselect.css" />
</head>
<body>
	<div class="content-box-tr">
		<div class="content-box-td">
			<div class="content-tabbox-td">
				<div class="content-tab1-td tab1-pos">서비스 안내</div>
				<div class="content-tab2-td tab2-pos">서비스 신청</div>
			</div>
			<div class="content-subtab-td">
				<img src="0.img/home.png" alt="" /> > 서비스 > 서비스신청
			</div>
			<div class="content-procedure-box-td">
				<!-- 서비스 신청 순서 -->
				<div class="content-title-box-td">서비스 신청 순서</div>
				<ul class="content-procedure-box-ul">
					<li class="content-box-li" style="background-color: ${step1Pos}">
						
						<div class="content-service-step-box-td"><a href="ServiceC?step=6">Step1.</a></div>
						<div class="content-service-txt-box-td">신청할 서비스 선택하기</div>
					</li>
					<li class="content-box-li" style="background-color: ${step2Pos}">
						
						<div class="content-service-step-box-td"><a href="ServiceC?step=6">Step2.</a></div>
						<div class="content-service-txt-box-td">이용할 ‘기간’ 캘린더에서 선택하기</div>
					
					</li>
					<li class="content-box-li" style="background-color: ${step3Pos}">
						
						<div class="content-service-step-box-td"><a href="ServiceC?step=3">Step3.</a></div>
						<div class="content-service-txt-box-td">이용 ‘시간’ 선택하기</div>
					
					</li>
					<li class="content-box-li" style="background-color: ${step4Pos}">
						
						<div class="content-service-step-box-td"><a href="ServiceC?step=4">Step4.</a></div>
						<div class="content-service-txt-box-td">정보 입력하기</div>
					
					</li>
					</li>

					<li class="content-box-li" style="background-color: ${step5Pos}">
						
							<div class="content-service-step-box-td"><a href="ServiceC?step=6">Step5.</a></div>
							<div class="content-service-txt-box-td">이용약관 동의</div>
					
					</li>
					<li class="content-box-li" location.
						style="background-color: ${step6Pos}">
							<div class="content-service-step-box-td"> <a
						href="ServiceC?step=7">Step6.</a></div>
							<div class="content-service-txt-box-td">신청 완료</div>
					
				</ul>
			</div>
			<jsp:include page="${seviceStep }"></jsp:include>
		</div>
	</div>

</body>
</html>
