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







<div id="img-temporary">











							
</div>







							<div class="real-title-select">
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
								<script
									src="admin/boardmanagement/notice_test/0.js/noticeToggle.js"></script>
								<!--  -->
							</div>
						</div>
					</div>
					<div class="modal-title-td-2">
						<span style="width: 100%;" class="close" id="closeModalBtn" onclick="closeModalNR()">&times;</span>
					</div>
				</div>
				<div class="modal-content">
					<div class="modal-content-txt">
						<!-- 아래의 코드는 CK Editor를 넣는 부분이다-->
						<textarea name="txt" id="classicNR" class="classicNR"></textarea>
					</div>
					<div class="modal-content-button">

						<button class="SubmitButton" type="button" id="reg-btn"
							onclick="noValue()">등aaa록완료</button>
						<!-- 여기는 필수 입력값을 안넣었을 때 거부하는 부분이다 (아직 미완성, 마지막에 할 예정)-->
						<!-- <script
							src="admin/boardmanagement/notice_test/0.js/ValidationItems.js"></script> -->
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- 아래의 스크립트는 CKEditor에 올라온 이미지를 ajax로 올리는 역힐이다-->
	<script type="module"
		src="admin/boardmanagement/notice_test/0.js/testMZ.js"></script>
	<!-- 여기는 CKEditor에 들어간 값을 서버로 보내는 역할이다 -->
	<script type="text/javascript">
	let regBtn = document.querySelector('#reg-btn');
	regBtn.addEventListener("click", function(event) {
		let ckForm = document.querySelector('#ck-form');
		const content = window.editor.getData();
		const formData = new FormData(ckForm);
		formData.set('txt', content);
		console.log('--------------------')
		console.log(content)
		console.log(formData);
		const payload = new URLSearchParams(formData);
		console.log(payload)
		for (var pair of formData.entries()) {
			console.log(pair[0] + ': ' + pair[1]);
		}
		console.log('--------------------')
		let CkeditorC123 = fetch('CkeditorC', {
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

	<script>
	$(document).ready(function(){
		
	   	let figure;
	   	let saveFname;
		
	    $('.ck-content').on('click', function(e){
	   		figure = $(".ck-content figure img");
	   		saveFname = $("input[name='saveFname']");
	    	$(figure).each(function(i) {
				$(figure[i]).attr('test', i);
				$(saveFname[i]).attr('test', i);
			});    
	    }); // on
	    
	    
	    $('.ck-content').on('keyup', function(e){
	    
	        	if(e.key == 'Backspace' || e.key == 'Delete'){
	        		console.log(e.key);
			   		figure = $(".ck-content figure img");
	   				saveFname = $("input[name='saveFname']");
					let check = [];
					let check2 = [];
	   				$(saveFname).each(function(i) {
						check.push($(saveFname[i]).attr('test'));
						check2.push($(figure[i]).attr('test'));
					});   	
	   				let difference = check.filter(item => !check2.includes(item));
	   				console.log('삭제될difference 변수 ::: ' + difference);
	   				
	   				$(saveFname[difference]).remove();
	
	   		        
	   		    }  // if   
	    });	// keyup
	    
	    
	//     $('.ck-content').on('keydown', function(e){
	    	
	//         let beforeImgIdx = $('.ck-content figure.ck-widget_type-around_show-fake-caret_before').index('figure')
	//         console.log('Selected beforeImgIdx :::' + beforeImgIdx);
	//         console.log('-----------------------------------------');
	//         let afterImgIdx = $('.ck-content figure.ck-widget_type-around_show-fake-caret_after').index('figure')
	//         console.log('Selected afterImgIdx :::' + afterImgIdx);
	//         console.log('-----------------------------------------');
	//         let imgIdx = $('.ck-content figure.ck-widget_selected').index('figure');
	//         console.log('Selected imgIdx ::: ' + imgIdx);
	//         console.log('-----------------------------------------');
	        
	//         if(imgIdx >= 0 && $('figure > img').length > 0){
	
	        	
	//         	if(e.key == 'Backspace' || e.key == 'Delete'){
	        		
	        	
	        	
	//         	}
	        	
	        	
	//         	if(e.key == 'Backspace'){
	//             	let figure = $(".ck-content figure");
	//             	let saveFname = $("input[name='saveFname']");
	            	
	// 				$(figure).each(function(i,fi) {
	// // 				$('input[name="saveFname"]').eq(figure.length + 1).remove();
	// 				});	
	// 				console.log(figure); 
	// 				console.log(figure.length); 
	//         	}
	        	
	        	
	        	
	        	
	        	
	        	
	        	
	            // 'Delete' 키가 눌렸을 때
	//             if(e.key === 'Delete'){
	            	
	            	
	            	
	//                 // 'before' 클래스가 있을 때만 제거
	//                 if(beforeImgIdx >= 0){
	//                 	imgIdx = beforeImgIdx;
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Delete (before class)::: ' + imgIdx);
	//                     imgIdx = undefined;
	//                     e.preventDefault(); 
	                    
	                    
	//                 }
	//                 // 'before'도 'after'도 없을 때 제거
	//                 else if(!(afterImgIdx>=0)){
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Delete (no specific class)::: ' + imgIdx);
	//                     imgIdx = undefined; 
	//                     e.preventDefault(); 
	//                 }
	//             }
	//             // 'Backspace' 키가 눌렸을 때
	//             if(e.key === 'Backspace'){
	//                 // 'after' 클래스가 있을 때만 제거
	//                 if(afterImgIdx >= 0){
	//                 	imgIdx = afterImgIdx;
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Backspace (after class)::: ' + imgIdx);
	//                     imgIdx = undefined; 
	//                     e.preventDefault(); 
	//                 }
	//                 // 'before'도 'after'도 없을 때 제거
	//                 else if(!(beforeImgIdx>=0) && !(afterImgIdx>=0)){
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Backspace (no specific class)::: ' + imgIdx);
	//                     imgIdx = undefined; 
	//                     e.preventDefault(); 
	//                 }
	                
	//                 else if(beforeImgIdx >= 0 && ($(".ck-content figure").length == $("input[name='saveFname']").length)) {
	//                     imgIdx = beforeImgIdx - 1;
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     imgIdx = undefined; 
	//                     e.preventDefault(); 
	//                 }
	                
	//             }
	//         }
	//     });
	});
	</script>

</body>
</html>