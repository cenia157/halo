<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- 아래의 코드는 CKEDITOR를 활성화 하기 위한 코드 -->
<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>
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

	<div class="content-m-td-2">



		<div class="ontent-m-td-2-chackbox">
			<div class="ontent-m-td-2-chackbox-contain">
				<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" name="">답변
				</div>
				<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" name="">미답변
				</div>
				<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" name="">일반
				</div>
								<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" name="">서비스
				</div>
								<div class="ontent-m-td-2-chackbox-contain-input">
					<input type="checkbox" name="">답변
				</div>
			</div>
		</div>







		<!-- 아래의 include는 for Each를 써서 게시판을 나타내는 용도다  -->
		<jsp:include page="askBoard.jsp"></jsp:include>



		<!-- 여기는 모달을 띄워주는 곳, 
						고객의 문의에 이미 답변한 내용을 보여주거나(askRespone.jsp)
						아니면 질문할 공간을 띄우는 곳(askEditPage.jsp) -->


		<jsp:include page="askRespone.jsp"></jsp:include>




	</div>

</body>

</html>