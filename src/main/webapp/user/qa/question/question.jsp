<%@ page import="java.util.List" %>
<%@ page import="com.halo.user.qa.question.Question" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%@ page import="java.util.Collections" %>
<%@ page import="com.halo.user.qa.question.QuestionDAO.QuestionComparator" %>




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


<script>
    // 페이지 로드가 완료된 후 실행
    document.addEventListener('DOMContentLoaded', function() {
        // 페이징 버튼에 대한 클릭 이벤트 리스너 등록
        document.querySelectorAll('.page-link').forEach(function(button) {
            button.addEventListener('click', function(event) {
                // 기본 동작인 페이지 이동을 막음
                event.preventDefault();
                
                // 여기에 페이징 버튼을 클릭했을 때 수행할 동작을 추가
                // 예: 페이지 내용 로드, 페이지 이동 등
                // 클릭된 버튼의 href 속성에서 페이지 URL을 가져옴
                var targetPage = this.getAttribute('href');
            });
        });
    });
    
    
    
</script>

</head>
<body>

		<!-- 문의작성란 -->
	<div class="q-content-tbl">
		<form action="QuestionC" method="post">
		<div class="q-content-box-tr1">
			<div class="q-content-box-td1">
				<span class="q-content-box-td-content1">お問い合わせフォーム</span>
			</div>
			
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content2-1">作成者* </span>
				<input class="q-content-box-td-content2-2" type="text" name="q_name"/>
			</div>

<!-- tel -->
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content3-1">電話番号*</span>
				<input class="q-content-box-td-content3-2" type="text" name="q_contact_number"/>
			</div>
<!-- category -->
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content4-1">カテゴリー*</span>
					<select class="q-content-box-td-content4-2" id="questioncategory" name="q_category">
			            <option value="Q1">Q1</option>
			            <option value="Q2">Q2</option>
			            <option value="Q3">Q3</option>
			            <option value="Q4">Q4</option>
			        </select>
			</div>
<!-- title -->
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content5-1">タイトル*</span>
				<input class="q-content-box-td-content5-2" type="text" name="q_title"/>
			</div>
<!-- e-mail -->
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content6-1">E-mail </span>
				<input class="q-content-box-td-content6-2" type="text" name="q_email"/>
			</div>
<!-- pw -->
			<div class="q-content-box-td2">
				<span class="q-content-box-td-content7-1">　パスワード </span>
				<input class="q-content-box-td-content7-2" type="text" name="q_password"/>
			</div>
<!-- txt -->
			<div class="q-content-box-td2 content-box-td-content8">
				<span class="q-content-box-td-content8-1">お問い合わせ内容*</span>
				<textarea class="q-content-box-td-content8-2" type="text" name="q_content"></textarea>
			</div>
			<div class="q-content-box-td3">
				<span class="q-content-box-td-content9">*は必ずお書きください。</span>
			</div>
			
<!-- submit -->
			
				<div class="q-content-box-td4">
					<button class="q-content-box-td-content10">확인</button>
				</div>
			
<!-- img -->
			<div>
				<img class="img1" alt="" src="${pageContext.request.contextPath}/user/qa/question/0.img/clover3.png">
				<img class="img2" alt="" src="${pageContext.request.contextPath}/user/qa/question/0.img/clover4.png">
			</div>
		</div>
			</form>

		<!-- 문의글 게시판 -->


		<!-- content-box-tr1-td3 ::: display: flex wrap용 -->
          <div class="q_content-box-tr1-td3">
            <!-- 뒷 배경용 #FFEDAF -->
            <div class="q_content-box-tr1-td3-1">
              <div class="q_content-box-tr1-td3-1-1">
                <div class="q_content-box-tr1-td3-1-1-1">
                	
                	<div class="q_content-box-tr1-td3-1-1-1-txt">
                		<span>掲示板</span>
                	</div>
                	
                  <!-- 타이블 첫 행 -->
                  <div class="q_content-box-tr1-td3-1-1-1-1">
                    <div class="q_content-box-tr1-td3-1-1-1-1-1 No-width">
                      <span>No</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-2 writer-width">
                      <span>作成者</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-3 title-width">
                      <span>タイトル</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-4 answer-width">
                      <span>応答</span>
                    </div>
                    <div class="q_content-box-tr1-td3-1-1-1-1-5 reg-width">
                      <span>作成日時</span>
                    </div>
                  </div>
                  
                  
                  
                  <!-- 2번째 행 여기는 forEach문이겠죠?-->
					<c:forEach items="${resultList}" var="question">
					    <div class="q_content-box-tr1-td3-1-1-1-2">
			                    <div class="q_content-box-tr1-td3-1-1-1-2-1 No-width">
			                      <span>${question.q_seq}</span>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-2 writer-width">
			                      <span>${question.q_name}</span>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-3 title-width">
			                      <a href="QuestionDetailC?q_seq=${question.q_seq}">${question.q_title}</a>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-4 answer-width">
			                    	<c:choose>
						                <c:when test="${question.c_answer eq '1'}">
						                    完
						                </c:when>
						                <c:otherwise>
						                    未
						                </c:otherwise>
						            </c:choose>
			                    </div>
			                    <div class="q_content-box-tr1-td3-1-1-1-2-5 reg-width">
			                      <span>${question.q_reg_date}</span>
			                    </div>
					    </div>
					</c:forEach>
					
					<!-- Pagination -->
					<nav aria-label="Page navigation example">
					    <ul class="pagination">
					        <c:forEach var="page" begin="1" end="5">
					            <li class="page-item ${page == currentPage ? 'active' : ''}">
					                <a class="page-link" href="?currentPage=${page}">●</a>
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