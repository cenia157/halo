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
</style>
</head>
<body>
		<div class="popup-container">
		<div class="popup-content" onclick="movePage()"
			style="background-image: url('${pageContext.request.contextPath}/user/upload_imgs/popupImg/popup_poster.png');">
		</div>
		오늘 하루 보지않기<input type="checkbox">
		</div>

</body>
<script type="text/javascript">
//팝업창div클릭시 해당 페이지 이동
function movePage(){
	alert(11);
//	window.document.location.href=page;
	window.opener.location.href='../../Employment_C';
	window.close();
}
//다른 메뉴 페이지로 이동시(포커스 해제==블러) 팝업 자동닫기
window.addEventListener("blur", function() {
    self.close();
});
</script>

</html>