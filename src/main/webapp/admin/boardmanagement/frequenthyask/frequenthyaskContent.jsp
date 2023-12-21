<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>
<title>Frequenthyask</title>





<link rel="stylesheet" href="admin/0.css/test copy.css" />
<link rel="stylesheet"
	href="admin/boardmanagement/frequenthyask/0.css/frequenthyask.css" />

<script src="admin/0.js/test2.js"></script>
<script src="admin/0.js/test.js"></script>





<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<div class="ontent-m-td-2-chackbox"></div>
	<!-- 아래의 div는 No부터 버튼을 포함함 구조는 (No 카테고리 제목 ...) (8888... 7777.... ) (버튼) 이 세개가 블록으로 쌓여있다 -->
	<div class="ontent-m-td-2-content">
		<div class="ontent-m-td-2-content-container">
			<div class="ontent-m-td-2-content-txt">
				<div class="ontent-m-td-2-content-txt-no">No</div>
				<div class="ontent-m-td-2-content-txt-kategorie">카테고리</div>
				<div class="ontent-m-td-2-content-txt-title">제목</div>
				<div class="ontent-m-td-2-content-txt-writer">작성자</div>
				<div class="ontent-m-td-2-content-txt-date">수정일자</div>
				<div class="ontent-m-td-2-content-txt-delete"></div>
			</div>
		</div>
		<div class="ontent-m-td-2-mid">
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">8</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">8</div>
				<div class="ontent-m-td-2-content-txt-title-in"> <a onclick="openModalF()">● 이곳을 누르면 모달이 뜬다</a> </div>
				<div class="ontent-m-td-2-content-txt-writer-in">8</div>
				<div class="ontent-m-td-2-content-txt-date-in">8</div>
				<div class="ontent-m-td-2-content-txt-delete-in"></div>
			</div>
			<div class="ontent-m-td-2-mid">
			<c:forEach items="${QA_tbl }" var="qa">
				<div class="ontent-m-td-2-content-txt-in">
					<div class="ontent-m-td-2-content-txt-no-in"> ${qa.qa_seq } </div>
					<div class="ontent-m-td-2-content-txt-title-in"> ${qa.qa_title } <a onclick="openModalF()">● 이곳을 누르면 모달이 뜬다</a> </div>
					<div class="ontent-m-td-2-content-txt-date-in">${qa.qa_reg_date}</div>
					<div class="ontent-m-td-2-content-txt-delete-in"> <button>삭제하기</button> </div>
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="ontent-m-td-2-bottom">
			<div class="ontent-m-td-2-page-side"></div>
			<div class="ontent-m-td-2-page-center"></div>
			<div class="ontent-m-td-2-page-side"></div>
		</div>
		<!-- 여기는 모달을 띄워주는 곳, 
			자주묻는 질문의 내용을 변경하기 위한 곳(frequenthyaskEditPage.jsp)-->
		<jsp:include page="frequenthyaskEditPage2.jsp"></jsp:include>
	</div>
</body>
</html>