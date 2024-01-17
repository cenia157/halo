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
			        <button class="faq-content-box-td1-2-content loadButton" id="showModalBtn" onclick="loadFAQDetailContent('${qa.qa_seq}')">● ${qa.qa_title }</button>
			        <input name="qa_seq" hidden="1">
		    	</c:forEach>
		    </div>
		</div>
		
	    <!-- 로드된 파일이 나타날 컨테이너 -->
		<div class="faqDetailContainer" id="FAQModal">
			<jsp:include page="/user/qa/faq/faqDetail.jsp"></jsp:include>
		</div>
    

	</div>
	

</body>

    <script>
 // 평소에는 숨겨진 상태로 설정
// 평소에는 숨겨진 상태로 설정
document.getElementById("FAQModal").style.display = "none";

// 모든 FAQ 버튼에 대한 이벤트 처리
var faqButtons = document.querySelectorAll(".faq-content-box-td1-2-content");
faqButtons.forEach(function(button) {
  button.addEventListener("click", function() {

    //FAQModal의 내용물 보이기
    document.getElementById("FAQModal").style.display = "flex";

	let modal = document.getElementById("FAQModal");
	
	// "FAQModal"까지 내리기 시도
    function ScrollTo() {
		window.scrollTo(0, modal.offsetTop);
	}
	
	// 스크롤 애니메이션 시작
    setTimeout(ScrollTo, 500);
  });
});



        
    </script>
    
</html>