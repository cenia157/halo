<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="admin/customerCare/customerInfoMgmt/0.css/customerInfoMgmt.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/customerCare/customerInfoMgmt/0.js/customerInfoMgmt.js"></script>
</head>
<body>
	<div class="content-checkBoxDiv">
		<div class="content-monthSelectDiv">
			<input type="month" id="monthSelect">
<!-- 			<select id="monthSelect"> -->
<!-- 				<option value="2024-01">2024-01</option> -->
<!-- 				<option value="2024-02">2024-02</option> -->
<!-- 				<option value="2024-03">2024-03</option> -->
<!-- 				<option value="2024-04">2024-04</option> -->
<!-- 				<option value="2024-05">2024-05</option> -->
<!-- 				<option value="2024-06">2024-06</option> -->
<!-- 				<option value="2024-07">2024-07</option> -->
<!-- 				<option value="2024-08">2024-08</option> -->
<!-- 				<option value="2024-09">2024-09</option> -->
<!-- 				<option value="2024-10">2024-10</option> -->
<!-- 				<option value="2024-11">2024-11</option> -->
<!-- 				<option value="2024-12">2024-12</option> -->
<!-- 			</select> -->
		</div>

	</div>
	<!--  -->
	<div class="content-MainDiv">
		<!--  -->
		<div class="content-columnNameWrapDiv">
			<div class="content-columnNameDiv columnName-no">No</div>
			<div class="content-columnNameDiv columnName-customer">顧客</div>
			<div class="content-columnNameDiv columnName-address">住所</div>
			<div class="content-columnNameDiv columnName-number">連絡先</div>
			<div
				class="content-columnNameDiv columnName-service columnName-service2">サービス</div>
			<div class="content-columnNameDiv columnName-note">内容</div>
		</div>
		<div class="content-dataWrapDiv">
			<!--  -->
			<!--  -->
		</div>
		<!--  -->
	</div>
	<!--  -->
</body>
<script type="text/javascript">
	let titleDiv = document.querySelector('.content-m-td-title');
	titleDiv.innerText = '顧客データ管理';

	// window.addEventListener('load', function () {
	// 	  const dataWrapDiv = document.querySelector('.content-dataWrapDiv');
	// 	  const columnNameWrapDiv = document.querySelector('.content-columnNameWrapDiv');

	// 	  if (dataWrapDiv.scrollHeight > dataWrapDiv.clientHeight) {
	// 	    // 스크롤바가 존재하는 경우
	// 	    columnNameWrapDiv.style.width = '98.85%';
	// 	  } else {
	// 	    // 스크롤바가 없는 경우
	// 	    columnNameWrapDiv.style.width = '100%';
	// 	  }
	// 	});
</script>
</html>