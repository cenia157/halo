<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>noticeMain</title>
<link rel="stylesheet" href="admin/boardmanagement/notice/0.css/noticeContent.css" />

<link href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" rel="stylesheet" />

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
		<!-- noticeBoard.jsp 시작 -->
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
					<div class="ontent-m-td-2-content-txt-no-in">${(loop.index + 1) + (curPageNo - 1) * 8}</div>
					<div class="ontent-m-td-2-content-txt-kategorie-in">${an.an_category }</div>
					<div class="ontent-m-td-2-content-txt-title-in"><a onclick="getNoticeViewData('${an.an_seq}')">${an.an_title }</a></div>
					<div class="ontent-m-td-2-content-txt-writer-in">${an.an_writer }</div>
					<div class="ontent-m-td-2-content-txt-date-in">${an.an_reg_date}</div>
					<div class="ontent-m-td-2-content-txt-delete-in">
					<button onclick="deleteNotice('${an.an_seq}')">削除</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- noticeBoard.jsp 끝 -->
		<div class="ontent-m-td-2-bottom">
			<div class="ontent-m-td-2-page-side"></div>
			<div class="ontent-m-td-2-page-center">
				<!--페이징시작 --><!--페이징시작 --><!--페이징시작 -->
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
					</c:if>
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
				<!-- 페이징끝 --><!-- 페이징끝 --><!-- 페이징끝 -->
			</div>
			<div class="ontent-m-td-2-page-side">
				<button class="SubmitButton-content" onclick="openModalNR()">등록하기</button>
			</div>
		</div>
		<!-- noticeNEWRegPage.jsp 시작 -->
		<div id="myModalNR" class="modal-background"></div>
		<form action="AdminNOTICEC" id="ck-form" method="get"> 
			<input  type="hidden" name="checkVal" value="${param.checkVal}">
			<input id="regBtnHiddenInput" type="hidden" value="${sessionScope.login_session.a_name}">
			<div id="myModal-tblNR" class="modal-tbl">
				<div class="modal-title-set">
					<div class="modal-title-tr">
						<div class="modal-title-td-1">
							<div class="real-title">
								<input class="real-title-editor" name="title"
									id="real-title-editor" placeholder="이곳에 제목을 입력하세요">
								<!-- 아래의 input은 ajax로 올라갔던 이미지의 실제 이름을 받기 위한 역할을 한다.
								type="hidden"을 삭제하고 이미지를 올려놓으면 올린 이미지의 경로+이름이 나온다. -->
								<div id="img-temporary"></div>
								<div class="real-title-select">
									<div class="toggle" id="toggle" onclick="toggle()">
										<div class="kategorie" id="kategorie">카테고리</div>
										<div class="toggle-down" id="toggle-down">
											<div class="toggle-down-block">
												<div class="toggle-item" id="announcement">
													<input name="announcement" type="hidden" id="myInput"
														value="announcement"> 안내
												</div>
												<div class="toggle-item" id="schedule">
													<input name="schedule" type="hidden" id="myInput"
														value="schedule"> 일정
												</div>
												<div class="toggle-item" id="general">
													<input name="general" type="hidden" id="myInput"
														value="general"> 일반
												</div>
												<div class="toggle-item" id="service">
													<input name="service" type="hidden" id="myInput"
														value="service"> 서비스
												</div>
												<div class="toggle-item" id="product">
													<input name="product" type="hidden" id="myInput"
														value="product"> 상품
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-title-td-2">
							<span class="close" id="closeModalBtn" onclick="closeModalNR()">&times;</span>
						</div>
					</div>
					<div class="modal-content">
						<div class="modal-content-txt">
							<textarea name="txt" id="classicNR" class="classicNR"></textarea>
						</div>
						<div class="modal-content-button">
							<input type="hidden" id="regBtnHiddenInput" value="">
							<button class="SubmitButton" type="button" id="reg-btn">등록완료</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- noticeNEWRegPage.jsp 끝 -->
		<!-- 조회 모달 페이지 jsp 시작 -->
		<div onclick="closeModalV()" id="myModalV" class="modal-background view-modal-background"></div>
				<div id="myModal-tblV" class="modal-tbl view-modal-tbl">
				<div class="modal-title-set">
				<div class="modal-title-tr">
					<div class="modal-title-td-1 viewModalHeader">
						<div class="real-title-V" id="real-title-V"></div>
						<div class="Display-Category-wrap"><div id="Display-Category"></div></div>
					</div>
					<div class="modal-title-td-2">
						<span class="close" id="closeModalBtn" onclick="closeModalV()">&times;</span>
					</div>
				</div>
				<div class="modal-content">
					<div class="modal-content-txt viewModal-content-txt">
						<div class="modal-content-txt-in viewModal-content-txt-in ck ck-content" id="modal-content-txt-in"></div>
					</div>
					<div class="modal-content-button">
						<button class="SubmitButton" id="aaaaaaaaaaaaaaaaaaaaaaaaaa">修正</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 조회 모달 페이지 jsp 끝 -->
		<!--noticeRegPage.jsp 시작 -->
		<div onclick="closeModalR()" id="myModalR"></div>
		<form id="ck-formR" method="post">
			<div id="myModal-tblR" class="modal-tbl closeRegModal">
				<div class="modal-title-set">
					<div class="modal-title-tr">
						<div class="modal-title-td-1 viewModalHeader">
							<input type="hidden" id="seq">
							<div class="real-title">
								<input class="real-title-editor" name="title"
									id="real-title-editorN" placeholder="이곳에 제목을 입력하세요">
								<div id="img-temporaryR" type="" style="background-color: aqua;"></div>
								<div class="real-title-select">
									<div class="toggle" id="toggleR" onclick="toggleR()">
										<div class="kategorie" id="kategorieR">카테고리</div>
										<div class="toggle-down" id="toggle-downR">
											<div class="toggle-down-block">
												<div class="toggle-item" id="announcement">
													<input name="announcement" type="hidden" id="myInputR"
														value="announcement"> 안내
												</div>
												<div class="toggle-item" id="schedule">
													<input name="schedule" type="hidden" id="myInputR"
														value="schedule"> 일정
												</div>
												<div class="toggle-item" id="general">
													<input name="general" type="hidden" id="myInputR"
														value="general"> 일반
												</div>
												<div class="toggle-item" id="service">
													<input name="service" type="hidden" id="myInputR"
														value="service"> 서비스
												</div>
												<div class="toggle-item" id="product">
													<input name="product" type="hidden" id="myInputR"
														value="product"> 상품
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-title-td-2">
							<span class="close" id="closeModalBtn" onclick="closeModalV()">&times;</span>
						</div>
					</div>
					<div class="modal-content">
						<div class="modal-content-txt">
							<textarea name="txt" id="classicR" class="classicR"></textarea>
						</div>
						<div class="modal-content-button">
							<button class="SubmitButton" type="button" id="reg-btnR">修正完了</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--noticeRegPage.jsp 끝 -->
	</div>
	<script src="admin/_js/ckeditor/ckeditor.js"></script>
	<script src="admin/boardmanagement/notice/0.js/noticeCommon.js"></script>
	<script src="admin/boardmanagement/notice/0.js/insertCKEditor.js"></script>
	<script src="admin/boardmanagement/notice/0.js/insertSendCkeditorC.js"></script>
	<script src="admin/boardmanagement/notice/0.js/updateCKEditor.js"></script>
	<script src="admin/boardmanagement/notice/0.js/updateSendCKeditorC.js"></script>
</body>
</html>