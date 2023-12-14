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




<body>





	<div id="myModal" class="modal-background"></div>
	<div id="myModal-tbl" class="modal-tbl">
		<div class="modal-title-tr">
			<div class="modal-title-td-1">
				<div class="real-title">

					<input class="real-title-editor" placeholder="민기해적단 팀인원 대거 탈주 계획">


				</div>
			</div>
			<div class="modal-title-td-2">
				<span class="close" id="closeModalBtn" onclick="closeModal()">&times;</span>
			</div>

		</div>
		<div class="modal-content">
			<div class="modal-content-txt">
				<!-- 아래의 코드는 CK Editor 를 넣는 부분이다-->
				<div id="classic"></div>
			</div>
			<div class="modal-content-button">
				<button class="SubmitButton">수정완료</button>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	 <script>
        // 모달 열기
        function openModal() {
            document.getElementById('myModal').style.display = 'flex';
            document.getElementById('myModal-tbl').style.display = 'flex';
        }

        // 모달 닫기
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
            document.getElementById('myModal-tbl').style.display = 'none';
        }

        // 모달 외부 클릭 시 모달 닫기
        window.onclick = function(event) {
            if (event.target == document.getElementById('myModal')) {
                closeModal();
            }
        }
    </script>
    
    
    
    
    
    
    
    
    
    
    
	<script>
        ClassicEditor
            .create( document.querySelector( '#classic' ))
            .then( editor => {
			window.editor = editor;
			})
            .catch( error => {
                console.error( error );
            } );
    </script>
</body>
</html>