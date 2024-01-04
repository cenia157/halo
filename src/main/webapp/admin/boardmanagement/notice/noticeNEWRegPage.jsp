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
	<div id="myModalNR" class="modal-background"></div>
	<form id="ck-form" method="post">
		<div id="myModal-tblNR" class="modal-tbl">
			<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1">
						<div class="real-title">
							<input class="real-title-editor" name="title"
								id="real-title-editor" placeholder="이곳에 제목을 입력하세요">
							<!-- 아래의 input은 ajax로 올라갔던 이미지의 실제 이름을 받기 위한 역할을 한다.
							type="hidden"을 삭제하고 이미지를 올려놓으면 올린 이미지의 경로+이름이 나온다. -->







							<div id="img-temporary"></div>







							<div class="real-title-select">
								<div class="toggle" id="toggle" onclick="toggle()">
									<div class="kategorie" id="kategorie">카테고리</div>
									<div class="toggle-down" id="toggle-down">
										<div class="toggle-down-block">
											<div class="toggle-item" id="announcement">
												<input name="announcement" type="hidden" id="myInput"
													value="announcement"> 안내
											</div>
											<div class="toggle-item" id="schedule">
												<input name="schedule" type="hidden" id="myInput"
													value="schedule"> 일정
											</div>
											<div class="toggle-item" id="general">
												<input name="general" type="hidden" id="myInput"
													value="general"> 일반
											</div>
											<div class="toggle-item" id="service">
												<input name="service" type="hidden" id="myInput"
													value="service"> 서비스
											</div>
											<div class="toggle-item" id="product">
												<input name="product" type="hidden" id="myInput"
													value="product"> 상품
											</div>
										</div>
									</div>
								</div>
								<script
									src="admin/boardmanagement/notice/0.js/noticeToggle.js"></script>
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
						<textarea name="txt" id="classicNR" class="classicNR"></textarea>
					</div>
					<div class="modal-content-button">

						<button class="SubmitButton" type="button" id="reg-btn"
							onclick="noValue()">등록완료</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- 아래의 스크립트는 CKEditor에 올라온 이미지를 ajax로 올리는 역할이다
	추가로 아마 위의 스크립트의 경로를 다음과 같이 바꿔야 할 것 같다. 이건 단영씨와 합치고 난 뒤에 하자, 이름도 바꾸고...
	admin/_js/ImageAjax.js -->
	<script src="admin/boardmanagement/notice/0.js/testMZ.js"
		type="module"></script>
		
	<!-- 아래의 스크립트는 오류방지용 -->
	<script src="admin/boardmanagement/notice/0.js/ValidationItems.js"></script>

	<!-- 여기는 CKEditor에 들어간 값을 서버로 보내는 역할이다 -->
	<script src="admin/boardmanagement/notice/0.js/SendCkeditorC.js"></script>


</body>
</html>