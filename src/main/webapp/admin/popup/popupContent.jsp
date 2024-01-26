<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/popup/0.css/popupContent.css" />
</head>
<body>
	<div class="content-m-td-3">
		<div class="popup-content">
			<div class="popup-tbl">
				<div class="popup-tr">
				<div class="popup-title"><h1>변경전</h1></div>
				<!-- ajax미리보기 이미지 박스 -->
				<div class="popup-td-img-box" id="banner_preview1" style="background-image: url('${pageContext.request.contextPath}/admin/0.img/banner_preview_img.png');">
				</div>
				<!-- 빠른메뉴 설정(셀렉) -->
				<div class="banner-td-1">
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/banner_icon.png"> --%>
				<div>빠른메뉴 :&nbsp;</div>
				<select class="banner-select" name="banner_menu1" id="banner_menu1" onchange="changeInformBox(1)">
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
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/url_icon.png" alt="이미지준비중"> --%>
				<div>url :&nbsp;</div>
				<input class="banner-url" id="banner_url1" name="banner_url1" type="text">
				</div>
				<div class="banner-td-2">
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/sales-icon.png" alt="이미지준비중"> --%>
				<div>상품명 :</div>
				<input class="banner-pdNameData" id="banner_text1" name="banner_text1" type="text">
				</div>
				<!-- 팝업(포스터) 이미지 설정 -->
				<div class="banner-td-2">
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/fileDown.png" alt="이미지준비중"> --%>
				<div>썸네일 :&nbsp;</div>
	<form action="BannerUploadC" id="bannerUploadForm1" method="post" enctype="multipart/form-data">
				<label for="thumbnail1">
				<div class="btn-upload">파일업로드</div>
				</label>
				<input onchange="handleFileUpload(1)" type="file" class="banner_input" name="banner_thumbnail" id="thumbnail1">
				<input class="serverFileName" type="text" hidden value="empty">
			</form>
				</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>