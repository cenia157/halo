<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
    // 실제 데이터의 총 갯수를 대체하기 위한 임시 데이터 생성 (실제로는 데이터베이스에서 가져와야 함)
    List<String> dataList = new ArrayList<>();
    for (int i = 1; i <= 97; i++) {
        dataList.add("Data " + i);
    }

    // 데이터의 총 갯수 계산
    int totalItems = dataList.size();

    // 총 페이지 수 계산
    int totalPages = (int) Math.ceil((double) totalItems / 7);

    // 현재 페이지 파라미터 가져오기
    String currentPageParam = request.getParameter("currentPage");
    int currentPage = (currentPageParam != null) ? Integer.parseInt(currentPageParam) : 1;

    // 마지막 페이지 동적 계산
    int lastPage = (totalPages > 0) ? totalPages : 1;

    // 현재 페이지가 마지막 페이지를 초과하는 경우 마지막 페이지로 설정
    if (currentPage > lastPage) {
        currentPage = lastPage;
    }
%>
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
          <div class="q_content-box-tr1-td3">
            <!-- 뒷 배경용 #FFEDAF -->
            <div class="q_content-box-tr1-td3-1">
              <div class="q_content-box-tr1-td3-1-1">
                <div class="q_content-box-tr1-td3-1-1-1">
                	
                	<div class="q_content-box-tr1-td3-1-1-1-txt">
                		<span>문의글 게시판</span>
                	</div>
                	
                  <!-- 타이블 첫 행 -->
                  <div class="q_content-box-tr1-td3-1-1-1-1">
                    <div class="q_content-box-tr1-td3-1-1-1-1-1 No-width">
                      <span>No</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-2 writer-width">
                      <span>글쓴이</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-3 title-width">
                      <span>제목</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-4 answer-width">
                      <span>응답여부</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-5 reg-width">
                      <span>작성일</span>
                    </div>
                  </div>
                  <!-- 2번째 행 여기는 forEach문이겠죠?-->
                  
                  
                  
					<c:forEach var="i" begin="1" end="7">
					    <div class="q_content-box-tr1-td3-1-1-1-2">
					        <!-- your content here -->
					        <%--                   <c:forEach  var="question_tbl" items="${question_tbl}"> --%>
<%-- 							<c:forEach var="i" begin="1" end="20"> --%>
<!-- 			                  <div class="q_content-box-tr1-td3-1-1-1-2"> -->
			                    <div class="q_content-box-tr1-td3-1-1-1-2-1 No-width">
			                      <span>No ${q_seq}</span>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-2 writer-width">
			                      <span>Name ${q_name}</span>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-3 title-width">
			                      <span>Title ${q_title}</span>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-4 answer-width">
			                      <span>Answer ${q_answer}</span>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-5 reg-width">
			                      <span>date ${q_reg_date}</span>
			                    </div>
<!-- 			                  </div> -->
<%-- 		                  </c:forEach> --%>
					        
					    </div>
					</c:forEach>
					
					<!-- Pagination -->
					<nav aria-label="Page navigation example">
					    <ul class="pagination">
					        <c:forEach var="page" begin="1" end="${lastPage}">
					            <li class="page-item ${page == currentPage ? 'active' : ''}">
					                <a class="page-link" href="?currentPage=${page}">${page}</a>
					            </li>
					        </c:forEach>
					    </ul>
					</nav>

<!-- Bootstrap JS (required for pagination) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


                  
                  </div>

                </div>
              </div>
            </div>
          </div>
		</div>
		
	
</body>
</html>