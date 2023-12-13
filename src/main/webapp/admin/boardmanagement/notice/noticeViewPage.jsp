<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>noticeEditPage</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/0.css/test.css" />


<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/boardmanagement/notice/0.css/notice.css" />



<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>




<body>






							<div id="myModal" class="modal-background"></div>
							<div class="modal-tbl">

								<div class="modal-title-tr">
									<div class="modal-title-td-1">
										<div class="modal-title-td-1-title">
											<div class="real-title-view">민기해적단 팀인원 대거 탈주 계획</div>
										</div>
										<div class="modal-title-td-1-con">
											<div class="modal-title-td-1-detile">2023-12-25 大出 昭子</div>
											<div class="modal-title-td-1-detile">일반</div>
										</div>
									</div>
									<div class="modal-title-td-2">
										<span class="close" id="closeModalBtn">&times;</span>
									</div>

								</div>
								<div class="modal-content" >
									<div class="modal-content-txt" >

<textarea class="noticeViewPageTextarea" rows="" cols="" ></textarea>


									</div>
									<div class="modal-content-button" >
										<button class="EditCompleted">수정</button>
									</div>
								</div>
							</div>


</body>
</html>