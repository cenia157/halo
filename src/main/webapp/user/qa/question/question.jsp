<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      rel="stylesheet"
      href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
    />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/question/0.css/question.css">

</head>
<body>
	<!-- 헤더 -->
	<div class="container">
	      <div class="header-tbl">
	        <div>소개</div>
	        <div>소식</div>
	        <div>서비스</div>
	        <div>QnA</div>
	      </div>
      </div>
	
	
	
		<!-- 문의작성란 -->
	<div class="content-tbl">
		<div class="content-box-tr1">
			<div class="content-box-td1">
				<span class="content-box-td-content1">문의작성란</span>
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content2-1">작성자명* </span>
				<input class="content-box-td-content2-2" type="text">
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content3-1">휴대폰 번호*</span>
					<select class="content-box-td-content3-2" name="fruit" id="fruit">
			            <option value="apple">Apple</option>
			            <option value="banana">Banana</option>
			            <option value="orange">Orange</option>
			            <option value="grape">Grape</option>
			        </select>
				<input class="content-box-td-content3-3" type="text">
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content4-1">문의 카테고리</span>
					<select class="content-box-td-content4-2" name="fruit" id="fruit">
			            <option value="apple">Apple</option>
			            <option value="banana">Banana</option>
			            <option value="orange">Orange</option>
			            <option value="grape">Grape</option>
			        </select>
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content5-1">문의 제목*</span>
				<input class="content-box-td-content5-2" type="text">
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content6-1">문의 내용*</span>
				<input class="content-box-td-content6-2" type="text" value="문의내용">
			</div>
			<div class="content-box-td3">
				<span class="content-box-td-content7">*은 필수입력 사항입니다.</span>
			</div>
			
			
			<div class="content-box-td4">
				<button class="content-box-td-content8">확인</button>
			</div>
		</div>

		<!-- 문의글 게시판 -->
		<div class="content-box-tr2-1">
		<div class="content-box-tr2-2">
			<div class="content-box-td5">
				<span>문의글 게시판</span>
			</div>

			<div class="content-box-td6">
				<span class="content-box-td6-1">No</span>
				<span class="content-box-td6-2">글쓴이</span>
				<span class="content-box-td6-3">제목</span>
				<span class="content-box-td6-4">응답여부</span>
				<span class="content-box-td6-5">작성일</span>
			</div>
			<div class="content-box-td7">
				<span class="content-box-td7-1">No</span>
				<span class="content-box-td7-2">글쓴이</span>
				<span class="content-box-td7-3">제목</span>
				<span class="content-box-td7-4">응답여부</span>
				<span class="content-box-td7-5">작성일</span>
			</div>

		</div>
		</div>
		
	</div>

		<!-- 하단배너 -->
		
		 <div class="bottom-venner-tr">
	          <div class="bottom-venner-td">하단베너</div>
	          <div class="bottom-venner-td">상품판매링크</div>
	          <div class="bottom-venner-td">추가기능</div>
	     </div>

		<!-- footer -->
		<div class="footer-tbl">footer</div>
		
	
</body>
</html>