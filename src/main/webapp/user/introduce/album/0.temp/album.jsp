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
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/user/introduce/album/0.css/album.css"
    />
    <!--     인스타 api연동을 위한 제이쿼리 -->
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="container">
      <div class="header-tbl">
        <div>소개</div>
        <div>소식</div>
        <div>서비스</div>
        <div>QnA</div>
      </div>
      <div class="content-tbl">
        <!--include 領域展開1 시작-->

        <div class="content-box-tr1">
          <div class="content-box-tr1-td1">
            <div class="content-box-tr1-td1-1">
              <span><a href="www.test.com">공지사항</a></span>
            </div>
            <div class="content-box-tr1-td1-2">
              <span><a href="www.test.com">앨범</a></span>
            </div>
            <div class="content-box-tr1-td1-3">
              <span><a href="www.test.com">채용공고</a></span>
            </div>
          </div>

          <div class="content-box-tr1-td2">
            <img
              class="content-box-tr1-td2-1"
              src="./0.img/home_icon.svg"
              alt=""
            />

            <!-- [ > 소식 > 앨범 ] 상위 box -->
            <div class="content-box-tr1-td2-2">
              <div class="content-box-tr1-td2-2-1"><span>></span></div>
              <div class="content-box-tr1-td2-2-2"><span>소식</span></div>
              <div class="content-box-tr1-td2-2-3"><span>></span></div>
              <div class="content-box-tr1-td2-2-4"><span>앨범</span></div>
            </div>
          </div>

          <!-- content-box-tr1-td3 ::: display: flex wrap용 -->
          <div class="content-box-tr1-td3">
            <!-- 인스타 3x3 담을 곳 -->
            <div class="content-box-tr1-td3-1">
            
          
           

              <!-- 구분::: 아래 div는 content-box-tr1-td3-1의 닫는 div -->
            </div>
          </div>
        </div>
      </div>
      <!--include 領域展開1 끝-->

      <div class="content-tbl2">하단 배너</div>

      <div class="footer-tbl">footer</div>
    </div>
  </body>
</html>
