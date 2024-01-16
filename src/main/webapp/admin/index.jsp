<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<title>Document</title>
<!-- font -->
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />

<!-- jquery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous">
	
</script>

<!-- 메뉴 js -->
<script src="admin/_js/test.js"></script>

<!-- 메뉴 css -->
<link rel="stylesheet" href="admin/0.css/test copy.css" />
<body>
	<!-- 최상위 콘테이너 -->
	<div class="container">

		<!-- 왼쪽 테이블 -->
		<div class="left-tbl">
			<div class="menu-tr">
				<div class="menu-td-1">
					<a href="">ハロー</a>
				</div>
				<div class="menu-td-2">
					<div class="menu-td-2-td">
						<div>
							<img src="admin/0.img/admintble2-1.png" alt="">大出 昭子
						</div>
						<!-- 메인홈페이지 바로가기 -->
						<div>
							<img src="admin/0.img/admintble2-2.png" alt=""><a href="HC">사이트
								바로가기</a>
						</div>
					</div>
				</div>
				<div class="menu-td-3">
					<div class="menu-td-3-td-1">사이트관리</div>
					<div class="menu-td-3-td-2">
						<div class="menu-td-3-td-open-td-1">
							<img src="admin/0.img/admintble3-1.png" alt=""><a
								href="adminC">대시보드</a>
						</div>
						<div class="menu-td-3-td-open-td-2">
							<div class="menu-td-3-td-open-td-2-td-1">
								<img src="admin/0.img/admintble3-2.png" alt=""><span>홈페이지수정</span>
							</div>
							<div class="menu-td-3-td-open-td-2-con">
								<div class="menu-td-3-td-open-td-2-con-td-2">
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<!-- TODO 서효원 기능 서블렛 만들때마다 연결시키고 컨트롤러 if문 지우기! -->
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="LogoUploadC">로고변경</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="MainBannerUpdateC">주요메뉴설정</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="BannerUploadC">하단배너설정</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="InformUpdateC">회사정보변경</a>
									</div>
								</div>
							</div>
						</div>
						<div class="menu-td-3-td-open-td-2">
							<div class="menu-td-3-td-open-td-2-td-1">
								<img src="admin/0.img/admintble3-3.png" alt=""><span>게시판관리</span>
							</div>
							<div class="menu-td-3-td-open-td-2-con">
								<div class="menu-td-3-td-open-td-2-con-td-2">
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AdminNOTICEC?checkVal=01234">공지사항</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AskContentC?p=1">문의사항</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AdminFAQC">자주묻는질문</a>
									</div>
								</div>
							</div>
						</div>
						<div class="menu-td-3-td-open-td-2">
							<div class="menu-td-3-td-open-td-2-td-1">
								<img src="admin/0.img/admintble3-4.png" alt=""><span>일정</span>
							</div>
							<div class="menu-td-3-td-open-td-2-con">
								<div class="menu-td-3-td-open-td-2-con-td-2">
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="CompanyC">회사의일정</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AdminC?link=9">고객의예약</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AdminC?link=10">직원근무일정</a>
									</div>
								</div>
							</div>
						</div>
						<div class="menu-td-3-td-open-td-2">
							<div class="menu-td-3-td-open-td-2-td-1">
								<img src="admin/0.img/admintble3-5.png" alt=""><span>고객관리</span>
							</div>
							<div class="menu-td-3-td-open-td-2-con">
								<div class="menu-td-3-td-open-td-2-con-td-2">
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AdminC?link=11">통계</a>
									</div>
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="CustomerInfoMgmtC">고객정보관리</a>
									</div>
								</div>
							</div>
						</div>
						<div class="menu-td-3-td-open-td-2">
							<div class="menu-td-3-td-open-td-2-td-1">
								<img src="admin/0.img/admintble3-6.png" alt=""><span>관리자전용</span>
							</div>
							<div class="menu-td-3-td-open-td-2-con">
								<div class="menu-td-3-td-open-td-2-con-td-2">
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt=""><a
											href="AdminC?link=13">직원등록</a>
									</div>
								</div>
							</div>
						</div>
						<div class="menu-td-3-td-open-td-2">
							<div class="menu-td-3-td-open-td-2-td-1">
								<img src="admin/0.img/admintble3-7.png" alt=""><span>팝업관리</span>
							</div>
							<div class="menu-td-3-td-open-td-2-con">
								<div class="menu-td-3-td-open-td-2-con-td-2">
									<div class="menu-td-3-td-open-td-2-con-td-2-select">
										<img src="admin/0.img/admintble-select.png" alt="">
										<a href="PopupC">팝업설정</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="menu-td-4">
					<div class="menu-td-4-td">
						<div>
							<img src="admin/0.img/adminfootericon.png" alt="">日本語
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 오른쪽테이블 -->
		<div class="right-tbl">

			<!-- 헤더 -->
			<div class="header-tr">
				<div class="header-td">
					<div class="header-td-user">
						<div>大出 昭子</div>
					</div>
					<input type="hidden" id="sessionTimeoutVal"
						value="${sessionTimeout }">
					<div class="header-td-login">
						<p id="sessionTimeout" class="sessionTimeout">
							<img alt="" src="admin/0.img/timer.png"> <span id="timer"></span>
						</p>
						<div>
							<a href="#" id="extendTime">시간연장</a>
						</div>
						<div>
							<a onclick="location.href='LogoutC'">나가기</a>
						</div>
					</div>
				</div>
			</div>

			<!-- 오른쪽 테이블 컨텐츠 -->
			<div class="content-tr">
				<div class="content-main-td">
					<div class="content-m-td-1">
						<div class="content-m-td-title">공지사항</div>
					</div>
					<div class="content-m-td-2">
						<jsp:include page="${menu }"></jsp:include>
					</div>
				</div>
			</div>


		</div>

	</div>
</body>
<script src="admin/_js/loginSession.js"></script>
</html>