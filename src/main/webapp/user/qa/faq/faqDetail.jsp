<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/faqDetail.css">
</head>
<body>

	<!-- Answer -->
	<c:forEach items="${FAQ }" var="detail">
		<div class="faq-content-box-tr2">
			<div class="faq-content-box-td2-1">-ANSWER-</div>
			<div class="faq-content-box-td2-2">
				<span class="faq-content-box-td2-2-content-1">Q. ${detail.qa_title}</span>
				<span class="faq-content-box-td2-2-content-2">A. ${detail.qa_content}</span>
			</div>
		</div>
	</c:forEach>

</body>
</html>