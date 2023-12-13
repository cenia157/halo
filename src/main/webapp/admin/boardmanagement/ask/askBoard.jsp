<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 아래의 코드는 에ㅔ디터를 활성화 하기 위한 코드 -->




<!-- 
왜 아래의 코드는 안먹는걸까...?
-->
<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>

<!--
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script> 
-->


<title>Ask</title>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/0.css/test.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/boardmanagement/ask/0.css/ask.css" />


<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />

</head>


<body>



	<div class="ontent-m-td-2-content">


		<!-- 아마 여기서 for Each문을 써서 DB에서 값을 가져와 게시판을 표현해야 할 것 같다 -->




		<div class="ontent-m-td-2-content-container">
			<div class="ontent-m-td-2-content-txt">
				<div class="ontent-m-td-2-content-txt-no">No</div>
				<div class="ontent-m-td-2-content-txt-kategorie">카테고리</div>
				<div class="ontent-m-td-2-content-txt-title">제목</div>
				<div class="ontent-m-td-2-content-txt-writer">작성자</div>
				<div class="ontent-m-td-2-content-txt-date">작성일자</div>
				<div class="ontent-m-td-2-content-txt-delete"></div>
			</div>
		</div>



		<div class="ontent-m-td-2-mid">


			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">8</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">8</div>
				<div class="ontent-m-td-2-content-txt-title-in">8</div>
				<div class="ontent-m-td-2-content-txt-writer-in">8</div>
				<div class="ontent-m-td-2-content-txt-date-in">8</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>

			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">7</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">6</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">5</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">4</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">3</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">2</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">1</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">7</div>
				<div class="ontent-m-td-2-content-txt-title-in">7</div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>






		</div>















	</div>

</body>

</html>