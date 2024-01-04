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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="user/qa/faq/0.js/user_faq.js"></script>
</head>
<body>



	<!-- 본문 -->
	<div class="faq-content-tbl">
	
	<!-- 자주묻는 질문 -->
	<div class="faq-content-box-tr1">
	    <div class="faq-content-box-td1-1">よくある質問</div>
	    <div class="faq-content-box-td1-2">
	    	<c:forEach items="${FAQs}" var="qa">
		        <button class="faq-content-box-td1-2-content loadButton" onclick="loadFAQDetailContent('${qa.qa_seq}')">● ${qa.qa_title }</button>
		        <input name="qa_seq" hidden="1">
	    	</c:forEach>
<!-- 	        <button class="faq-content-box-td1-2-content loadButton" data-target="faqDetail2">● 서비스 이용 비용은 어느정도인가요?</button> -->
<!-- 	        <button class="faq-content-box-td1-2-content loadButton" data-target="faqDetail3">● 서비스 신청을 취소하려면 어떻게 해야하나요?</button> -->
<!-- 	        <button class="faq-content-box-td1-2-content loadButton" data-target="faqDetail4">● 여기에 없는 질문은 어디에 해야하나요?</button> -->
	    </div>
	</div>
	
    <!-- 로드된 파일이 나타날 컨테이너 -->
	<div class="faqDetailContainer">
	</div>
    

	</div>
	

</body>
</html>