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
      href="${pageContext.request.contextPath}/user/introduce/announcement/0.css/announcement_contentPage.css"
    />
  </head>
  <body>
    <!--     <div class="a_container"> -->
    <div class="a_content-tbl">
      <!--ody 구분선 1 시작-->

      <div class="a_content-box-tr1">
        <div class="a_content-box-tr1-td1">
          <div class="a_content-box-tr1-td1-1">
            <span><a href="www.test.com">공지사항</a></span>
          </div>
          <div class="a_content-box-tr1-td1-2">
            <span><a href="www.test.com">앨범</a></span>
          </div>
          <div class="a_content-box-tr1-td1-3">
            <span><a href="www.test.com">채용공고</a></span>
          </div>
        </div>

        <div class="a_content-box-tr1-td2">
          <div class="a_content-box-tr1-td2-1">
            <img
              src="${pageContext.request.contextPath}/user/0.img/home.png"
              width="1.7%"
              alt=""
            />
            > 소개 > 회사소개
          </div>
        </div>

        <!-- content-box-tr1-td3 ::: display: flex wrap용 -->
        <div class="a_content-box-tr1-td3">
          <!-- 뒷 배경용 #FFEDAF -->
          <div class="a_content-box-tr1-td3-1">
            <div class="a_content-box-tr1-td3-1-1">
              <div class="a_content-box-tr1-td3-1-1-1">
                <!-- 타이블 첫 행 -->
                <div class="a_content-box-tr1-td3-1-1-1-1">
                  <div class="a_content-box-tr1-td3-1-1-1-1-1 No-width">
                    <span>No</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-1-2 writer-width">
                    <span>글쓴이</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-1-3 title-width">
                    <span>제목</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-1-4 category-width">
                    <span>카테고리</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-1-5 reg-width">
                    <span>작성일</span>
                  </div>
                </div>
                <!-- 2번째 행 여기는 forEach문이겠죠?-->
                <div class="a_content-box-tr1-td3-1-1-1-2">
                  <div class="a_content-box-tr1-td3-1-1-1-2-1 No-width">
                    <span>18</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-2-2 writer-width">
                    <span>사토*케시</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-2-3 title-width">
                    <span>일정공지</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-2-4 category-width">
                    <span>일정</span>
                  </div>
                  <div class="a_content-box-tr1-td3-1-1-1-2-5 reg-width">
                    <span>2023-12-06</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="a_content-box-tr1-td3-1-2">페이징 아이콘</div>
          </div>
        </div>
      </div>
    </div>
    <!--ody 구분선 1 끝-->
    <!--     </div> -->
    <!-- 모달시작 -->
    <div id="myModal" class="modal">
      <div class="modal-content">
        <input
          type="text"
          name="m_title"
          class="modal-input"
          placeholder="제목"
        />
        <input
          type="text"
          name="m_actor"
          class="modal-input"
          placeholder="배우"
        />
        <input
          type="text"
          name="m_img"
          class="modal-input"
          placeholder="이미지 URL"
        />
        <input
          type="text"
          name="m_story"
          class="modal-input"
          placeholder="줄거리"
        />
        <button type="submit" class="modal-button">전송</button>
      </div>
    </div>
    <!-- 모달끝 -->

    <script>
      //   window.onload = function () {
      //     let modal = document.getElementById("myModal");

      //     // 모든 modalBtn 클래스를 가진 버튼에 대해 이벤트 등록
      //     let modalBtns = document.querySelectorAll(".modalBtn");

      //     modalBtns.forEach(function (modalBtn) {
      //       modalBtn.addEventListener("click", function () {
      //         console.log("모달 버튼이 클릭되었습니다."); // 디버깅용 로그
      //         modal.style.display = "flex";
      //       });
      //     });

      //     // 모달 닫기
      //     window.addEventListener("click", function (e) {
      //       if (e.target === modal) {
      //         console.log("모달 외부를 클릭하여 모달을 닫았습니다."); // 디버깅용 로그
      //         modal.style.display = "none";
      //       }
      //     });
      //   };

      // window.onload = function () {
      //   let modal = document.getElementById("myModal");
      //   let triggerElement = document.querySelector(
      //     ".a_content-box-tr1-td3-1-1-1-2-3"
      //   );

      //   // 특정 요소에 클릭 이벤트 리스너 추가
      //   triggerElement.addEventListener("click", function () {
      //     console.log("모달을 표시합니다."); // 디버깅용 로그
      //     modal.style.display = "flex";
      //   });

      //   // 모달 외부 클릭 시 모달 닫기
      //   window.addEventListener("click", function (e) {
      //     if (e.target === modal) {
      //       console.log("모달 외부를 클릭하여 모달을 닫았습니다."); // 디버깅용 로그
      //       modal.style.display = "none";
      //     }
      //   });
      // };
    </script>
  </body>
</html>
