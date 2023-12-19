<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${pageContext.request.contextPath}/admin/0.js/ckeditor.js"></script>
<title>Frequenthyask</title>





<link rel="stylesheet" href="admin/0.css/test copy.css" />
<link rel="stylesheet"
	href="admin/boardmanagement/frequenthyask/0.css/frequenthyask.css" />

<script src="admin/0.js/test2.js"></script>
<script src="admin/0.js/test.js"></script>





<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>










    <script>
        function onPageLoad() {
            const currentTime = new Date().toLocaleString();
            localStorage.setItem('lastVisitTime', currentTime);

            
            // AJAX를 사용하여 서블릿에 데이터 전송
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'Localstorage', true);

            // 사용자의 IP 주소를 서블릿으로 전송
            xhr.setRequestHeader('X-Forwarded-For', getUserIpAddress());

            xhr.send();
        }

        function getUserIpAddress() {
        	
        	
        	
        	
        	
            // 사용자의 IP 주소를 추출하는 코드
            // 실제로는 정확한 IP 주소를 추출하기 어렵기 때문에 예시로 단순히 "unknown"을 반환합니다.
            return "unknown";
        }

        window.onload = onPageLoad;
    </script>










</head>

<body>
	<h1>쿠키 생성</h1>

	<p></p>
	<button onclick="onPageLoad()">지우기</button>
	<input type="text" name="" id="">





</body>
</html>