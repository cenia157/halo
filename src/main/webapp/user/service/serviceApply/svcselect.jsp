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
	<form action="SvcselectC" class="content-form-box" method="post" >
		<div class="content-serviceselect-box-td">
			<div class="content-serviceoption-td">
<!-- 			<label for="nursingTexi" > -->
			<label >
				<input type="radio" name="service" value="nursingTexi"
					id="service" checked> <br> 방문요양 & 개호택시</label><br>
			</div>
			<div class="content-serviceoption-td">
<!-- 				<label for="nursing"> -->
				<label>
				<input type="radio" name="service" value="nursing" id="service">
				<br> 방문요양</label>
			</div>

			<div class="content-serviceoption-td">
<!-- 			<label for="texi"> -->
			<label>
				<input type="radio" name="service" value="texi" id="service"> <br> 개호택시</label>
			</div>

		</div>
		<div class="content-servicebtn-box-td">
				<button class="content-servicebtn-td">신청 페이지로 가기</button>
		</div>
		<div class="content-reference-txt-td">※이용하실 서비스 내용을 선택 후 신청 페이지
			버튼을 눌러주세요.</div>
	</form>
</body>

</html>
