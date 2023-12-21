<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                <c:forEach var="announcement" items="${announcements}">
              	  <div class="a_content-box-tr1-td3-1-1-1-2-3">
                    <div class="a_content-box-tr1-td3-1-1-1-2-1 No-width">
                      <span>${announcement.an_seq}</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-2-2 writer-width">
                      <span>${announcement.an_writer}</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-2-3 title-width">
                      <span>${announcement.an_title}</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-2-4 category-width">
                      <span>${announcement.an_category}</span>
                    </div>
                    <div class="a_content-box-tr1-td3-1-1-1-2-5 reg-width">
                      <span
                        ><fmt:formatDate
                          value="${announcement.an_reg_date}"
                          pattern="yyyy-MM-dd"
                      /></span>
                    </div>
                   </div>
                  </c:forEach>
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
        <!-- 여기서 소스 활용 시작 -->
        <!-- 문의글 게시판 (디테일) -->
        <div class="qd-content-box-td1-1">
          <span> お知らせ</span>
        </div>
        <div class="qd-content-box-td1-2">
          <div class="qd-content-box-td1-2-1">제목</div>
          <div class="qd-content-box-td1-2-2">일정공지</div>
        </div>

        <div class="qd-content-box-td1-3">
          <div class="qd-content-box-td1-3-1">작성자</div>
          <div class="qd-content-box-td1-3-2">오오데아키코</div>
        </div>

        <div class="qd-content-box-td1-4">
          <div class="qd-content-box-td1-4-content">
            <span class="qd-content-box-td1-4-1">작성일: </span>
            <span class="qd-content-box-td1-4-2">23-12-15</span>
          </div>
        </div>

        <!-- 본문 -->
        <div class="qd-content-box-td2-1">
          <div class="qd-content-box-td2-1-content">
            안녕하세요, 운영자입니다. <br />
            일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br />
            평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이
            가능한지 궁금합니다. <br />
            안녕하세요, 운영자입니다. <br />
            일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br />
            평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이
            가능한지 궁금합니다. <br />
            안녕하세요, 운영자입니다. <br />
            일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br />
            평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이
            가능한지 궁금합니다. <br />
            안녕하세요, 운영자입니다. <br />
            일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br />
            평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이
            가능한지 궁금합니다. <br />
            안녕하세요, 운영자입니다. <br />
            일정관리를 다음과 같이 알려드립니다. 시세확장때문에 하는데요. <br />
            평일 중 2일과 주말 1일을 정기적으로 한 달 동안 이용하는 것이
            가능한지 궁금합니다. <br />
            부모님의 편의를 생각해서 가능한 빠른 답변 부탁드립니다. 다음 주에도
            가능하다면 좋겠어요. <br />
            <br />
            부모님을 위한 편리한 이동이라는 목적으로 서비스를 검토 중이니,
            <br />
            어떤 혜택이나 특별한 안내사항이 있는지도 함께 알려주시면
            감사하겠습니다 오버플로우 오토로 줬어요. <br />
          </div>
        </div>

        <div class="qd-content-box-td2-2">
          <button class="qd-content-box-td2-2-button">닫기</button>
        </div>
      </div>
    </div>
    <!-- 모달끝 -->

    <script>
      window.onload = function () {
        let modal = document.querySelector("#myModal");
        let modalContent = document.querySelector(".modal-content"); // 모달 내용 요소
        let triggerElement = document.querySelector(
          ".a_content-box-tr1-td3-1-1-1-2-3"
        );
        let headerTbl = document.querySelector(".header-tbl");
        let closeModalButtons = document.querySelectorAll(
          ".qd-content-box-td2-2-button"
        );
        let contentBox = document.querySelector(
          ".qd-content-box-td2-1-content"
        ); // 스크롤 위치 조정을 위한 요소

        // 모달 표시 이벤트 리스너
        triggerElement.addEventListener("click", function () {
          modal.style.display = "flex";
          contentBox.scrollTop = 0; // 스크롤 위치를 맨 위로 설정
          if (headerTbl) {
            headerTbl.style.display = "none";
          }
        });

        // 모달 닫기 버튼 이벤트 리스너
        closeModalButtons.forEach(function (button) {
          button.addEventListener("click", function () {
            modal.style.display = "none";
            if (headerTbl) {
              headerTbl.style.display = "block";
            }
          });
        });
        
        $(document).keydown(function (e) {
          if (e.key === "Escape") {
            // 'Escape'는 ESC 키를 나타냄
            // 'click' 이벤트 생성
            var event = new Event("click");
            closeModalButtons[0].dispatchEvent(event);
          }
        });
        // 모달 외부 클릭 시 모달 닫기 이벤트 리스너
        window.addEventListener("click", function (e) {
          // 모달 내용이 아닌 부분을 클릭했는지 확인
          if (e.target === modal && !modalContent.contains(e.target)) {
            modal.style.display = "none";
            if (headerTbl) {
              headerTbl.style.display = "block";
            }
          }
        });
      };
    </script>
  </body>
</html>