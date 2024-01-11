<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="admin/customerCare/customerInfoMgmt/0.css/customerInfoMgmt.css" />
</head>
<body>
	<div class="content-checkBoxDiv">
	  <div class="content-monthSelectDiv">
	    <select id="monthSelect">
	        <option value="2024-01">2024-01</option>
	        <option value="2024-02">2024-02</option>
	        <option value="2024-03">2024-03</option>
	        <option value="2024-04">2024-04</option>
	        <option value="2024-05">2024-05</option>
	        <option value="2024-06">2024-06</option>
	        <option value="2024-07">2024-07</option>
	        <option value="2024-08">2024-08</option>
	        <option value="2024-09">2024-09</option>
	        <option value="2024-10">2024-10</option>
	        <option value="2024-11">2024-11</option>
	        <option value="2024-12">2024-12</option>
	    </select>
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
		    <div class="content-columnNameDiv columnName-service">サービス</div>
		    <div class="content-columnNameDiv columnName-note">内容</div>
		</div>
		<div class="content-dataWrapDiv">
			<!--  -->
			<div class="content-dataOneRowDiv">
				<div class="content-dataOneRowDiv-innerDiv columnName-no">1</div>
				<div class="content-dataOneRowDiv-innerDiv columnName-customer">오단영</div>
				<div class="content-dataOneRowDiv-innerDiv columnName-address">인천 서구 연희동 강진빌라 101호  12312312312312asdlkfjaskldjf;lsjdflkjsdk;lfjas;kldfj</div>
				<div class="content-dataOneRowDiv-innerDiv columnName-number">010-3672-1668</div>
				<div class="content-dataOneRowDiv-innerDiv columnName-service">개호택시</div>
				<div class="content-dataOneRowDiv-innerDiv columnName-note">이사람은 33살이고 ..어쩌구 저쩌구 ~~@!!@#!@#!@#!@#sdjkfhasjkdfhsjkdhfklajsdhfljkdfasdfasdfasdfasdf</div>
			</div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
			<!--  -->
			<div class="content-dataOneRowDiv"></div>
		</div>
		<!--  -->
	</div>
	<!--  -->
</body>
<script type="text/javascript">
let titleDiv = document.querySelector('.content-m-td-title');
titleDiv.innerText = '顧客データ管理';

window.addEventListener('load', function () {
	  const dataWrapDiv = document.querySelector('.content-dataWrapDiv');
	  const columnNameWrapDiv = document.querySelector('.content-columnNameWrapDiv');

	  if (dataWrapDiv.scrollHeight > dataWrapDiv.clientHeight) {
	    // 스크롤바가 존재하는 경우
	    columnNameWrapDiv.style.width = '98.8%';
	  } else {
	    // 스크롤바가 없는 경우
	    columnNameWrapDiv.style.width = '100%';
	  }
	});
</script>
</html>