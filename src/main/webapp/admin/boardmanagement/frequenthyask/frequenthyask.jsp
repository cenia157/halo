<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Notice</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/0.css/test.css" />
<link
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
	rel="stylesheet" />
</head>




<body>
	<!-- 최상위 콘테이너 -->
	<div class="container">
		<!-- 왼쪽 테이블 -->
		<div class="left-tbl">
			<div class="menu-tr">
				<div class="menu-td-1"></div>
				<div class="menu-td-2"></div>
				<div class="menu-td-3"></div>
				<div class="menu-td-4"></div>
			</div>
		</div>
		<div class="right-tbl">
			<!-- 오른쪽 테이블 open -->
			<div class="header-tr"></div>
			<div class="content-tr">
				<div class="content-main-td">
					<div class="content-m-td-1">
						<!-- *************** 수정 *************** -->
						<div class="content-m-td-title">자주묻는질문</div>
					</div>
					<div class="content-m-td-2">



						<div class="ontent-m-td-2-chackbox">
							<input type="checkbox" name="">&nbsp;답변&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="">&nbsp;미답변&nbsp;&nbsp;&nbsp;
						</div>


						<div class="ontent-m-td-2-content">

							<div class="ontent-m-td-2-content-txt">내용</div>

							<div class="ontent-m-td-2-bottom">

								<div class="ontent-m-td-2-page-side"></div>
								<div class="ontent-m-td-2-page-center"></div>
								<div class="ontent-m-td-2-page-side">


									<button id="openModalBtn">등록하기</button>
									<!-- 모달 설정 위치는 여기 -->

								</div>



							</div>

							<!-- 
 -->
							<!-- 
								 -->
							<div id="myModal" class="modal-background"></div>
							<div class="modal-tbl">

								<div class="modal-title-tr">
									<div class="modal-title-td-1">


										<div class="modal-title-td-1-title">
											<div class="modal-title-td-1-title-detile">제목</div>
										</div>


										<div class="modal-title-td-1-con">
											<div class="modal-title-td-1-detile">2023-12-25 大出 昭子</div>
											<div class="modal-title-td-1-detile">일반</div>
										</div>


									</div>


									<div class="modal-title-td-2">
										<span class="close" id="closeModalBtn">&times;</span>
									</div>

								</div>


								<div class="modal-content">
									<div class="modal-content-txt">모달 내용이 여기에 들어갑니다.</div>
									<div class="modal-content-button">
										<button>수정</button>
									</div>

								</div>


							</div>





						</div>
					</div>
					<!-- *************** 수정 *************** -->
				</div>
			</div>
			<!-- 오른쪽 테이블 close -->
		</div>
		<!-- 최상위 콘테이너 close-->
</body>

</html>