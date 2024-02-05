<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/popup/0.css/popupContent.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/popup/0.js/popup.js"></script>
</head>
<body>
	<div class="content-m-td-3">
		<div class="popup-content">
			<div class="popup-tbl">
			<div class="popup-tr">
			<div class="popup-title"><h1>変更前</h1></div>
				<!-- ajax미리보기 이미지 박스 -->
				<div class="popup-td-img-box" id="banner_preview1" style="background-image: url('${pageContext.request.contextPath}/admin/0.img/banner_preview_img.png');">
				</div>
			</div>
			
				<div class="popup-tr">
				<div class="popup-title"><h1>変更予定</h1></div>
				<!-- ajax미리보기 이미지 박스 -->
				<div class="popup-td-img-box" id="banner_preview1" style="background-image: url('${pageContext.request.contextPath}/admin/0.img/banner_preview_img.png');">
				</div>
				<!-- 빠른메뉴 설정(셀렉) -->
				<div class="popup-select-box">
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/banner_icon.png"> --%>
				<div>メニュー :&nbsp;</div>
				<select class="popup-select popup-input-line" name="banner_menu1" id="banner_menu1" onchange="changeInformBox()">
				<option value="info_com">会社について</option>
				<option value="info_map">施設アクセス</option>
				<option value="intro_announce">お知らせ</option>
				<option value="intro_album">アルバム</option>
				<option value="intro_employ">スタッフ募集</option>
				<option value="service_info">サービスの案内</option>
				<option value="service_apply">サービスの申し込み</option>
				<option value="faq">よくある質問</option>
				<option value="question">お問い合わせ</option>
				<option value="url">url</option>
				</select> 
				 </div>
				<!-- url 링크 -->
				<div class="sales-inform" id="informBox1">
				<div class="banner-td-2" id="urlBox">
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/url_icon.png" alt="이미지준비중"> --%>
				<div>url :&nbsp;</div>
				<input class="popup-input-line" id="banner_url1" name="banner_url1" type="text">
				</div>
				<!-- 팝업(포스터) 이미지 설정 -->
				<div class="banner-td-2">
<%-- 				<img src="${pageContext.request.contextPath}/admin/0.img/fileDown.png" alt="이미지준비중"> --%>
				<div>popupImg :&nbsp;</div>
	<form action="BannerUploadC" id="bannerUploadForm1" method="post" enctype="multipart/form-data">
				<label for="thumbnail1 popup-input-line">
				<div class="btn-upload">アップロード</div>
				</label>
				<input onchange="handleFileUpload()" hidden="" type="file" class="file_input" name="banner_thumbnail" id="thumbnail1">
				<input class="serverFileName" type="text" hidden="" value="empty">
			</form>
				</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>