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
<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>
<body>
	<div onclick="closeModalE()" id="myModalR"></div>
	<div id="myModal-tblR" class="modal-tbl">
		<div class="modal-title-set">
			<div class="modal-title-tr">
				<div class="modal-title-td-1">
					<div class="real-title">
						<input class="real-title-editor" placeholder="민기해적단 팀인원 대거 탈주 계획">
						<div class="real-title-select">
							<select>
								<option value="">안내</option>
								<option value="">일정</option>
								<option value="">일반</option>
								<option value="">서비스</option>
								<option value="">상품</option>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-title-td-2">
					<span class="close" id="closeModalBtn" onclick="closeModalR()">&times;</span>
				</div>
			</div>
			<div class="modal-content">
				<div class="modal-content-txt">
					<!-- 아래의 코드는 CK Editor를 넣는 부분이다-->
					<div id="classicR"></div>
					<!-- 아래의 스크립트 코드는 CK Editor를 불러오는 부분이다-->
					<script>
						ClassicEditor
						.create(document.querySelector('#classicR'))
						.then(editor => {
								window.editor = editor;
								})
						.catch(error => {
								console.error(error);
								});
				</script>
				</div>
				<div class="modal-content-button">
					<button class="SubmitButton" onclick="closeModalR()">수정완료</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>