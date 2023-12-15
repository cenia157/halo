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




	<div onclick="closeModalNR()" id="myModalNR" class="modal-background"></div>
	<div id="myModal-tblNR" class="modal-tbl">
		<div class="modal-title-set">
			<div class="modal-title-tr">







				<div class="modal-title-td-1">












					<div class="real-title" >
						<input class="real-title-editor" placeholder="이곳에 제목을 입력하세요">

						<div class="real-title-select">
							<select>
								<option>안내</option>
								<option>일정</option>
								<option>일반</option>
								<option>서비스</option>
								<option>상품</option>
							</select>

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
					<div id="classicNR"></div>
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
					<button class="SubmitButton" onclick="closeModalNR()">등록완료</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>