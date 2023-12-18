<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>banner</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/homepageSetting/banner/0.css/banner.css" />


<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<!-- 하단배너 설정 담당 -서효원- -->
	<div class="content-m-td-3">
		<!-- 		<div class="filebox"> -->
		<!-- 			<input class="bannerInput" value="" placeholder="첨부파일"> <label -->
		<!-- 				for="file">파일찾기</label> <input type="file" id="file"> -->
		<!-- 		</div> -->
		
		<div class="banner-tbl">
			<div class="banner-tr">
				<div class="banner-td-img-box">배너img 미리보기</div>
				<!-- 빠른메뉴 설정(셀렉) -->
				<div class="banner-td-1"> <img src="" alt="" > 빠른메뉴 선택 :&nbsp;
				<select name="banner_menu">
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
				 <!-- url 링크 -->
				<div class="banner-td-2">url :&nbsp; <input type="text"></div>
				 <!-- 썸네일 이미지 설정 -->
				<div class="banner-td-3">썸네일이미지 :&nbsp;<input type="file"></div>
			</div>
			<div class="banner-tr">
				<div class="banner-td-img-box">배너img 미리보기</div>
				<div class="banner-td-1">빠른메뉴 선택 :&nbsp;
					<select name="banner_menu">
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
				<div class="banner-td-2">url :&nbsp;<input type="text" ></div>
				<div class="banner-td-3">썸네일이미지 :&nbsp;<input type="file"></div>
			</div>
			<div class="banner-tr">
				<div class="banner-td-img-box">배너img 미리보기</div>
				<div class="banner-td-1">빠른메뉴 선택 :&nbsp;
					<select name="banner_menu">
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
				<div class="banner-td-2">url :&nbsp;<input type="text"></div>
				<div class="banner-td-3">썸네일이미지 :&nbsp;<input type="file"></div>
			</div>
		</div>
	</div>
</body>

</html>