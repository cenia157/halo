<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 팝업 css -->
<style type="text/css">

*{
  margin: 0;
  padding: 0;
}

.popup-container {
	border: 2px solid blue;
	width: 580px;
	height: 740px;
}

</style>
</head>
<body>
	<h1>Popup Page</h1>
	<div class="popup-container" style="background-image: url('${pageContext.request.contextPath}/user/upload_imgs/popupImg/popup_poster.png');">
	aaaa
	</div>
	
</body>
</html>