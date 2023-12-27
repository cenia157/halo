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
	<form class="ck-form" method="post">
		<div id="myModal-tblNR" class="modal-tbl">
			<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1">
						<div class="real-title">
							<input class="real-title-editor" name="title"
								id="real-title-editor" placeholder="이곳에 제목을 입력하세요">
							<div class="real-title-select">
								<!--  -->
								<!-- 
								<select name="select">
									<option value="announcement">안내</option>
									<option value="schedule">일정</option>
									<option value="general">일반</option>
									<option value="service">서비스</option>
									<option value="product">상품</option>
								</select>
 -->
								<div class="toggle" id="toggle" onclick="toggle()">
									<div class="kategorie" id="kategorie">카테고리</div>
									<div class="toggle-down" id="toggle-down">
										<div class="toggle-down-block">
											<div class="toggle-item" id="aaaa">
												<input name="announcementA" type="hidden" id="myInput"
													value="announcement"> 안내
											</div>
											<div class="toggle-item" id="일정">
												<input name="scheduleA" type="hidden" id="myInput"
													value="schedule"> 일정
											</div>
											<div class="toggle-item" id="일반">
												<input name="generalA" type="hidden" id="myInput"
													value="general"> 일반
											</div>
											<div class="toggle-item" id="서비스">
												<input name="serviceA" type="hidden" id="myInput"
													value="service"> 서비스
											</div>
											<div class="toggle-item" id="상품">
												<input name="productA" type="hidden" id="myInput"
													value="product"> 상품
											</div>
										</div>
									</div>
								</div>
								<script src="admin/boardmanagement/notice_test/0.js/notice.js"></script>
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

<script type="module" src="admin/boardmanagement/notice_test/0.js/testJW.js"></script>





					</div>
					<div class="modal-content-button">
						<button class="SubmitButton" type="submit" id="reg-btn"
							onclick="noValue()">등록완료</button>
					</div>
				</div>
			</div>
		</div>
	</form>




	<!-- 	
	여기 아래는 ajax 예시
	<script type="text/javascript">
    function fetchPage(name) {
        fetch(name).then(function (response) {
          response.text().then(function (text) {
            document.querySelector('article').innerHTML = text;
          })
        })
      }
	</script>
	 -->
	<script type="text/javascript">
		 let ckForm = document.querySelector('.ck-form');
		 console.log(ckForm);
		
		 ckForm.addEventListener("submit", function(event){
	     event.preventDefault(); // 기본 submit 동작 방지
	     
		 const content = window.editor.getData();
		 const formData = new FormData(event.target);
		 const payload = new URLSearchParams(formData);
		 console.log('3333333333333333333333333331111111111111111')
		 for (var pair of formData.entries()) {
		        console.log(pair[0] + ': ' + pair[1]);
		    }
		 console.log('3333333333333333333333333331111111111111111')		 
		 let CkeditorC123 = fetch('CkeditorC',  {
		        method: 'POST',
		        body: payload,
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded', // 헤더 설정
		        }
		    })
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            return response.text();
	        })
	        .then(data => {
	            console.log('POST 요청 성공:', data);
	            console.log(CkeditorC123);
	        })
	        .catch(error => {
	            console.error('POST 요청 실패:', error);
	        });
		});
</script>


	asd








</body>
</html>