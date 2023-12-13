<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      rel="stylesheet"
      href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
    />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/qa/question/0.css/question.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/0.css/index-footer.css">
</head>
<body>


<!-- 메뉴를 include -->
<%@ include file="index-menu.jsp" %>
  

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


		<!-- 문의작성란 -->
	<div class="content-tbl">
		<div class="content-box-tr1">
			<div class="content-box-td1">
				<span class="content-box-td-content1">문의작성란</span>
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content2-1">작성자명* </span>
				<input class="content-box-td-content2-2" type="text">
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content3-1">휴대폰 번호*</span>
					<select class="content-box-td-content3-2" name="fruit" id="fruit">
			            <option value="apple">Apple</option>
			            <option value="banana">Banana</option>
			            <option value="orange">Orange</option>
			            <option value="grape">Grape</option>
			        </select>
				<input class="content-box-td-content3-3" type="text">
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content4-1">문의 카테고리</span>
					<select class="content-box-td-content4-2" name="fruit" id="fruit">
			            <option value="apple">Apple</option>
			            <option value="banana">Banana</option>
			            <option value="orange">Orange</option>
			            <option value="grape">Grape</option>
			        </select>
			</div>
			
			<div class="content-box-td2">
				<span class="content-box-td-content5-1">문의 제목*</span>
				<input class="content-box-td-content5-2" type="text">
			</div>
			
			<div class="content-box-td2 content-box-td-content6">
				<span class="content-box-td-content6-1">문의 내용*</span>
				<input class="content-box-td-content6-2" type="text" value="문의내용">
			</div>
			<div class="content-box-td3">
				<span class="content-box-td-content7">*은 필수입력 사항입니다.</span>
			</div>
			
			
			<div class="content-box-td4">
				<button class="content-box-td-content8">확인</button>
			</div>
			
			<div>
				<img class="img1" alt="" src="${pageContext.request.contextPath}/user/qa/question/0.img/clover3.png">
				<img class="img2" alt="" src="${pageContext.request.contextPath}/user/qa/question/0.img/clover4.png">
			</div>
			
		</div>

		<!-- 문의글 게시판 -->
		<div class="content-box-tr2-1">
		<div class="content-box-tr2-2">
			<div class="content-box-td5">
				<span>문의글 게시판</span>
			</div>

			<div class="content-box-td6">
				<span class="content-box-td6-1">No</span>
				<span class="content-box-td6-2">글쓴이</span>
				<span class="content-box-td6-3">제목</span>
				<span class="content-box-td6-4">응답여부</span>
				<span class="content-box-td6-5">작성일</span>
			</div>
			<div class="content-box-td7">
				<span class="content-box-td7-1">No</span>
				<span class="content-box-td7-2">글쓴이</span>
				<span class="content-box-td7-3">제목</span>
				<span class="content-box-td7-4">응답여부</span>
				<span class="content-box-td7-5">작성일</span>
			</div>

		</div>
		</div>
		
	</div>
		

	<!-- banner include -->
	<%@ include file="index-banner.jsp" %>
	<!-- footer include -->
	<%@ include file="index-footer.jsp" %>
	
</body>
</html>