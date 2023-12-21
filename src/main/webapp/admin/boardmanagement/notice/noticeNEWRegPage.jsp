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









								<div class="AAAA" style="background-color: aqua; width: 10%;">카테고리 설정</div>
								<div class="BBBB" style="background-color:fuchsia ; width: 10%; display: none ;">
									<div class="CCCC" >안내</div>
									<div>일aaa정</div>
									<div>일반</div>
									<div>서비스</div>
									<div>상품</div>
								</div>









<script type="text/javascript">
let menuTi = $('.AAAA')

menuTi.click(function() {
	$('.BBBB').css("display", "flex")
})

	
	
</script>






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
<!-- 						<textarea name="txt" id="classicNR"></textarea> -->
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