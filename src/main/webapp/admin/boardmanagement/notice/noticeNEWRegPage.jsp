<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>noticeEditPage</title>

















<link rel="stylesheet"
	href="admin/boardmanagement/notice/0.css/notice.css" />
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>




<body>

	<div onclick="closeModalNR()" id="myModalNR" class="modal-background"></div>
	<div id="myModal-tblNR" class="modal-tbl">
		<form class="ck-form" method="post">
			<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1">
						<div class="real-title">
							<input class="real-title-editor" name="title"
								placeholder="이곳에 제목을 aaasdaa입력하세요">
							<div class="real-title-select">
								<!--  -->







								<div class="toggle" id="toggle" onclick="asd()">
									<div class="kategorie" id="kategorie">카테고리</div>
									<div class="toggle-down" id="toggle-down">
										<div class="toggle-down-block">
											<div class="toggle-item" id="aaaa">안내</div>
											<div class="toggle-item" id="일정">일정</div>
											<div class="toggle-item" id="일반">일반</div>
											<div class="toggle-item" id="서비스">서비스</div>
											<div class="toggle-item" id="상품">상품</div>
										</div>
									</div>
								</div>




								<script src="admin/boardmanagement/notice/0.js/notice.js"></script>



								<!--  -->
							</div>
						</div>
					</div>
					<div class="modal-title-td-2">
						<span class="close" id="closeModalBtn" onclick="closeModalNR()">&times;</span>
					</div>
				</div>

				<div class="modal-content">
					<div class="modal-content-txt">
						<!-- 아래의 코드는 CK Editor를 넣는 부분이다-->
						<textarea name="txt" id="classicNR"></textarea>
						<!-- 아래의 스크립트 코드는 CK Editor를 불러오는 부분이다-->
						<script>
						ClassicEditor
						.create(document.querySelector('#classicNR'))
						.then(editor => {
								window.editor = editor;
								})
						.catch(error => {
								console.error(error);
								});
						
						
				</script>
					</div>
					<div class="modal-content-button">
						<button class="SubmitButton" type="submit" id="reg-btn">등록완료</button>
					</div>
				</div>
			</div>
		</form>
	</div>




</body>
</html>