<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
<!-- include 섹터구성 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/0.css/sec.css" />
<!-- 헤더 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/0.css/index-menu.css" />
<!-- 푸터 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/user/0.css/index-footer.css" />
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!-- 헤더 js -->
<script src="${pageContext.request.contextPath}/user/0.js/index-menu.js"></script>

</head>

<body>
	<div class="container-tbl">
		<!-- 헤더 여기부터 -->
		<div class="header-tbl">
			<div class="header-opmenu-back"></div>
			<div class="header-tr-1">
				<div class="header-br-logo">
					<!-- 이미지 경로 확인 -->
					<img src="${pageContext.request.contextPath}/user/0.img/logo.png" /> <a href="">ハロー</a>
				</div>
				<div class="header-br-space"></div>
				<div class="header-br-call">Tel. 06-6997-6531</div>
			</div>
			<div class="header-tr-2">
				<div class="header-td">
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">소개 <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="">회사소개</a> <a
								class="header-opmenu-a" href="">오시는길</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">소식 <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="">공지사항</a> <a
								class="header-opmenu-a" href="">앨범</a> <a
								class="header-opmenu-a" href="">채용공고</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">서비스 <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="">서비스안내</a> <a
								class="header-opmenu-a" href="">서비스신청</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">QnA <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="">자주묻는질문</a> <a
								class="header-opmenu-a" href="">문의게시판</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-img">
							<!-- 복붙할때 이미지 경로 확인~~~~ -->
							<img src="${pageContext.request.contextPath}/user/0.img/icon _menu_.png" />
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content-tbl">
			<div class="content-space"></div>
			<div class="content-sec">
				<jsp:include page="serviceInformation.jsp"></jsp:include>
			</div>
			<div class="bottom-venner-tr">
				<div class="bottom-venner-td">하단베너</div>
				<div class="bottom-venner-td">상품판매링크</div>
				<div class="bottom-venner-td">추가기능</div>
			</div>
		</div>
		<!-- 푸터자리 -->
		<div class="footer-tbl">
			<div class="footer-tr">
				<div class="footer-item-td-1">
					Tel. 06-6997-6531 <br> FAX : 06-6997-6520 <br>
					PhoneNumber : 090-8799-3855 <br> email :
					hello20201110@gmail.com <br> address :
					大阪府守口市馬場町3-14-6メゾンエミール701号 <br>
				</div>
				<div class="footer-item-td-2">
					<div>
						合同会社<img src="0.img/footerlogo.png" alt=""><a>ハロー </a>
					</div>
					<div>
						代表社員 ： 大出 昭子 <img src="0.img/footerinstaicon.png" alt=""> <img
							src="0.img/footerlineicon.png" alt="">
					</div>
					<div>Copyright 2023. MGKD.All rights reserved</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>