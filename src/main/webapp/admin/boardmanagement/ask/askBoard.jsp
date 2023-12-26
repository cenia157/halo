<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ask</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />

<script type="text/javascript">
function deleteQuestion(n) {
    let ok = confirm("削除しますか?");
    if (ok) {
        location.href= "AskDeleteC?q_seq=" + n;
    }
}
</script>

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
				<div class="ontent-m-td-2-content-txt-kategorie-in">미답변</div>
				<div class="ontent-m-td-2-content-txt-title-in"><a onclick="openModalN()">이곳을 클릭하면 미답변 모달이 열릴 것이다</a></div>
				<div class="ontent-m-td-2-content-txt-writer-in">8</div>
				<div class="ontent-m-td-2-content-txt-date-in">8</div>
				<div class="ontent-m-td-2-content-txt-delete-in"> <a onclick="deleteQuestion()">삭제하기</a></div>
			</div>
			<div class="ontent-m-td-2-content-txt-in">
				<div class="ontent-m-td-2-content-txt-no-in">7</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">답변</div>
				<div class="ontent-m-td-2-content-txt-title-in"><a onclick="openModalA()">이곳을 클릭하면 답변 모달이 열릴 것이다</a></div>
				<div class="ontent-m-td-2-content-txt-writer-in">7</div>
				<div class="ontent-m-td-2-content-txt-date-in">7</div>
				<div class="ontent-m-td-2-content-txt-delete-in">삭제하기</div>
			</div>
<!-- 			foreach문 추가 -->

		<form action="GetDataC" method="post" style="height: 100%; width: 100%;">
			<c:forEach items="${questions}" var="question">
			    <div class="ontent-m-td-2-content-txt-in">
			        <div class="ontent-m-td-2-content-txt-no-in">${question.q_seq}</div>
			        <div class="ontent-m-td-2-content-txt-kategorie-in"></div>
				        <div class="ontent-m-td-2-content-txt-title-in">
			            <!-- JavaScript를 사용하여 form을 동적으로 생성 -->
			            <a onclick="getData('${question.q_seq}');">${question.q_title}</a>
				        </div>
			        <div class="ontent-m-td-2-content-txt-writer-in">${question.q_name}</div>
			        <div class="ontent-m-td-2-content-txt-date-in">${question.q_reg_date}</div>
			        <div class="ontent-m-td-2-content-txt-delete-in">
			            <a onclick="deleteQuestion(${question.q_seq})">삭제하기</a>
			        </div>
			    </div>
			</c:forEach>
		</form>

		</div>
	</div>
</body>

<script src="admin/0.js/test2.js"></script>
<script src="admin/0.js/test.js"></script>
</html>