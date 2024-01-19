<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>notice</title>
</head>
<body>
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
		<c:forEach items="${NOTICEs}" var="an" varStatus="loop">
			<div class="ontent-m-td-2-content-txt-in">
				<input hidden="1" name="aq_seq" value="${an.an_seq }">
				<div class="ontent-m-td-2-content-txt-no-in">${(loop.index + 1) + (curPageNo - 1) * 8}
				</div>
				<div class="ontent-m-td-2-content-txt-kategorie-in">${an.an_category }</div>
				<div class="ontent-m-td-2-content-txt-title-in">
					<a onclick="getNOTICEDataV('${an.an_seq}')">${an.an_title }</a>
				</div>
				<div class="ontent-m-td-2-content-txt-writer-in">${an.an_writer }</div>
				<div class="ontent-m-td-2-content-txt-date-in">${an.an_reg_date}</div>
				<div class="ontent-m-td-2-content-txt-delete-in">
					<button onclick="deleteNotice('${an.an_seq}')">削除</button>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>