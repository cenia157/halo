<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/faq.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/faqDetail.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/index-banner.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">
	
	<script>
        $(document).ready(function() {
            // 버튼 클릭 이벤트
            $(".loadButton1").click(function() {
                // faqDetail.jsp 파일을 로드하여 #faqDetailContainer에 추가
                $("#faqDetailContainer").load("faqDetail.jsp");
            });
        });
    </script>
</head>
<body>



	<!-- 본문 -->
	<div class="faq-content-tbl">
	
	<!-- 자주묻는 질문 -->
	<div class="faq-content-box-tr1">
		<div class="faq-content-box-td1-1">자주 묻는 질문</div>
		<div class="faq-content-box-td1-2">
			<button class="faq-content-box-td1-2-content" id="loadButton1">● 제공되는 서비스를 이용하려면 어떻게 해야하나요?</button>
			<button class="faq-content-box-td1-2-content" id="loadButton2">● 서비스 이용 비용은 어느정도인가요?</button>
			<button class="faq-content-box-td1-2-content" id="loadButton3">● 서비스 신청을 취소하려면 어떻게 해야하나요?</button>
			<button class="faq-content-box-td1-2-content" id="loadButton4">● 여기에 없는 질문은 어디에 해야하나요?</button>
		</div>
	</div>
	
    <!-- 로드된 파일이 나타날 컨테이너 -->
	<div class="faqDetailContainer">
	</div>
    

	</div>
	

</body>
</html>