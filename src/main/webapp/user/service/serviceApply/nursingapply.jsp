<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/user/service/serviceApply/0.css/nursingapply.css">
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css"> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css"> --%>
</head>
<body>

	<!-- 헤더 -->

	<div class="header-tbl">
		<div>소개</div>
		<div>소식</div>
		<div>서비스</div>
		<div>QnA</div>
	</div>
	
	
		<!-- 본문 -->
	<div class="container">
		<div class="content-tbl">
			<div class="content-box-tr">
				<div class="content-box-td">
					<div class="content-tabbox-td">
						<div class="content-tab1-td tab1-pos">서비스 안내</div>
						<div class="content-tab2-td tab2-pos">서비스 신청</div>
					</div>
					<div class="content-subtab-td">
						<img src="0.img/home.png" alt="" /> 서비스 > 서비스신청
					</div>
					<div class="content-procedure-box-td">
						<div class="content-title-box-td">서비스 신청 순서</div>
						<div class="content-procedure-box-ul-pos">
							<ul class="content-procedure-box-ul">
								<li class="content-box-li">
									<div class="content-service-step-box-td">Step1.</div>
									<div class="content-service-txt-box-td">신청할 서비스 선택하기</div>
								</li>
								<li class="content-box-li">
									<div class="content-service-step-box-td">Step2.</div>
									<div class="content-service-txt-box-td">이용할 ‘기간’ 캘린더에서
										선택하기</div>
								</li>
								<li class="content-box-li">
									<div class="content-service-step-box-td">Step3.</div>
									<div class="content-service-txt-box-td">이용 ‘시간’ 선택하기</div>
								</li>
								<li class="content-box-li-pagepos">
									<div class="content-service-step-box-td">Step4.</div>
									<div class="content-service-txt-box-td">정보 입력하기</div>
								</li>
								<li class="content-box-li">
									<div class="content-service-step-box-td">Step5.</div>
									<div class="content-service-txt-box-td">이용약관 동의</div>
								</li>
								<li class="content-box-li">
									<div class="content-service-step-box-td">Step6.</div>
									<div class="content-service-txt-box-td">신청 완료</div>
								</li>
							</ul>
						</div>
					</div>

					<!-- 설명 끝 -->

					<!-- 신청폼 -->
					<div class="content-applyform-td">
						<div class="content-applyform-tr-1">
							<select class="categotyselect" name="category" id="category">
								<option value="" selected="selected" disabled="disabled">‘방문요양’
									신청에 필요한 정보를 입력해주세요.</option>
								<option value=""></option>
								<option value=""></option>
								<option value=""></option>
							</select>
						</div>
						<div class="content-applyform-td2">
							<div class="content-applyform-tr-2">
								<span class="content-applyform-tr-2-1">신청자 이름* :</span> <input
									class="content-applyform-tr-2-2" type="text">
							</div>
							<div class="content-applyform-tr-2">
								<span class="content-applyform-tr-2-1">요양받으실 분 성함* :</span> <input
									class="content-applyform-tr-2-2" type="text">
							</div>
							<div class="content-applyform-tr-2">
								<span class="content-applyform-tr-2-1">지역 (방문할 주소)* :</span> <input
									class="content-applyform-tr-2-2" type="text">
							</div>
							<div class="content-applyform-tr-2">
								<span class="content-applyform-tr-2-1">비고란(요청사항)* :</span> <input
									class="content-applyform-tr-2-2" type="text">
							</div>
						</div>
						<div class="content-cal-btn-box-td">
							<button class="content-cal-btn-td">다음으로</button>
						</div>
					</div>
				</div>
				<!-- 신청폼 끝 -->
			</div>
		</div>
	</div>

	<div class="bottom-venner-tr">
		<div class="bottom-venner-td">하단베너</div>
		<div class="bottom-venner-td">상품판매링크</div>
		<div class="bottom-venner-td">추가기능</div>
	</div>

	<div class="footer-tbl">footer</div>
	</div>


</body>
</html>