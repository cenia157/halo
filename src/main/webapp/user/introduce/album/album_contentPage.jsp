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
      href="${pageContext.request.contextPath}/user/introduce/album/0.css/album_contentPage.css"
    />
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <!-- 구분선1 시작 -->
    <div class="a_content-box-tr1">
      <div class="a_content-box-tr1-td1">
        <div class="a_content-box-tr1-td1-1">
          <span><a href="//www.test.com">공지사항</a></span>
        </div>
        <div class="a_content-box-tr1-td1-2">
          <span><a href="//www.test.com">앨범</a></span>
        </div>
        <div class="a_content-box-tr1-td1-3">
          <span><a href="//www.test.com">채용공고</a></span>
        </div>
      </div>

      <div class="a_content-box-tr1-td2">
        <div class="a_content-box-tr1-td2-1">
          <img
            src="${pageContext.request.contextPath}/user/0.img/home.png"
            width="1.7%"
            alt=""
          />
          > 소개 > 앨범
        </div>
      </div>

      <!-- content-box-tr1-td3 ::: display: flex wrap용 -->
      <div class="a_content-box-tr1-td3">
        <div class="a_content-box-tr1-td3-1">
          <!--여기서부터 동적생성 -->
          <!--           <div class="a_content-box-tr1-td3-1-1"> -->
          <!--             <div class="a_content-box-tr1-td3-1-1-1 insta0"> -->

          <!--             </div> -->
          <!--             <div class="a_content-box-tr1-td3-1-1-2 insta1"> -->

          <!--             </div> -->
          <!--             <div class="a_content-box-tr1-td3-1-1-3 insta2"> -->

          <!--             </div> -->
          <!--           </div> -->
          <!--           <div class="a_content-box-tr1-td3-1-2"> -->
          <!--             <div class="a_content-box-tr1-td3-1-2-1 insta3"> -->

          <!--             </div> -->
          <!--             <div class="a_content-box-tr1-td3-1-2-2 insta4"> -->

          <!--             </div> -->
          <!--             <div class="a_content-box-tr1-td3-1-2-3 insta5"> -->

          <!--             </div> -->
          <!--           </div> -->
          <!--           <div class="a_content-box-tr1-td3-1-3"> -->
          <!--             <div class="a_content-box-tr1-td3-1-3-1 insta6"> -->

          <!--             </div> -->
          <!--             <div class="a_content-box-tr1-td3-1-3-2 insta7"> -->

          <!--             </div> -->
          <!--             <div class="a_content-box-tr1-td3-1-3-3 insta8"> -->

          <!--             </div> -->
          <!--           </div> -->
          <!--여기까지 동적생성 -->
        </div>
      </div>
    </div>
    <script type="text/javascript">
      let page = 0;
      let totalPage;
      let items;
      let scroll_index = 0;
      let totalHeight;

      $(document).ready(function () {
        // JSTL을 사용하여 서블릿에서 전달받은 토큰 사용
        let token = "${token}";

        $.ajax({
          url:
            "https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url&access_token=" +
            token,
          method: "GET",
          dataType: "jsonp",
          success: function (response) {
            console.log('response :::' + response);
            items = response.data;
            console.log('items :::' + items);
            makeView();
          },
          error: function (xhr, status, error) {
            console.log(xhr.responseText);
          },
        });

        function makeView() {
          let mediaTag;
          totalPage = Math.ceil(items.length / 9);
          console.log("토탈페이지: " + totalPage);

          $(".item-row").empty(); // 기존 내용을 비움

          console.log("items.length: " + items.length);
          console.log("page: " + page);

          let container = $(".a_content-box-tr1-td3-1");
          let rowDiv;

          if (page > totalPage) {
            return;
            console.log("page > totalPage");
          }

          for (let i = page * 9; i < (1 + page) * 9; i++) {
            if (items[i] == null) { break;}

            if (i % 3 == 0) {
              rowDiv = $("<div></div>").addClass("rowDiv");
              container.append(rowDiv);
            }

            let columnDiv = $("<div></div>").addClass("insta" + i);
            rowDiv.append(columnDiv);

            if (items[i].media_type === "VIDEO") {
              mediaTag = $(
                "<video class='video' autoplay loop controls></video>"
              ).attr("src", items[i].media_url);
            } else {
              mediaTag = $("<img class='img'>").attr("src", items[i].media_url);
            }

            // a 태그로 mediaTag를 감싸서 각 insta div 엘리먼트에 추가
            let aTag = $("<a></a>")
              .attr("href", items[i].permalink)
              .attr("target", "_blank")
              .append(mediaTag);

            // 이미지 또는 비디오를 추가할 대상 div 엘리먼트를 찾아서 추가
            $(".insta" + i)
              .empty()
              .append(aTag);
          } // for (let i = page*perPage_divNum; i < (1 + page) * 9; i++)

          page++;

          console.log("page++ :::" + page);
        } // makeView(res)

        window.addEventListener("scroll", function () {
          console.log("window.scrollY ::: " + window.scrollY);
          let scrollValue_px = window.scrollY;
          let scrollPercentage =
            (scrollValue_px /
              (document.body.scrollHeight - window.innerHeight)) *
            100;
          console.log("scrollPercentage :::" + scrollPercentage);

          let haedHeight = 800;
          let contentHeight = 500;
          totalHeight = haedHeight + contentHeight

          if (scroll_index >= 1) {
        	  totalHeight += 900;
          }

          // 스크롤 값이 800 이상인 경우 makeView 함수 실행
          if (scrollValue_px >= totalHeight) {
            makeView(); // makeView 함수 호출
            console.log("************************************");
            console.log("*makeView()호출 !@$$%!@%!@%!@%!@%!@%*");
            console.log("************************************");
            scroll_index++;
          }
        }); // window.addEventListener('scroll', function()
      });
    </script>
  </body>
</html>
