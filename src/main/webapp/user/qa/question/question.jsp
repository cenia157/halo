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

	<table class="content-tbl">
	
		<!-- 문의작성란 -->
		<tr class="content-box-tr">
			<td class="content-box-td">
				<span>문의작성란</span>
				<input type="text">
			</td>
			
			<td class="content-box-td">
				<span>작성자명</span>
				<input type="text">
			</td>
			
			<td class="content-box-td">
				<span>휴대폰 번호</span>
					<select name="fruit" id="fruit">
			            <option value="apple">Apple</option>
			            <option value="banana">Banana</option>
			            <option value="orange">Orange</option>
			            <option value="grape">Grape</option>
			        </select>
				<input type="text">
			</td>
			
			<td class="content-box-td">
				<span>문의 카테고리</span>
					<select name="fruit" id="fruit">
			            <option value="apple">Apple</option>
			            <option value="banana">Banana</option>
			            <option value="orange">Orange</option>
			            <option value="grape">Grape</option>
			        </select>
			</td>
			
			<td class="content-box-td">
				<span>문의 제목</span>
				<input type="text">
			</td>
			
			<td class="content-box-td">
				<span>문의내용</span>
				<input type="text" value="문의내용">
			</td>
			
			<td class="content-box-td">
				<span>*은 필수입력 사항입니다.</span>
			</td>
			
			<td class="content-box-td">
				<button>확인</button>
			</td>
		</tr>

		<!-- 문의글 게시판 -->
		<tr class="content-box-tr">

			<td class="content-box-td">
				<span>문의글 게시판</span>
			</td>

			<td class="content-box-td">
				<span>문의글 리스트 (foreach 사용)</span>
			</td>

		</tr>

		<!-- 하단배너 -->
		<tr></tr>
		
	</table>
	
</body>
</html>