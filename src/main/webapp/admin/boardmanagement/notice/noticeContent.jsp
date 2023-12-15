<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>notice</title>
<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>







<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/boardmanagement/notice/0.css/notice.css" />
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<div class="ontent-m-td-2-chackbox">
		<div class="ontent-m-td-2-chackbox-contain">
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">안내</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">일정</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">일반</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">서비스</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">상품</div>
		</div>
	</div>
	<div class="ontent-m-td-2-content">
		<!-- 아래의 include는 게시판 보드가 담겨있다 -->
		<jsp:include page="noticeBoard.jsp"></jsp:include>
		<div class="ontent-m-td-2-bottom">
			<div class="ontent-m-td-2-page-side"></div>
			<div class="ontent-m-td-2-page-center"></div>
			<div class="ontent-m-td-2-page-side">
				<button class="SubmitButton-content" onclick="openModalNR()">등록하기</button>
			</div>
		</div>

		<!-- 
			여기는 모달을 띄워주는 곳, 
			공지사항을 등록하기 위한 곳(noticeEditPage.jsp)
		-->
		<jsp:include page="noticeViewPage.jsp"></jsp:include>
		<jsp:include page="noticeRegPage.jsp"></jsp:include>
		<jsp:include page="noticeNEWRegPage.jsp"></jsp:include>
	</div>
</body>
</html>



















