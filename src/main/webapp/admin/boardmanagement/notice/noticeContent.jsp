<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>notice</title>


<link rel="stylesheet"
	href="admin/boardmanagement/notice/0.css/notice.css" />
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />

</head>
<body>
	<input type="hidden" id="pageNum" value="${pageNum }">
	<input type="hidden" id="updateSEQ" value="${seq }">
	<div class="ontent-m-td-2-chackbox">
		<div class="ontent-m-td-2-chackbox-contain">
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="noticeCheck" class="noticeCheck" value="0" onclick="noticeSearch()">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">안내</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="noticeCheck" class="noticeCheck" value="1" onclick="noticeSearch()">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">일정</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="noticeCheck" class="noticeCheck" value="2" onclick="noticeSearch()">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">일반</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="noticeCheck" class="noticeCheck" value="3" onclick="noticeSearch()">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">서비스</div>
			<div class="ontent-m-td-2-chackbox-contain-input">
				<input type="checkbox" name="noticeCheck" class="noticeCheck" value="4" onclick="noticeSearch()">
			</div>
			<div class="ontent-m-td-2-chackbox-contain-txt">상품</div>
		</div>
	</div>
	<div class="ontent-m-td-2-content">
		<!-- 아래의 include는 게시판 보드가 담겨있다 -->
		<jsp:include page="noticeBoard.jsp"></jsp:include>
		<div class="ontent-m-td-2-bottom">
			<div class="ontent-m-td-2-page-side"></div>
			<div class="ontent-m-td-2-page-center">

				<!-- 					페이징처리 해야할 부분 -->
				<!--페이징시작 -->
				<div class="paging-div">
					<!-- 처음으로 가는 버튼 -->
					<c:choose>
						<c:when test="${curPageNo > 5}">
							<a href="NoticePagingC?p=${curPageNo - 5}&checkVal=${param.checkVal}">
								<button>&lt;&lt;</button>
							</a>
						</c:when>
						<c:when test="${curPageNo <= 5 && curPageNo > 1}">
							<a href="NoticePagingC?p=1&checkVal=${param.checkVal}">
								<button>&lt;&lt;</button>
							</a>
						</c:when>
						<c:otherwise>
							<button disabled>&lt;&lt;</button>
						</c:otherwise>
					</c:choose>

					<!-- 이전 페이지로 가는 버튼 -->
					<c:choose>
						<c:when test="${curPageNo > 1}">
							<a href="NoticePagingC?p=${curPageNo - 1}&checkVal=${param.checkVal}">
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

					<c:forEach var="pageNumber" begin="${startPage}" end="${endPage}">

						<c:set var="currentPageClass"
							value="${pageNumber == curPageNo ? 'current-page' : ''}" />
						<!-- 버튼 모양 결정 -->
						<a href="NoticePagingC?p=${pageNumber}&checkVal=${param.checkVal}"
							class="page-number ${currentPageClass}">
							[ ${pageNumber} ] </a>
					</c:forEach>
					<!-- 페이지 번호 생성 끝 -->

					<!-- 다음 페이지로 가는 버튼 -->
					<c:choose>
						<c:when test="${curPageNo < pageCount}">
							<a href="NoticePagingC?p=${curPageNo + 1}&checkVal=${param.checkVal}">
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
							<a href="NoticePagingC?p=${curPageNo + 5}&checkVal=${param.checkVal}">
								<button>&gt;&gt;</button>
							</a>
						</c:when>
						<c:when
							test="${curPageNo + 5 > pageCount && curPageNo < pageCount}">
							<a href="NoticePagingC?p=${pageCount}&checkVal=${param.checkVal}">
								<button>&gt;&gt;</button>
							</a>
						</c:when>
						<c:otherwise>
							<button disabled>&gt;&gt;</button>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 페이징끝 -->





			</div>
			<div class="ontent-m-td-2-page-side">
				<button class="SubmitButton-content" onclick="openModalNR()">등록하기</button>
			</div>
		</div>
		<!-- 
			여기는 모달을 띄워주는 곳, 
			새로운 공지사항을 등록하기 위한 모달(noticeNEWRegPage.jsp)			
			기존의 공지사항을 보기 위한 모달(noticeViewPage.jsp)
			기존의 공지사항을 수정 위한 모달(이 모달은 noticeViewPage에서 include됨)(noticeRegPage.jsp)
		-->
		<jsp:include page="noticeNEWRegPage.jsp"></jsp:include>
		<jsp:include page="noticeViewPage.jsp"></jsp:include>
		<jsp:include page="noticeRegPage.jsp"></jsp:include>
	</div>
</body>
<test>
</html>