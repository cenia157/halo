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
	
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/homepageSetting/banner/0.js/banner.js"></script>

</head>
<body> 
	<div class="content-m-td-3">
	<div class="content-banner">
		<div class="banner-tbl">
			
			<div class="banner-tr">
			<div class="banner-no"><h1>1.box</h1></div>
				<div class="banner-td-img-box" id="banner_preview" style="background-image: url('${pageContext.request.contextPath}/admin/0.img/banner_preview.png');">
				</div>
				<!-- 빠른메뉴 설정(셀렉) -->
				<div class="banner-td-1"> 
				<div>빠른메뉴 :&nbsp;</div>
				<select name="banner_menu1" onchange="changeInformBox(1)">
				<option value="info_com">회사소개</option>
				<option value="info_map">오시는길</option>
				<option value="intro_announce">공지사항</option>
				<option value="intro_album">앨범</option>
				<option value="intro_employ">채용공고</option>
				<option value="service_info">서비스안내</option>
				<option value="service_apply">서비스신청</option>
				<option value="faq">자주묻는질문</option>
				<option value="question">문의게시판</option>
				<option value="sales">상품판매</option>
				</select> 
				 </div>
				<!-- url 링크 -->
				<div class="sales-inform" id="informBox1">
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/url.png" alt="이미지준비중">
				<div>url :&nbsp;</div>
				<input name="banner_url1" type="text">
				</div>
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/sales-icon.png" alt="이미지준비중">
				<div>상품명 :</div>
				<input name="banner_text1" type="text">
				</div>
				<!-- 썸네일 이미지 설정 -->
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/fileDown.png" alt="이미지준비중">
				<div>썸네일 :&nbsp;</div>
	<form action="BannerUploadC" id="bannerUploadForm" method="post" enctype="multipart/form-data">
				<label for="thumbnail1">
				<div class="btn-upload">파일업로드</div>
				</label>
				<input type="file" class="banner_input" name="banner_thumbnail1" id="thumbnail1">
			</form>
				</div>
				</div>
			</div>
			<div class="banner-tr">
			<div class="banner-no"><h1>2.box</h1></div>
				<div class="banner-td-img-box" id="banner_preview" style="background-image: url('${pageContext.request.contextPath}/admin/0.img/banner_preview.png');">
				</div>
				<div class="banner-td-1">
				빠른메뉴 :&nbsp;
					<select name="banner_menu2" onchange="changeInformBox(2)">
				<option value="info_com">회사소개</option>
				<option value="info_map">오시는길</option>
				<option value="intro_announce">공지사항</option>
				<option value="intro_album">앨범</option>
				<option value="intro_employ">채용공고</option>
				<option value="service_info">서비스안내</option>
				<option value="service_apply">서비스신청</option>
				<option value="faq">자주묻는질문</option>
				<option value="question">문의게시판</option>
				<option value="sales">상품판매</option>
				</select>
				</div>
				<!-- url 링크 -->
				<div class="sales-inform" id="informBox2">
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/url.png" alt="이미지준비중">
				url :&nbsp;
				<input name="banner_url2" type="text">
				</div>
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/sales-icon.png" alt="이미지준비중">
				상품명 :&nbsp;
				<input name="banner_text2" type="text">
				</div>
				<!-- 썸네일 이미지 설정 -->
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/fileDown.png" alt="이미지준비중">
				썸네일 :&nbsp;
			<form action="BannerUploadC" id="bannerUploadForm" method="post" enctype="multipart/form-data">
				<label for="thumbnail2">
				<div class="btn-upload">파일업로드</div>
				</label>
				<input type="file" class="banner_input" name="banner_thumbnail2" id="thumbnail2">
			</form>
				</div>
				</div>
			</div>
			<div class="banner-tr">
			<div class="banner-no"><h1>3.box</h1></div>
				<div class="banner-td-img-box" id="banner_preview" style="background-image: url('${pageContext.request.contextPath}/admin/0.img/banner_preview.png');">
				</div>
				<div class="banner-td-1">
				빠른메뉴 :&nbsp;
					<select name="banner_menu3" onchange="changeInformBox(3)">
				<option value="info_com">회사소개</option>
				<option value="info_map">오시는길</option>
				<option value="intro_announce">공지사항</option>
				<option value="intro_album">앨범</option>
				<option value="intro_employ">채용공고</option>
				<option value="service_info">서비스안내</option>
				<option value="service_apply">서비스신청</option>
				<option value="faq">자주묻는질문</option>
				<option value="question">문의게시판</option>
				<option value="sales">상품판매</option>
				</select>
				</div>
				<!-- url 링크 -->
				<div class="sales-inform" id="informBox3">
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/url.png" alt="이미지준비중">
				url :&nbsp;
				<input name="banner_url3" type="text">
				</div>
				<div class="banner-td-2">
				<img src="${pageContext.request.contextPath}/admin/0.img/sales-icon.png" alt="이미지준비중">
				상품명 :&nbsp;
				<input name="banner_text3" type="text">
				</div>
				<!-- 썸네일 이미지 설정 -->
				<div class="banner-td-2">
				<img id="file-icon" src="${pageContext.request.contextPath}/admin/0.img/fileDown.png" alt="이미지준비중">
				썸네일 :&nbsp;
			<form action="BannerUploadC" id="bannerUploadForm" method="post" enctype="multipart/form-data">
				<label for="thumbnail3">
				<div class="btn-upload">파일업로드</div>
				</label>
				<input type="file" class="banner_input" name="banner_thumbnail3" id="thumbnail3">
			</form>
				</div>
				</div>
			</div>
		</div>
		<div class="content-button">
		<button id="banner_btn_submit" type="button" onclick="#">변경</button>
		</div>
		</div>
		
	</div>
</body>

</html>