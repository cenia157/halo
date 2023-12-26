<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>logo</title>
<!-- 해당 컨텐트 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/homepageSetting/logo/0.css/logo.css" />
<!-- 폰트 css -->
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<!-- js연결 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/homepageSetting/logo/0.js/logo.js"></script>
</head>
<body>
	<div class="content-m-td-3">
		<!-- 		왼쪽 (현재로고) 큰 div -->

		<div class="content-m-td-2-side">
			<div class="content-m-td-2-side-up">
				<div class="content-m-td-2-side-up-title">현재로고</div>
			</div>
			<div class="content-m-td-2-side-mid">

				<div class="content-m-td-2-side-mid-logo">
					<!-- 여기에 이미지 삽입, 식별을 위해 임시로 이미지 대신 스타일삽입하였으므로 나중에 삭제 -->
					<!-- 현재 이미지 보여주기 (바꾸기 이전 이미지 경로 EL태그 ㄱㄱ) -->
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
		<!-- 		오른쪽(변경로고) 큰 div   form태그 감싸기, logoUpdateC, post로 img경로값 보내기 -->
		<form action="LogoUploadC" method="post" enctype="multipart/form-data">
			<div class="content-m-td-2-side2">
				<div class="content-m-td-2-side-up2">
					<div class="content-m-td-2-side-up-title2">변경로고</div>
				</div>

				<div class="content-m-td-2-side-mid2">
					<!-- 변경할 로고 파일 업로드 인풋 & 이미지미리보기 ajax 아니면 jstl 조건문으로 -->
					<div class="content-m-td-2-side-mid-logo2">
						<div class="logo_upload">
							<!-- d -->
							<c:choose>
								<c:when test="${not empty param.logo_img}">
								<label for="logo_img"> 
									<img id="logoUpload" width="20%"
									src="${pageContext.request.contextPath}/user/upload_imgs/${logo_img}">
									</label>
									</c:when>
									<c:otherwise>
									<label for="logo_img"> 
								<img id="logo_preview"
									src="${pageContext.request.contextPath}/admin/0.img/logo_upload.png">
									</label>
									</c:otherwise>
							</c:choose>
							
							<!-- 변경할 로고이미지 인풋 -->
							<input type="file" id="logo_img" name="logo_img">
						</div>
					</div>
				</div>
				<div class="content-m-td-2-side-down">
					<!-- 로고변경 버튼  -->
					<div class="content-m-td-2-side-down-button">
						<!-- 업로드 버튼 -->
						<button class="content-button" id="logo_btn_submit">1.업로드</button>
						<!-- 변경완료버튼, 실제DB에 업뎃되면서 대기 업로드 대기이미지로 바뀜 -->
						<button type="button" class="content-button" id="logo_btn_submit"
							onclick="location.href='LogoUpdate?logo_img='">2.변경완료</button>

					</div>

				</div>
			</div>
		</form>

	</div>
</body>
</html>