<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/faqDetail.css">
</head>
<body>

	<!-- Answer -->
	<div class="faq-content-box-tr2">
		<div class="faq-content-box-td2-1">-ANSWER-</div>
		<div class="faq-content-box-td2-2">
			<span class="faq-content-box-td2-2-content-1">Q. ${qa_title}</span>
			<span class="faq-content-box-td2-2-content-2">A. ${qa_content}</span>
		</div>
	</div>

</body>
</html>