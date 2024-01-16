<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>noticeEditPage</title> 
</head>

<body>
	<div onclick="closeModalR()" id="myModalR"></div>
	<form id="ck-formR" method="post">
		<div id="myModal-tblR" class="modal-tbl closeRegModal">
			<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1 viewModalHeader">
						<input type="hidden" id="seq">
						<div class="real-title">
							<input class="real-title-editor" name="title"
								id="real-title-editorN" placeholder="이곳에 제목을 입력하세요">
							<!-- 아래의 input은 ajax로 올라갔던 이미지의 실제 이름을 받기 위한 역할을 한다.
							type="hidden"을 삭제하고 이미지를 올려놓으면 올린 이미지의 경로+이름이 나온다. -->
							<div id="img-temporaryR" type="hidden" style="background-color: aqua;"></div>
							<div class="real-title-select">
								<div class="toggle" id="toggleR" onclick="toggleR()">
									<div class="kategorie" id="kategorieR">카테고리</div>
									<div class="toggle-down" id="toggle-downR">
										<div class="toggle-down-block">
											<div class="toggle-item" id="announcement">
												<input name="announcement" type="hidden" id="myInputR"
													value="announcement"> 안내
											</div>
											<div class="toggle-item" id="schedule">
												<input name="schedule" type="hidden" id="myInputR"
													value="schedule"> 일정
											</div>
											<div class="toggle-item" id="general">
												<input name="general" type="hidden" id="myInputR"
													value="general"> 일반
											</div>
											<div class="toggle-item" id="service">
												<input name="service" type="hidden" id="myInputR"
													value="service"> 서비스
											</div>
											<div class="toggle-item" id="product">
												<input name="product" type="hidden" id="myInputR"
													value="product"> 상품
											</div>
										</div>
									</div>
								</div>
								<script src="admin/boardmanagement/notice/0.js/noticeToggleR.js"></script>
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
						<textarea name="txt" id="classicR" class="classicR"></textarea>
					</div>
					<div class="modal-content-button">

						<button class="SubmitButton" type="button" id="reg-btnR">修正完了</button>

					</div>
				</div>
			</div>
		</div>
	</form>
	<script src="admin/boardmanagement/notice/0.js/updateCKEditor.js" type="module"></script>
	<script src="admin/boardmanagement/notice/0.js/ValidationItems.js"></script>
	<script src="admin/boardmanagement/notice/0.js/SendCkeditorC2.js"></script>
	<script src="admin/_js/test2.js"></script>
	<script src="admin/_js/ckeditor/ckeditor.js"></script>
	<script src="admin/_js/noticeUpdateAndOpenView.js"></script>
</body>
</html>