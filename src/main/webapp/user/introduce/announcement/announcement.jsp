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
      href="${pageContext.request.contextPath}/user/introduce/announcement/0.css/announcement.css"
    />
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

            <!-- [ > 소식 > 공지사항 ] 상위 box -->
            <div class="content-box-tr1-td2-2">
              <div class="content-box-tr1-td2-2-1"><span>></span></div>
              <div class="content-box-tr1-td2-2-2"><span>소식</span></div>
              <div class="content-box-tr1-td2-2-3"><span>></span></div>
              <div class="content-box-tr1-td2-2-4"><span>공지사항</span></div>
            </div>
          </div>

          <!-- content-box-tr1-td3 ::: display: flex wrap용 -->
          <div class="content-box-tr1-td3">
            <!-- 뒷 배경용 #FFEDAF -->
            <div class="content-box-tr1-td3-1">
              <div class="content-box-tr1-td3-1-1">
                <div class="content-box-tr1-td3-1-1-1">
                  <!-- 타이블 첫 행 -->
                  <div class="content-box-tr1-td3-1-1-1-1">
                    <div class="content-box-tr1-td3-1-1-1-1-1 No-width">
                      <span>No</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-1-2 writer-width">
                      <span>글쓴이</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-1-3 title-width">
                      <span>제목</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-1-4 category-width">
                      <span>카테고리</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-1-5 reg-width">
                      <span>작성일</span>
                    </div>
                  </div>
                  <!-- 2번째 행 여기는 forEach문이겠죠?-->
                  <div class="content-box-tr1-td3-1-1-1-2">
                    <div class="content-box-tr1-td3-1-1-1-2-1 No-width">
                      <span>18</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-2-2 writer-width">
                       <span>사토*케시</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-2-3 title-width">
                      <span>일정공지</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-2-4 category-width">
                      <span>일정</span>
                    </div>
                    <div class="content-box-tr1-td3-1-1-1-2-5 reg-width">
                      <span>2023-12-06</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--include 領域展開1 끝-->

	
        <div class="bottom-venner-tr">
          <div class="bottom-venner-td">하단베너</div>
          <div class="bottom-venner-td">상품판매링크</div>
          <div class="bottom-venner-td">추가기능</div>
        </div>


      <div class="footer-tbl">footer</div>
    </div>
  </body>
</html>
