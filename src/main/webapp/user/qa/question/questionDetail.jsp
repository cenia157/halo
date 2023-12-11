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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/question/0.css/questionDetail.css">

</head>
<body>

	<table class="content-tbl">
		<!-- 문의글 게시판 (디테일) -->
		<tr class="content-box-tr">
	<!-- 본문 -->
			<td class="content-box-td">
				<span>제목</span>
				<span>제목 내용</span>
			</td>
			
			<td class="content-box-td">
				<span>작성자</span>
				<span>작성자 이름</span>
			</td>
			
			<td class="content-box-td">
				<span>작성일: </span>
				<span>작성일 내용</span>
			</td>
			
			<td class="content-box-td">
				<span>본문 내용</span>
			</td>
			
			<td class="content-box-td"> <button>목록</button> </td>
	<!-- 댓글 -->
			<td class="content-box-td">
				<span>이름/작성일</span>
				<span>댓글본문</span>
			</td>
	<!-- 이전글/다음글 -->
			<td class="content-box-td">
				<span>이전글</span>
				<span>글 제목</span>
			</td>
			<td class="content-box-td">
				<span>다음글</span>
				<span>글 제목</span>
			</td>
			<td class="content-box-td">
				<span>그 밖의 문의사항은 Tel.06-6997-6531 로 연락 부탁드립니다.</span>
			</td>
		</tr>
	
	</table>

</body>
</html>