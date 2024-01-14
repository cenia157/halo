<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Mainpage</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/homepageSetting/mainpage/0.css/mainpage.css" />

<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<!-- js -->
		<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/homepageSetting/mainpage/0.js/mainpage.js"></script>

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	
</head>

<body>
	<div class="content-m-td-3">
<form action="MainBannerUpdateC" method="post">
		<div class="content-m-td-3-up">
			<!-- 여긴 공간채움용 빈공간 -->
		</div>
		<div class="content-m-td-3-mid-1">

			<div class="content-m-td-3-mid-1-tr">
				<div class="content-m-td-3-mid-1-td">
					<div class="content-m-td-3-mid-1-td-box">채용공고</div>
				</div>
				<div class="content-m-td-3-mid-1-td">
					<div class="content-m-td-3-mid-1-td-box">신청</div>
				</div>
				<div class="content-m-td-3-mid-1-td">
					<div class="content-m-td-3-mid-1-td-box">문의</div>
				</div>
			</div>
		</div>
		<div class="content-m-td-3-mid-2">

			<div class="content-m-td-3-mid-2-tr">

				<div class="content-m-td-3-mid-2-tr-underbar">
					<select class="main-banner-select" name="main_banner_box1">
						<option value="info_com">회사소개</option>
						<option value="info_map">오시는길</option>
						<option value="intro_announce">공지사항</option>
						<option value="intro_album">앨범</option>
						<option value="intro_employ">채용공고</option>
						<option value="service_info">서비스안내</option>
						<option value="service_apply">서비스신청</option>
						<option value="faq">자주묻는질문</option>
						<option value="question">문의게시판</option>
					</select>
				</div>
				<div class="content-m-td-3-mid-2-tr-underbar">
					<select class="main-banner-select" name="main_banner_box2">
						<option value="info_com">회사소개</option>
						<option value="info_map">오시는길</option>
						<option value="intro_announce">공지사항</option>
						<option value="intro_album">앨범</option>
						<option value="intro_employ">채용공고</option>
						<option value="service_info">서비스안내</option>
						<option value="service_apply">서비스신청</option>
						<option value="faq">자주묻는질문</option>
						<option value="question">문의게시판</option>
					</select>
				</div>
				<div class="content-m-td-3-mid-2-tr-underbar">
					<select class="main-banner-select" name="main_banner_box3">
						<option value="info_com">회사소개</option>
						<option value="info_map">오시는길</option>
						<option value="intro_announce">공지사항</option>
						<option value="intro_album">앨범</option>
						<option value="intro_employ">채용공고</option>
						<option value="service_info">서비스안내</option>
						<option value="service_apply">서비스신청</option>
						<option value="faq">자주묻는질문</option>
						<option value="question">문의게시판</option>
					</select>
				</div>
			</div>
		</div>
		<div class="content-button">
			<button>변경</button>
		</div>
		</form>
	</div>

</body>

</html>