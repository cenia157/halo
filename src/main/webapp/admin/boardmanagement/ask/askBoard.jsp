<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Ask</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />

</head>
<body>
	<div class="ontent-m-td-2-content">
		<!-- 아마 여기서 for Each문을 써서 DB에서 값을 가져와 게시판을 표현해야 할 것 같다 -->
		<div class="ontent-m-td-2-content-container">
			<div class="ontent-m-td-2-content-txt">
				<div class="ontent-m-td-2-content-txt-no">No</div>
				<div class="ontent-m-td-2-content-txt-kategorie">카테고리</div>
				<div class="ontent-m-td-2-content-txt-title">제목</div>
				<div class="ontent-m-td-2-content-txt-writer">작성자</div>
				<div class="ontent-m-td-2-content-txt-date">작성일자</div>
				<div class="ontent-m-td-2-content-txt-delete"></div>
			</div>
		</div>
		<div class="ontent-m-td-2-mid">
<!-- 			foreach문 추가 -->

			<c:forEach items="${resultList}" var="item">
			    <div class="ontent-m-td-2-content-txt-in">
			    	<input hidden="1" name="q_seq" value="${item.q_seq}">
			        <div class="ontent-m-td-2-content-txt-no-in">${item.q_seq}</div>
			        <div class="ontent-m-td-2-content-txt-kategorie-in">
						<c:choose>
			                <c:when test="${item.c_answer eq '1'}">
			                    完
			                </c:when>
			                <c:otherwise>
			                    未
			                </c:otherwise>
			            </c:choose>
			        </div>
				        <div class="ontent-m-td-2-content-txt-title-in">
			            <a onclick="getData('${item.q_seq}');">${item.q_title}</a>
				        </div>
			        <div class="ontent-m-td-2-content-txt-writer-in">${item.q_name}</div>
			        <div class="ontent-m-td-2-content-txt-date-in">${item.q_reg_date}</div>
			        <div class="ontent-m-td-2-content-txt-delete-in">
			            <a onclick="deleteQuestion(${item.q_seq})">삭제하기</a>
			        </div>
			    </div>
			</c:forEach>

		</div>
	</div>
</body>

<script src="admin/_js/test2.js"></script>
<script src="admin/_js/test.js"></script>
</html>