<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>
<script
	src="${pageContext.request.contextPath}/admin/manager/staff/0.js/staffContent.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/manager/staff/0.css/staffContent.css" />
</head>

<head>
<meta charset="UTF-8">
<title>Document</title>
</head>

<body>
	<div class="staff-padding">
		<div class="staff-con">
			<div class="sec_cal">
				<div class="ins-tr-1">
					<div id="staffList" class="staff-table">
						<div class="table-header">
							<div class="cell steff-num">No.</div>
							<div class="cell steff-pos">직급</div>
							<div class="cell steff-name">이름</div>
							<div class="cell steff-callnum">전화번호</div>
							<div class="cell steff-addr">주소</div>
							<div class="cell steff-entryDate">입사일자</div>
						</div>

						<c:forEach var="emp" items="${employeeList}">
							<div class="table-row">
								<div class="cell steff-num"></div>
								<div class="cell steff-pos"></div>
								<div class="cell steff-name"></div>
								<div class="cell steff-callnum"></div>
								<div class="cell steff-addr"></div>
								<div class="cell steff-entryDate"></div>
								<input class="cell steff-color" type="hidden">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<form class="staff-form" action="StaffRegC" method="post">
				<div class="sec-ins">

					<div class="ins-tr-2">
						<div>職員登録</div>
					</div>
					<div class="ins-tr-3">
						<div class="ins-tr-3-title">
							<div class="ins-tr-title-title">이름</div>
							<input type="text" class="ins-tr-3-td-input input-title"
								name="input-staff-name">
						</div>
						<div class="ins-tr-3-title">
							<div class="ins-tr-title-title">직급</div>
							<input type="text" class="ins-tr-3-td-input input-title"
								name="input-staff-pos">
						</div>
						<div class="ins-tr-3-title">
							<div class="ins-tr-title-title">전화번호</div>
							<input type="text" class="ins-tr-3-td-input input-title"
								name="input-staff-callNum">
						</div>
						<div class="ins-tr-3-title">
							<div class="ins-tr-title-title">입사일자</div>
							<input type="date" class="ins-tr-3-td-input input-title"
								name="input-staff-entryDate">
						</div>

						<div class="ins-tr-3-title">
							<div class="ins-tr-title-color">캘린더색상</div>
							<input type="color" list="colors"
								class="ins-tr-3-td-input input-color" name="input-staff-color">
							<datalist id="colors">
								<option>#FF0000</option>
								<option>#00FF00</option>
								<option>#0000FF</option>
								<!-- 원하는 색상을 추가할 수 있습니다. -->
							</datalist>
							<!-- 							<input type="color" class="ins-tr-3-td-input input-color" -->
							<!-- 								name="input-date" readonly="readonly"> -->
						</div>
						<div class="ins-tr-3-txt">
							<div class="ins-tr-txt-tr-title">주소</div>
							<textarea class="ins-tr-3-td-txt" name="input-steff-addr"></textarea>
						</div>
						<div></div>
						<div class="ins-tr-3-btn">
							<button type="button" class="company-button"
								onclick="StaffRegC()">등록하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
</body>

</html>