<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>

<body>
		<div class="content-tbl">
			<div class="content-space"></div>
			<div class="content-sec">
				<jsp:include page="${subMenu  }"></jsp:include> 
			</div>
			<div class="bottom-venner-tr">
				<div class="bottom-venner-td">하단베너</div>
				<div class="bottom-venner-td">상품판매링크</div>
				<div class="bottom-venner-td">추가기능</div>
			</div>
		</div>
</body>

</html>