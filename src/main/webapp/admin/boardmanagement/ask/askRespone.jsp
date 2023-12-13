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

	<div id="myModal" class="modal-background"></div>
	<div class="modal-tbl">

		<div class="modal-title-tr">
			<div class="modal-title-td-1">



				<div class="real-title">● 제공되는 서비스를 이용하려면 어떻게 해야되나요?</div>





			</div>
			<div class="modal-title-td-2">
				<span class="close" id="closeModalBtn">&times;</span>
			</div>

		</div>
		<div class="modal-content">
			<div class="modal-content-txt">

				<div class="modal-content-txt-question" style="border: 1px solid black ;">

					<!-- 여기에 고객이 질문한 문의사항을 띄우는 곳 -->
					<jsp:include page="askEditPageCustomerQuestion.jsp"></jsp:include>


				</div>
				<div class="modal-content-txt-response">


					<!-- 여기서 '이미 대답한 답변을 보여줄거냐(askEditPageAnsweredResponse)' 아니면 '아직 답변하지 못한 답변을 할 것이냐(askEditPageResponsePending)' -->
					여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br> 여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br>
					여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br> 여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br>
					여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br> 여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br>
					여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br> 여기는 고객의 질문에 답변했던 것을 표시하는 곳 <br>


				</div>

			</div>
			<div class="modal-content-button">
				<button class="SubmitButton">수정하기</button>
			</div>
		</div>
	</div>








</body>
</html>