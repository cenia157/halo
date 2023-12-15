<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>noticeEditPage</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/boardmanagement/notice/0.css/notice.css" />
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<div onclick="closeModalV()" id="myModalV" class="modal-background"></div>
	<div id="myModal-tblV" class="modal-tbl">
		<div class="modal-title-set">
			<div class="modal-title-tr">
				<div class="modal-title-td-1">
					<div class="real-title-V">민기해적단 팀인원 대거 탈주 계획</div>
				</div>
				<div class="modal-title-td-2">
					<span class="close" id="closeModalBtn" onclick="closeModalV()">&times;</span>
				</div>
			</div>
			<div class="modal-content">
				<div class="modal-content-txt">
					<div class="modal-content-txt-in">
						민기해적단 팀인원 대거 탈주 계획입니다. <br> 앞으로 민기해적단은 임금 미 지급시 12월 25일 노조연합을
						결성하여 솔데스크<br> 802호를 폭파시킬것으로 하루빨리 임금을 지불해 주기바람.
					</div>
				</div>
				<div class="modal-content-button">
					<button class="SubmitButton" onclick="openModalR()">수정</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>