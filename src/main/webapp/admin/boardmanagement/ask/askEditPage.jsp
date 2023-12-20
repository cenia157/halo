<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ask</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<div onclick="closeModalA()" id="myModalA" class="modal-background"></div>
	<div id="myModal-tblA" class="modal-tbl">







		<div class="modal-title-set">
			<div class="modal-title-tr">
				<div class="modal-title-td-1">
					<div class="real-title">
						<div class="real-title-up">${questions.q_title}</div>
						<div class="real-title-down">
							<div class="real-title-down-L">
								<div class="real-title-down-contain">${questions.q_reg_date}</div>
								<div class="real-title-down-contain">답변완료</div>
							</div>
							<div class="real-title-down-R">
								<div class="real-title-down-contain">
									<!-- 질문한 사람 (임시) -->
									大出 昭子
								</div>
								<div class="real-title-down-contain">
									<!-- 답변한 사람 (임시) -->
									大出 昭子
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-title-td-2">
					<span onclick="closeModalA()" class="close" id="closeModalBtn">&times;</span>
				</div>
			</div>
			<div class="modal-content">
				<div class="modal-content-txt">
					<div class="modal-content-txt-question">
						<!-- 여기에 고객이 질문한 문의사항을 띄우는 곳 -->
						<jsp:include page="askEditPageCustomerQuestion.jsp"></jsp:include>
					</div>
					<div class="modal-content-txt-response">
						<textarea class="Edit-textarea" rows="" cols=""
							placeholder="여기에 과거에 관리자가 고객에게 답변했던 내용을 표시"></textarea>
					</div>
				</div>
				<div class="modal-content-button">
					<button class="SubmitButton" onclick="closeModalA()">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>