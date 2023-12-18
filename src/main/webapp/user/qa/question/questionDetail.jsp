<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	let ok = confirm("삭제하시겠습니까?");
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
					<div class="qd-content-box-td1-2-2"> ${question.q_title} </div>
				</div>

				<div class="qd-content-box-td1-3">
					<div class="qd-content-box-td1-3-1">作成者</div>
					<div class="qd-content-box-td1-3-2"> ${question.q_name} </div>
				</div>

				<div class="qd-content-box-td1-4">
					<div class="qd-content-box-td1-4-content">
						<span class="qd-content-box-td1-4-1">作成日時</span> <span
							class="qd-content-box-td1-4-2"> ${question.q_reg_date} </span>
					</div>
					<div class="qd-content-box-td-button">
						<button class="qd-content-box-td-button-2" onclick="deleteQuestion(${question.q_seq})">削除 X</button>
					</div>
				</div>

				<!-- 본문 -->
				<div class="qd-content-box-td2-1">
					<div class="qd-content-box-td2-1-content">
						${question.q_content}
					</div>
				</div>

				<div class="qd-content-box-td2-2">
					<button class="qd-content-box-td2-2-button" id="listButton">リスト</button>
				</div>
				<!-- 댓글 -->
				<div class="qd-content-box-td3">
				<div class="qd-content-box-td3-1">
						<div class="qd-content-box-td3-1-1">이름 ${c_comemter_name}</div>
						<div class="qd-content-box-td3-1-2">작성일 </div>
					</div>
					<div class="qd-content-box-td3-2">
						<div class="qd-content-box-td3-2-1">
							<img alt=""
								src="${pageContext.request.contextPath}/user/qa/question/0.img/lock.png">
						</div>
						<div class="qd-content-box-td3-2-2">댓글 ${ c_comment_content}</div>
					</div>
				</div>
				<!-- 이전글/다음글 -->
				<div class="qd-content-box-td4" >
					<div class="qd-content-box-td4-1">
						<div class="qd-content-box-td4-1-1">前のページ</div>
							<div class="qd-content-box-td4-1-2">
							<a>
								글 제목
							</a>
							</div>
						</div>
					<div class="qd-content-box-td4-2">
						<div class="qd-content-box-td4-2-1">後のページ</div>
						<div class="qd-content-box-td4-2-2">
							<a>
								글 제목
							</a>
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

	</div>

</body>

<script type="text/javascript">
	document.getElementById("listButton").onclick = function() {
    window.location.href = "QuestionC";
  };	
</script>
</html>