<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question Detail</title>
<link rel="stylesheet"
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/question/0.css/questionDetail.css">	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">

<script type="text/javascript">
function deleteQuestion(n) {
	let ok = confirm("削除しますか?");
	if (ok) {
		location.href= "QuestionDeleteC?q_seq=" + n;
	}
}
</script>

</head>
<body>


	<div class="qd-content-tbl">

	<!-- 본문 -->
	<div class="qd-content-tbl">
		<!-- 문의글 게시판 (디테일) -->
		<div class="qd-content-box-tr1">
			<div class="qd-content-box-tr2">
				<div class="qd-content-box-tr2-1">
				<div class="qd-content-box-td1-1">
					<span>お問い合わせ</span>
				</div>
				<div class="qd-content-box-td1-2">
					<div class="qd-content-box-td1-2-1">タイトル</div>
					<div class="qd-content-box-td1-2-2"> ${QnC.q_title} </div>
				</div>

				<div class="qd-content-box-td1-3">
					<div class="qd-content-box-td1-3-1">作成者</div>
					<div class="qd-content-box-td1-3-2"> ${QnC.q_name} </div>
				</div>

				<div class="qd-content-box-td1-4">
					<div class="qd-content-box-td1-4-content">
						<span class="qd-content-box-td1-4-1">作成日時</span> <span
							class="qd-content-box-td1-4-2"> ${QnC.q_reg_date} </span>
					</div>
					<div class="qd-content-box-td-button">
						<button class="qd-content-box-td-button-2" onclick="deleteQuestion(${QnC.q_seq})">削除 X</button>
					</div>
				</div>

				<!-- 본문 -->
				<div class="qd-content-box-td2-1">
					<div class="qd-content-box-td2-1-content">
						${QnC.q_content}
					</div>
				</div>

				<div class="qd-content-box-td2-2">
					<button class="qd-content-box-td2-2-button" id="listButton">リスト</button>
				</div>
				<!-- 댓글 -->
				<div class="qd-content-box-td3">
				<div class="qd-content-box-td3-1">
						<div class="qd-content-box-td3-1-1">${QnC.c_commenter_name}</div>
						<div class="qd-content-box-td3-1-2">${QnC.c_reg_date }</div>
					</div>
					<div class="qd-content-box-td3-2">
						<div class="qd-content-box-td3-2-1">
							<img alt=""
								src="${pageContext.request.contextPath}/user/qa/question/0.img/lock.png">
						</div>
						<div class="qd-content-box-td3-2-2">${QnC.c_comment_content}</div>
					</div>
				</div>
				
				
				<!-- 이전글/다음글 -->
				<div class="qd-content-box-td4" >
				
<!-- 현재위치 찾기 -->
    <c:forEach var="question" items="${questionList}" varStatus="status">
        <c:if test="${question.q_seq eq questionId}">
            <c:set var="currentIndex" value="${status.index}" />
        </c:if>
    </c:forEach>
<%-- 1보다 큰 차이가 있는 경우의 처리 --%>
    <c:if test="${fn:length(questionList) > 1 and (currentIndex < fn:length(questionList) - 1) and (currentIndex - 1) > 0}">
        <c:forEach var="gap" begin="1" end="${currentIndex - 1}">
            <a href="${questionList[currentIndex - gap].q_seq}">이전 글(${gap} 차이): ${questionList[currentIndex - gap].q_title}</a>
        </c:forEach>
    </c:if>
					<div class="qd-content-box-td4-1">
						<div class="qd-content-box-td4-1-1">前のページ</div>
							<div class="qd-content-box-td4-1-2">
							    <c:if test="${currentIndex > 0}">
							        <a href="${questionList[currentIndex - 1].q_seq}">이전 글: ${questionList[currentIndex - 1].q_title}</a>
							    </c:if>
							</div>
						</div>
						<div class="qd-content-box-td4-2">
						<div class="qd-content-box-td4-2-1">後のページ</div>
						    <c:if test="${currentIndex < fn:length(questionList) - 1}">
						        <a href="${questionList[currentIndex + 1].q_seq}">다음 글</a>
						    </c:if>
						</div>
					</div>
				</div>
				
				<div class="qd-content-box-td4-3">
					<div class="qd-content-box-td4-3-1">
						他のお問い合わせは <br> Tel.06-6997-6531 にご連絡お願い致します。
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>


</body>

<script type="text/javascript">
	document.getElementById("listButton").onclick = function() {
    window.location.href = "QuestionC";
  };	
</script>
</html>