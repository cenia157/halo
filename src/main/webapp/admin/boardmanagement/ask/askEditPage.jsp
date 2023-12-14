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

	<div id="myModal" class="modal-background"></div>
	<div class="modal-tbl">

		<div class="modal-title-tr">
			<div class="modal-title-td-1">



				<div class="real-title">

					<div class="real-title-up">

						<!-- 이곳에 고객의 문의 제목을 띄워야한다 -->
						● 제공되는 서비스를 이용하려면 어떻게 해야되나요?aaa


					</div>

					<div class="real-title-down">

						<div class="real-title-down-L">
							<div class="real-title-down-contain">


								<!-- 이곳에 고객의 문의 날짜를 띄워야한다 -->
								2023-12-25

							</div>
							<div class="real-title-down-contain">

								<!-- 이곳에 고객의 문의에 답변/미답변 여부를 띄워야한다 -->
								미답변

							</div>
						</div>

						<div class="real-title-down-R">
							<div class="real-title-down-contain">

								<!-- 이곳에 고객의 문의 작성자를 띄워야한다 -->
								大出 昭子

							</div>
						</div>

					</div>

				</div>





			</div>
			<div class="modal-title-td-2">
				<span class="close" id="closeModalBtn">&times;</span>
			</div>

		</div>
		<div class="modal-content">
			<div class="modal-content-txt">

				<div class="modal-content-txt-question">

					<!-- 여기에 고객이 질문한 문의사항을 띄우는 곳 -->
					<jsp:include page="askEditPageCustomerQuestion.jsp"></jsp:include>


				</div>
				<div class="modal-content-txt-response">


					<textarea class="modal-content-txt-response-textarea" rows=""
						cols="" placeholder="이곳에 답변을 넣으세요
네 그렇습니다 민기해적단은 항상 10시까지남아 모두가 해적왕이 되기위하여 열심히 일을 하고 있습니다. 
*여기는 아직 대답하지 않은 고객의 질문에 대답하는 공간*"></textarea>





				</div>

			</div>
			<div class="modal-content-button">
				<button class="SubmitButton">답변하기</button>
			</div>
		</div>
	</div>








</body>
</html>