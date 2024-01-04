<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="admin/_js/ckeditor.js"></script>
<script src="admin/_js/ckeditor/ckeditor.js"></script>

<title>Frequenthyask</title>





<link rel="stylesheet" href="admin/0.css/test copy.css" />
<link rel="stylesheet"
	href="admin/boardmanagement/frequenthyask/0.css/frequenthyask.css"/>

<script src="admin/_js/test2.js"></script>
<script src="admin/_js/test2.js"></script>
<script src="admin/_js/test.js"></script>





<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<div class="ontent-m-td-2-chackbox"></div>
	<!-- 아래의 div는 No부터 버튼을 포함함 구조는 (No 카테고리 제목 ...) (8888... 7777.... ) (버튼) 이 세개가 블록으로 쌓여있다 -->
	<div class="ontent-m-td-2-content">
		<div class="ontent-m-td-2-content-container">
			<div class="ontent-m-td-2-content-txt">
				<div class="ontent-m-td-2-content-txt-no">No</div>
				<div class="ontent-m-td-2-content-txt-title" id="Title_css">제목</div>
				<div class="ontent-m-td-2-content-txt-date">수정일자</div>
				<div class="ontent-m-td-2-content-txt-delete"></div>
			</div>
		</div>
		<div class="ontent-m-td-2-mid">
<!-- 			<div class="ontent-m-td-2-content-txt-in"> -->
<!-- 				<div class="ontent-m-td-2-content-txt-no-in">8</div> -->
<!-- 				<div class="ontent-m-td-2-content-txt-title-in"> <a onclick="openModalF()">● 이곳을 누르면 모달이 뜬다</a> </div> -->
<!-- 				<div class="ontent-m-td-2-content-txt-date-in">8</div> -->
<!-- 				<div class="ontent-m-td-2-content-txt-delete-in"></div> -->
<!-- 			</div> -->
<!-- 			<div class="ontent-m-td-2-mid"> -->
			<c:forEach items="${FAQs}" var="qa" varStatus="loop">
				<div class="ontent-m-td-2-content-txt-in">
					<input hidden="1" name="qa_seq" value="${qa.qa_seq }">
					<div class="ontent-m-td-2-content-txt-no-in"> ${(loop.index + 1) + (curPageNo -1) * 8 } </div>
					<div class="ontent-m-td-2-content-txt-title-in" id="Title_css"> <a onclick="getFAQData('${qa.qa_seq}')">● ${qa.qa_title } </a> </div>
					<div class="ontent-m-td-2-content-txt-date-in">${qa.qa_reg_date}</div>
					<div class="ontent-m-td-2-content-txt-delete-in"> <button>삭제하기</button> </div>
				</div>
			</c:forEach>
<!-- 			</div> -->
		</div>
		<div class="ontent-m-td-2-bottom">
			<div class="ontent-m-td-2-page-side"></div>
			<div class="ontent-m-td-2-page-center">
<!-- 			페이징 추가 예정 -->

				<div class="paging-div">
                  <!-- 처음으로 가는 버튼 -->
                  <c:choose>
                    <c:when test="${curPageNo > 5}">
                      <a href="FAQPagingC?p=${curPageNo - 5}">
                        <button><<</button>
                      </a>
                    </c:when>
                    <c:when test="${curPageNo <= 5 && curPageNo > 1}">
                      <a href="FAQPagingC?p=1">
                        <button><<</button>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <button disabled><<</button>
                    </c:otherwise>
                  </c:choose>

                  <!-- 이전 페이지로 가는 버튼 -->
                  <c:choose>
                    <c:when test="${curPageNo > 1}">
                      <a href="FAQPagingC?p=${curPageNo - 1}">
                        <button>이전</button>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <button disabled>이전</button>
                    </c:otherwise>
                  </c:choose>

                  <!-- 페이지 번호 생성 시작 -->
                  <c:set var="pageSize" value="5" />
                  <c:set var="startPage" value="${curPageNo - 2}" />
                  <c:set var="endPage" value="${curPageNo + 2}" />
                  <!-- 시작 페이지와 끝 페이지 계산 -->

					<c:if test="${startPage < 1}">
					    <c:set var="startPage" value="1" />
					    <c:set var="endPage" value="${startPage + 4}" />
					    <!-- 시작 페이지가 1보다 작으면 1로 설정하고 끝 페이지를 조정 -->
					</c:if>

<!-- 이부분 문제 -->
                  <c:if test="${endPage > pageCount}">
                    <c:set var="endPage" value="${pageCount}" />
                    <c:choose>
                    	<c:when test="${endPage - 4}>0">
                    		<c:set var="startPage" value="${endPage - 4}" />
                    	</c:when>
                    	<c:when test="${endPage - 4}<=0">
                    		<c:set var="startPage" value="1" />
                    	</c:when>
                    </c:choose>
                    <!-- 끝 페이지가 페이지 수를 넘으면 끝 페이지를 페이지 수로 설정하고 시작 페이지를 조정 -->
                  </c:if>
<!-- 경고 -->

                  <c:forEach
                    var="pageNumber"
                    begin="${startPage}"
                    end="${endPage}"
                  >
                  
                    <c:set
                      var="currentPageClass"
                      value="${pageNumber == curPageNo ? 'current-page' : ''}"
                    />
					<!-- 버튼 모양 결정 -->
                    <a
                      href="FAQPagingC?p=${pageNumber}"
                      class="page-number ${currentPageClass}"
                      >
                      [ ${pageNumber} ]
                      </a>
                  </c:forEach>
                  <!-- 페이지 번호 생성 끝 -->

                  <!-- 다음 페이지로 가는 버튼 -->
                  <c:choose>
                    <c:when test="${curPageNo < pageCount}">
                      <a href="FAQPagingC?p=${curPageNo + 1}">
                        <button>다음</button>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <button disabled>다음</button>
                    </c:otherwise>
                  </c:choose>

                  <!-- 마지막으로 가는 버튼 -->
                  <c:choose>
                    <c:when test="${curPageNo + 5 <= pageCount}">
                      <a href="FAQPagingC?p=${curPageNo + 5}">
                        <button>>></button>
                      </a>
                    </c:when>
                    <c:when
                      test="${curPageNo + 5 > pageCount && curPageNo < pageCount}"
                    >
                      <a href="FAQPagingC?p=${pageCount}">
                        <button>>></button>
                      </a>
                    </c:when>
                    <c:otherwise>
                      <button disabled>>></button>
                    </c:otherwise>
                  </c:choose>
                </div>
                <!-- 페이징끝 -->
			</div>
			<div class="ontent-m-td-2-page-side">
<!-- 			등록버튼 추가 예정 -->
			
			</div>
		</div>
		<!-- 여기는 모달을 띄워주는 곳, 
			자주묻는 질문의 내용을 변경하기 위한 곳(frequenthyaskEditPage.jsp)-->
		<jsp:include page="frequenthyaskEditPage2.jsp"></jsp:include>
	</div>
</body>
</html>