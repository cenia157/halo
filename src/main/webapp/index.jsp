<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- font -->
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
	
<!--css -->
<link rel="stylesheet" href="user/0.css/index.css" />
<link rel="stylesheet" href="user/0.css/index-menu.css" />
<link rel="stylesheet" href="user/0.css/index-footer.css" />
<link rel="stylesheet" href="user/0.css/sec.css" />

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	
<!-- 헤더 js -->
<script src="user/0.js/index-menu.js"></script>
<!-- 배경이미지 js -->
<script src="user/0.js/background-img.js"></script>
</head>

<body>
	<div class="container">
		<!-- 헤더 html 시작 -->
		<div class="header-tbl">
			<div class="header-opmenu-back"></div>
			<div class="header-tr-1">
				<div class="header-br-logo">
					<!-- 로고 이미지 경로 확인, 텍스트까지 이미지로 업로드, <a>홈으로 연결 -->
					<a href="HC">
					<img src="user/upload_imgs/${hdto.h_logo_img}">
					</a>
				</div>
				<div class="header-br-space"></div>
<!-- 				전화번호 수정 가능하도록, 회사정보(footer 변경 어트리뷰트 재활용) -->
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
							<a class="header-opmenu-a" href="HC?link=1">회사소개</a> <a
								class="header-opmenu-a" href="HC?link=2">오시는길</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">소식 <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="Announced_C">공지사항</a> <a
								class="header-opmenu-a" href="Album_insta_api_C">앨범</a> <a
								class="header-opmenu-a" href="Employment_C">채용공고</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">서비스 <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="HC?link=6">서비스안내</a> <a
								class="header-opmenu-a" href="ServiceApplyC">서비스신청</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-title">
							<a href="" class="">QnA <span class="header-td-menu-under"></span>
							</a>
						</div>
						<div class="header-opmenu-td">
							<a class="header-opmenu-a" href="FaqC">자주묻는질문</a> <a
								class="header-opmenu-a" href="QuestionC">문의게시판</a>
						</div>
					</div>
					<div class="header-td-menu">
						<div class="header-td-menu-img">
							<!-- 복붙할때 이미지 경로 확인~~~~ -->
							<img
								src="${pageContext.request.contextPath}/user/0.img/icon _menu_.png" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 헤더끝 -->

		<!-- - 배경이미지 - div -->
		<div id="background-img">
			<div class="background img-rightCloud">
				<img src="user/0.img/rightCloud.PNG" alt="" />
			</div>
			<div class="background img-leftCloud">
				<img src="user/0.img/leftCloud.PNG" alt="" />
			</div>
			<div class="background img-rightPink">
				<img src="user/0.img/rightPinkCloud.PNG" alt="" />
			</div>
			<div class="background img-leftPink">
				<img src="user/0.img/leftPinkCloud.PNG" alt="" />
			</div>
			<div class="background img-sunset">
				<img src="user/0.img/sunset.PNG" alt="" />
			</div>
			<div class="background img-mountain">
				<img src="user/0.img/mountain.PNG" alt="" />
			</div>
		</div>
		<!-- 배경이미지 끝 -->

		<!-- 콘텐츠 페이지 -->
		<div class="menu-sec">
		<jsp:include page="${menu  }"></jsp:include>
		</div>
		<!--  콘텐츠 페이지끝 -->

		<!-- 리모컨 ~~ -->
		<div class="remote-control-tbl">
			<a href="">
				<div class="remote-control-tr">
					<div class="remote-control-td2">
						<img src="user/0.img/re-up.png" width="55%" alt="" />
					</div>
					<div class="remote-control-td">상단으로</div>
				</div>
			</a> 
			<a href="">
				<div class="remote-control-tr">
					<div class="remote-control-td2">
						<img src="user/0.img/line-icon22.png" width="60%" alt="" />
					</div>
					<div class="remote-control-td">1:1문의</div>
				</div>
			</a>
		</div>
		<!-- 리모컨 끝 -->
		
		<!-- Footer풋터 시작 -->
		<div class="footer-tbl">
			<div class="footer-tr">
			<!-- TODO 서효원 admin페이지에서 업뎃된 footer정보 getAll로 뿌림 -->
				<div class="footer-item-td-1">
					Tel. ${hdto.h_tel_no} <br /> FAX : ${hdto.h_fax_no}  <br /> PhoneNumber :
					${hdto.h_phone_no} <br /> email : ${hdto.h_email} <br />
					address : ${hdto.h_address} <br />
				</div>
				<div class="footer-item-td-2">
					<div>
						合同会社 <img src="user/0.img/footerlogo.png" alt="" /><a href="AdminC">ハロー </a>
					</div>
					<div>
						代表社員 ： 大出 昭子 <img src="user/0.img/footerinstaicon.png" alt="" />
						<img src="user/0.img/footerlineicon.png" alt="" />
					</div>
					<div>Copyright 2023. MGKD.All rights reserved</div>
				</div>
			</div>
		</div>
		<!-- Footer풋터 끝 -->
	</div>
</body>
</html>