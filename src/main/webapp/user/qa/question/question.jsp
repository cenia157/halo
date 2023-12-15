<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question</title>
<link
      rel="stylesheet"
      href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
    />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/question/0.css/question.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/faq/0.css/index-banner.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">
</head>
<body>


<!-- 메뉴를 include -->
<%-- <%@ include file="index-menu.jsp" %> --%>
  

<!-- 메뉴를 include -->
<%-- <%@ include file="index-menu.jsp" %> --%>


		<!-- 문의작성란 -->
	<div class="q-content-tbl">
		<div class="q-content-box-tr1">
			<div class="q-content-box-td1">
				<span class="q-content-box-td-content1">문의작성란</span>
			</div>
			
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content2-1">작성자명* </span>
				<input class="q-content-box-td-content2-2" type="text">
			</div>
			
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content3-1">휴대폰 번호*</span>
					<select class="q-content-box-td-content3-2" name="tel" id="tel">
			            <option value="080">080</option>
			            <option value="090">090</option>
			            <option value="03">03</option>
			            <option value="045">045</option>
			            <option value="06">06</option>
			            <option value="052">052</option>
			            <option value="082">082</option>
			            <option value="092">092</option>
			        </select>
				<input class="q-content-box-td-content3-3" type="text">
			</div>
			
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content4-1">문의 카테고리</span>
					<select class="q-content-box-td-content4-2" name="question" id="questioncategory">
			            <option value="Q1">Q1</option>
			            <option value="Q2">Q2</option>
			            <option value="Q3">Q3</option>
			            <option value="Q4">Q4</option>
			        </select>
			</div>
			
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content5-1">문의 제목*</span>
				<input class="q-content-box-td-content5-2" type="text">
			</div>
			
			<div class="q-content-box-td2 content-box-td-content6">
				<span class="q-content-box-td-content6-1">문의 내용*</span>
				<textarea class="q-content-box-td-content6-2" type="text"></textarea>
			</div>
			<div class="q-content-box-td3">
				<span class="q-content-box-td-content7">*은 필수입력 사항입니다.</span>
			</div>
			
			
			<div class="q-content-box-td4">
				<button onclick="location.href='HC?link=10'" class="q-content-box-td-content8">확인</button>
			</div>
			
			<div>
				<img class="img1" alt="" src="${pageContext.request.contextPath}/user/qa/question/0.img/clover3.png">
				<img class="img2" alt="" src="${pageContext.request.contextPath}/user/qa/question/0.img/clover4.png">
			</div>
			
		</div>

		<!-- 문의글 게시판 -->

		<!-- content-box-tr1-td3 ::: display: flex wrap용 -->
          <div class="a_content-box-tr1-td3">
            <!-- 뒷 배경용 #FFEDAF -->
            <div class="a_content-box-tr1-td3-1">
              <div class="a_content-box-tr1-td3-1-1">
                <div class="a_content-box-tr1-td3-1-1-1">
                	
                	<div class="a_content-box-tr1-td3-1-1-1-txt">
                		<span>문의글 게시판</span>
                	</div>
                	
                  <!-- 타이블 첫 행 -->
                  <div class="a_content-box-tr1-td3-1-1-1-1">
                    <div class="a_content-box-tr1-td3-1-1-1-1-1 No-width">
                      <span>No</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-1-2 writer-width">
                      <span>글쓴이</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-1-3 title-width">
                      <span>제목</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-1-4 category-width">
                      <span>응답여부</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-1-5 reg-width">
                      <span>작성일</span>
                    </div>
                  </div>
                  <!-- 2번째 행 여기는 forEach문이겠죠?-->
                  <c:forEach  var="item" items="${yourList}">
	                  <div class="a_content-box-tr1-td3-1-1-1-2">
	                    <div class="a_content-box-tr1-td3-1-1-1-2-1 No-width">
	                      <span>${q_seq}</span>
	                    </div>
	                    <div class="a_content-box-tr1-td3-1-1-1-2-2 writer-width">
	                      <span>${q_name}</span>
	                    </div>
	                    <div class="a_content-box-tr1-td3-1-1-1-2-3 title-width">
	                      <span>${q_title}</span>
	                    </div>
	                    <div class="a_content-box-tr1-td3-1-1-1-2-4 category-width">
	                      <span>${q_answer}</span>
	                    </div>
	                    <div class="a_content-box-tr1-td3-1-1-1-2-5 reg-width">
	                      <span>${q_reg_date}</span>
	                    </div>
	                  </div>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
		</div>
		
	
</body>
</html>