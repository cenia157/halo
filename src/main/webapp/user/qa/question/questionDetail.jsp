<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/question/0.css/questionDetail.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">
</head>
<body>



<!-- 헤더 -->
<div class="header-tbl">
      <div class="header-opmenu-back">
      </div>
      <div class="header-tr-1">
        <div class="header-br-logo">
          <img src="${pageContext.request.contextPath}/user/0.img/logo.png">
          <a href="">ハロー</a>
        </div>
        <div class="header-br-space"></div>
        <div class="header-br-call">Tel. 06-6997-6531</div>
      </div>
      <div class="header-tr-2">
        <div class="header-td">
          <div class="header-td-menu">
            <div class="header-td-menu-title">
              <a href="" class="">소개
                <span class="header-td-menu-under"></span>
              </a>
            </div>
            <div class="header-opmenu-td">
              <a class="header-opmenu-a" href="">회사소개</a>
              <a class="header-opmenu-a" href="">오시는길</a>
            </div>
          </div>
          <div class="header-td-menu">
            <div class="header-td-menu-title">
              <a href="" class="">소식
                <span class="header-td-menu-under"></span>
              </a>
            </div>
            <div class="header-opmenu-td">
              <a class="header-opmenu-a" href="">공지사항</a>
              <a class="header-opmenu-a" href="">앨범</a>
              <a class="header-opmenu-a" href="">채용공고</a>
            </div>
          </div>
          <div class="header-td-menu">
            <div class="header-td-menu-title">
              <a href="" class="">서비스
                <span class="header-td-menu-under"></span>
              </a>
            </div>
            <div class="header-opmenu-td">
              <a class="header-opmenu-a" href="">서비스안내</a>
              <a class="header-opmenu-a" href="">서비스신청</a>
            </div>
          </div>
          <div class="header-td-menu">
            <div class="header-td-menu-title">
              <a href="" class="">QnA
                <span class="header-td-menu-under"></span>
              </a>
            </div>
            <div class="header-opmenu-td">
              <a class="header-opmenu-a" href="">자주묻는질문</a>
              <a class="header-opmenu-a" href="">문의게시판</a>
            </div>
          </div>
          <div class="header-td-menu">
            <div class="header-td-menu-img">
              <img src="${pageContext.request.contextPath}/user/0.img/🦆 icon _menu_.png">
            </div>
          </div>
        </div>
      </div>
    </div>

	<!-- 본문 -->
	<div class="content-tbl">
		<!-- 문의글 게시판 (디테일) -->
		<div class="content-box-tr1">
			<div class="content-box-tr2">
				<div class="content-box-td1-1">
					<span> 문의글 게시판</span>
				</div>
				<div class="content-box-td1-2">
					<div class="content-box-td1-2-1">제목</div>
					<div class="content-box-td1-2-2">제목 내용</div>
				</div>

				<div class="content-box-td1-3">
					<div class="content-box-td1-3-1">작성자</div>
					<div class="content-box-td1-3-2">작성자 이름</div>
				</div>

				<div class="content-box-td1-4">
					<div class="content-box-td1-4-content">
						<span class="content-box-td1-4-1">작성일: </span> <span
							class="content-box-td1-4-2">작성일 내용</span>
					</div>
					<div class="content-box-td-button">
						<button class="content-box-td-button-1">수정</button>
						<button class="content-box-td-button-2">삭제 X</button>
					</div>
				</div>

				<!-- 본문 -->
				<div class="content-box-td2-1">
					<div class="content-box-td2-1-content">
						안녕하세요, 부모님을 위한 개호 택시 서비스에 관심이 있어, 문의 드립니다. <br> 부모님이 편안한 이동을
						위해 장애인 택시 예약 서비스를 알아보려고 하는데요. <br> 평일 중 2일과 주말 1일을 정기적으로 한 달
						동안 이용하는 것이 가능한지 궁금합니다. <br> 부모님의 편의를 생각해서 가능한 빠른 답변 부탁드립니다.
						다음 주에도 가능하다면 좋겠어요. <br> <br> 부모님을 위한 편리한 이동이라는 목적으로 서비스를
						검토 중이니, <br> 어떤 혜택이나 특별한 안내사항이 있는지도 함께 알려주시면 감사하겠습니다. <br>
					</div>
				</div>

				<div class="content-box-td2-2">
					<button class="content-box-td2-2-button">목록</button>
				</div>
				<!-- 댓글 -->
				<div class="content-box-td3-1">
					<div class="content-box-td3-1-1">이름</div>
					<div class="content-box-td3-1-2">작성일</div>
				</div>
				<div class="content-box-td3-2">
					<div class="content-box-td3-2-1">
						<img alt=""
							src="${pageContext.request.contextPath}/user/qa/question/0.img/lock.png">
					</div>
					<div class="content-box-td3-2-2">댓글본문</div>
				</div>
				<!-- 이전글/다음글 -->
				<div class="content-box-td4-1">
					<div class="content-box-td4-1-1">이전글</div>
					<div class="content-box-td4-1-2">글 제목</div>
				</div>
				<div class="content-box-td4-2">
					<div class="content-box-td4-2-1">다음글</div>
					<div class="content-box-td4-2-2">글 제목</div>
				</div>
				<div class="content-box-td4-3">
					<div class="content-box-td4-3-1">
						그 밖의 문의사항은 <br> Tel.06-6997-6531 로 연락 부탁드립니다.
					</div>
				</div>
			</div>

		</div>
	</div>



	<!-- 하단배너 -->

	<div class="bottom-venner-tr">
		<div class="bottom-venner-td">하단베너</div>
		<div class="bottom-venner-td">상품판매링크</div>
		<div class="bottom-venner-td">추가기능</div>
	</div>

	<!-- footer -->
	<div class="footer-tbl">
      <div class="footer-tr">
        <div class="footer-item-td-1">
          Tel. 06-6997-6531 <br>
          FAX : 06-6997-6520 <br>
          PhoneNumber : 090-8799-3855 <br>
          email : hello20201110@gmail.com <br>
          address : 大阪府守口市馬場町3-14-6メゾンエミール701号 <br>
        </div>
        <div class="footer-item-td-2">
          <div>合同会社<img src="0.img/footerlogo.png" alt=""><a>ハロー
          </a></div>
          <div>代表社員　：　大出　昭子　<img src="0.img/footerinstaicon.png" alt="">　<img src="0.img/footerlineicon.png" alt=""></div>
          <div>Copyright 2023. MGKD.All rights reserved</div>
        </div>
      </div>
    </div>

</body>
</html>