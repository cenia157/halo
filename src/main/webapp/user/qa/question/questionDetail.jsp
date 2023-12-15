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
					<div class="qd-content-box-td1-2-2">제목 내용</div>
				</div>

				<div class="qd-content-box-td1-3">
					<div class="qd-content-box-td1-3-1">作成者</div>
					<div class="qd-content-box-td1-3-2">작성자 이름</div>
				</div>

				<div class="qd-content-box-td1-4">
					<div class="qd-content-box-td1-4-content">
						<span class="qd-content-box-td1-4-1">作成日時</span> <span
							class="qd-content-box-td1-4-2">작성일 내용</span>
					</div>
					<div class="qd-content-box-td-button">
						<button class="qd-content-box-td-button-2">削除 X</button>
					</div>
				</div>

				<!-- 본문 -->
				<div class="qd-content-box-td2-1">
					<div class="qd-content-box-td2-1-content">
						안녕하세요, 부모님을 위한 개호 택시 서비스에 관심이 있어, 문의 드립니다. <br> 부모님이 편안한 이동을
						위해 장애인 택시 예약 서비스를 알아보려고 하는데요. <br> 평일 중 2일과 주말 1일을 정기적으로 한 달
						동안 이용하는 것이 가능한지 궁금합니다. <br> 부모님의 편의를 생각해서 가능한 빠른 답변 부탁드립니다.
						다음 주에도 가능하다면 좋겠어요. <br> <br> 부모님을 위한 편리한 이동이라는 목적으로 서비스를
						검토 중이니, <br> 어떤 혜택이나 특별한 안내사항이 있는지도 함께 알려주시면 감사하겠습니다. <br>
					</div>
				</div>

				<div class="qd-content-box-td2-2">
					<button class="qd-content-box-td2-2-button">목록</button>
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
						<div class="qd-content-box-td4-1-1">이전글</div>
							<div class="qd-content-box-td4-1-2">
							<a>
								글 제목
							</a>
							</div>
						</div>
					<div class="qd-content-box-td4-2">
						<div class="qd-content-box-td4-2-1">다음글</div>
						<div class="qd-content-box-td4-2-2">
							<a>
								글 제목
							</a>
						</div>
					</div>
				</div>
				<div class="qd-content-box-td4-3">
					<div class="qd-content-box-td4-3-1">
						그 밖의 문의사항은 <br> Tel.06-6997-6531 로 연락 부탁드립니다.
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>

	</div>

</body>
</html>