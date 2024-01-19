<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 팝업 css -->
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.popup-container {
	border: 2px solid blue;
	width: 580px;
	height: 780px;
}
.popup-content {
	width: 580px;
	height: 740px;
}
.popup-down{
	width: 50%;
	padding-left: 50%;
	display: flex;
	justify-content: space-around;
	
}
</style>
</head>
<body>
		<div class="popup-container">
		<div class="popup-content" onclick="movePage()"
			style="background-image: url('${pageContext.request.contextPath}/user/upload_imgs/popupImg/popup_poster.png');">
		</div>
		<div class="popup-down">
		<div class="popup-input">
		오늘 하루 보지않기<input type="checkbox"></div>
		<div><button onclick="getCurrentDate()">닫기</button></div>
		</div>
		</div>

</body>
<script type="text/javascript">

//팝업창div클릭시 해당 페이지 이동
function movePage(){
	alert(11);
	window.opener.location.href='../../Employment_C';
	//페이지 이동시 팝업 닫기
	window.close();
}

//다른 메뉴 페이지로 이동시(포커스 해제==블러) 팝업 자동닫기
// window.addEventListener("blur", function() {
//     self.close();
// });

//현재날짜 구하는
function getCurrentDate() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0');//한자리수는 앞에 0붙임
    const day = String(now.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`; //YYYY-MM-DD 형식의 문자열 반환
    console.log(`${year}-${month}-${day}`);
}

</script>

</html>