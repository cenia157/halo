<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/faq.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/index-banner.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">
</head>
<body>

<!-- 메뉴를 include -->
<%-- <%@ include file="index-menu.jsp" %> --%>


	<!-- 본문 -->
	<div class="content-tbl">
	
	<!-- 자주묻는 질문 -->
	<div class="content-box-tr1">
		<div class="content-box-td1-1">자주 묻는 질문</div>
		<div class="content-box-td1-2">
			<span class="content-box-td1-2-content">● 제공되는 서비스를 이용하려면 어떻게 해야하나요?</span>
			<span class="content-box-td1-2-content">● 서비스 이용 비용은 어느정도인가요?</span>
			<span class="content-box-td1-2-content">● 서비스 신청을 취소하려면 어떻게 해야하나요?</span>
			<span class="content-box-td1-2-content">● 여기에 없는 질문은 어디에 해야하나요?</span>
		</div>
	</div>
	
	<!-- Answer -->
	<div class="content-box-tr2">
		<div class="content-box-td2-1">-ANSWER-</div>
		<div class="content-box-td2-2">
			<span class="content-box-td2-2-content">Q. (질문 내용)</span>
			<span class="content-box-td2-2-content">A. (질문 답변)</span>
		</div>
	</div>

	</div>
	

	<!-- 하단배너 -->
	
	 <div class="bottom-venner-tr">
          <div class="bottom-venner-td">하단베너</div>
          <div class="bottom-venner-td">상품판매링크</div>
          <div class="bottom-venner-td">추가기능</div>
     </div>

	<!-- footer include -->
<%-- 	<%@ include file="index-footer.jsp" %> --%>

</body>
</html>