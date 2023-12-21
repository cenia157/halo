<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>logo</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/homepageSetting/logo/0.css/logo.css" />


<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>
<body>
	<div class="content-m-td-3">
		<div class="content-m-td-2-side">
			<div class="content-m-td-2-side-up">
				<div class="content-m-td-2-side-up-title">현재로고</div>
			</div>
			<div class="content-m-td-2-side-mid">

				<div class="content-m-td-2-side-mid-logo">
					<!-- 여기에 이미지 삽입, 식별을 위해 임시로 이미지 대신 스타일삽입하였으므로 나중에 삭제 -->
<!-- 					현재 이미지 보여주기 -->
					<img alt="" src=""
						style="background-color: gray; height: 40%; width: 70%;">
				</div>
			</div>
			<div class="content-m-td-2-side-down"></div>
		</div>
		<div class="content-m-td-2-mid">
			<div class="content-m-td-2-mid-Play">
				<img alt=""
					src="${pageContext.request.contextPath}/admin/0.img/Vector.png">
			</div>
		</div>
		<div class="content-m-td-2-side">
			<div class="content-m-td-2-side-up">
				<div class="content-m-td-2-side-up-title">변경로고</div>
			</div>
			<div class="content-m-td-2-side-mid">
					<!-- 변경할 로고 파일 업로드 인풋 & 이미지미리보기 -->
				<div class="content-m-td-2-side-mid-logo">
					<div class="logo_upload">
					<label for="logo_img">
					<img src="${pageContext.request.contextPath}/admin/0.img/logo_upload.png">
					</label>
					<input type="file" id="logo_img" name="logo_img">
					</div>
				</div>
			</div>
			<div class="content-m-td-2-side-down">
					<!-- 로고변경 버튼 -->
				<div class="content-m-td-2-side-down-button">
					<button class="content-button" id="logo_btn_submit" onclick="">변경</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>