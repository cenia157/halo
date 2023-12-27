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
	<div class="content-serviceselectbox-td">
<form action="" class="content-serviceoption-td">
		<input type="hidden" name="step" value="2">
    	<input type="hidden" name="svc" value="nursing">
		<button type="submit" id="nursing">방문요양</button>
</form>
<form action="" class="content-serviceoption-td">
		<input type="hidden" name="step" value="2">
    	<input type="hidden" name="svc" value="texi">
		<button type="submit" id="texi">개호택시</button>
</form>		
			
<form action="" class="content-serviceoption-td">
		<input type="hidden" name="step" value="2">
    	<input type="hidden" name="svc" value="nursingTexi">
		<button type="submit" id="nursingTexi">방문요양 & 개호택시</button>
			</form>		
	</div>
	<div class="content-servicebtn-box-td">
		<div class="content-servicebtn-td">신청 페이지로 가기</div>
	</div>
	<div class="content-reference-txt-td">※이용하실 서비스 내용을 선택 후 신청 페이지
		버튼을 눌러주세요.</div>
</body>
</html>
