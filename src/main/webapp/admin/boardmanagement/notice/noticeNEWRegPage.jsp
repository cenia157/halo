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
	<!-- 기존 등록 모달 시작 -->
	<div id="myModalNR" class="modal-background regModal-background "></div>
	<form action="AdminNOTICEC" id="ck-form" method="get">
		<input type="hidden" name="checkVal" value="${param.checkVal}">
		<div id="myModal-tblNR" class="modal-tbl regModal-tbl">
			<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1">
						<div class="real-title">
							<input class="real-title-editor" name="title"
								id="real-title-editor" placeholder="이곳에 제목을 입력하세요">
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
								<script src="admin/boardmanagement/notice/0.js/noticeToggle.js"></script>
								<!--  -->
							</div>
						</div>
					</div>
					<div class="modal-title-td-2">
						<span class="close closeModalBtn" id="closeModalBtn" onclick="closeRegModal()">&times;</span>
					</div>
				</div>
				<div class="modal-content">
					<div class="modal-content-txt">
						<!-- CK Editor 연동-->
						<textarea name="txt" id="classicNR" class=connect_regModal_ckEditor></textarea>
					</div>
					<div class="modal-content-button">

						<button class="SubmitButton" type="button" id="reg-btn"
							onclick="noValue()">등록완료</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 기존 등록 모달 끝 -->
	<!-- 추가 조회 모달 시작-->
	<div id="myModalNR2" class="modal-background selectModal"></div>
	<form action="AdminNOTICEC" id="ck-form" method="get">
		<input type="hidden" name="checkVal" value="${param.checkVal}">
		<div id="myModal-tblNR2" class="modal-tbl selectModal-tbl">
			<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1">
						<div class="real-title">
							<input class="real-title-editor showModalTitleColum" name="title"
								id="real-title-editor" placeholder="이곳에 제목을 입력하세요">
							<div id="img-temporary"></div>
							<div class="real-title-select">
								<div class="toggle" id="toggle" onclick="toggle()">
									<div class="kategorie showCategoryColum" id="kategorie">카테고리</div>
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
								<script src="admin/boardmanagement/notice/0.js/noticeToggle.js"></script>
								<!--  -->
							</div>
						</div>
					</div>
					<div class="modal-title-td-2">
						<span class="close closeModalBtn" id="closeModalBtn" onclick="closeSelectModal()">&times;</span>
					</div>
				</div>
				<div class="modal-content">
					<div class="modal-content-txt">
						<!-- CK Editor 연동-->
						<textarea name="txt" class="connect_viewmodal_ckEditor"></textarea>
					</div>
					<div class="modal-content-button">

						<button class="SubmitButton" type="button" id="reg-btn"
							onclick="noValue()">등록완료</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 추가 조회 모달 끝-->
	<script src="admin/boardmanagement/notice/0.js/testMZ.js" type="module"></script>
	<script src="admin/boardmanagement/notice/0.js/ValidationItems.js"></script>
	<script src="admin/boardmanagement/notice/0.js/SendCkeditorC.js"></script>
</body>
</html>