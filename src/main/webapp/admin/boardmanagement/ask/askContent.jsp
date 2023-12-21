<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ask</title>
<link rel="stylesheet"
	href="admin/boardmanagement/ask/0.css/ask.css" />


<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />

<script src="admin/0.js/test2.js"></script>
<script src="admin/0.js/test.js"></script>
<link rel="stylesheet" href="admin/0.css/test copy.css" />



</head>
<body>
	<div class="ontent-m-td-2-chackbox">
		<div class="ontent-m-td-2-chackbox-contain">
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">답변</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">미답변</div>
			<div class="ontent-m-td-2-chackbox-contain-input"></div>
			<div class="ontent-m-td-2-chackbox-contain-txt"></div>
			<div class="ontent-m-td-2-chackbox-contain-input"></div>
			<div class="ontent-m-td-2-chackbox-contain-txt"></div>
			<div class="ontent-m-td-2-chackbox-contain-input"></div>
			<div class="ontent-m-td-2-chackbox-contain-txt"></div>
		</div>
	</div>
	<!-- 아래의 include는 for Each를 써서 게시판을 나타내는 용도다  -->
	<jsp:include page="/admin/boardmanagement/ask/askBoard.jsp"></jsp:include>
	<!-- 고객의 문의에 미답변 내용을 보여주는 곳 -->
	<jsp:include page="/admin/boardmanagement/ask/askRespone.jsp"></jsp:include>
	<!-- 고객의 문의에 답변 내용을 편집하는 곳 -->
	<jsp:include page="/admin/boardmanagement/ask/askEditPage.jsp"></jsp:include>
	
</body>
</html>