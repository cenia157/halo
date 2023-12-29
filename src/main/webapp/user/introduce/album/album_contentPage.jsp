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
        <a
          class="a_content-box-tr1-td2-2"
          href="https://www.instagram.com/ody_1004/"
          target="_blank"
        >
          <div class="a_content-box-tr1-td2-2-1">
            <img
              src="${pageContext.request.contextPath}/user/introduce/album/0.img/insta_logo.png"
              alt=""
            />
          </div>
          <div class="a_content-box-tr1-td2-2-2">instagramで見る</div>
        </a>
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
        </div>
        <!--여기까지 동적생성 -->
      </div>
    </div>
    <script type="text/javascript">
	  //전역변수들
      let page = 0;
      let totalPage;
      let items;
      let scroll_index = 0;
      let scroll_per_val;

      $(document).ready(function () {

        let token = "${apiToken}"

        $.ajax({
          url:
            "https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url&access_token=" +
            token,
          method: "GET",
          dataType: "jsonp",
          success: function (response) {
            console.log("response :::" + response);
            console.log(" response.data :::" +  response.data);
            console.log("API Response:", response);
            items = response.data;
            console.log("items :::" + items);
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
            if (i == 24) {
              break;
            }

            if (items[i] == null) {
              break;
            }

            if (i % 3 == 0) {
              rowDiv = $("<div></div>").addClass("rowDiv");
              container.append(rowDiv);
            }

            let columnDiv = $("<div></div>").addClass("insta" + i);
            rowDiv.append(columnDiv);

            if (items[i].media_type === "VIDEO") {
              mediaTag = $("<video class='video' loop controls></video>").attr(
                "src",
                items[i].media_url
              );
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

		function makeInstaIcon() {
		    let container = $(".a_content-box-tr1-td3-1");
		    let under_icon_div = $("<div></div>").addClass("under_icon_div");
		
		    // CSS 속성 설정
		    under_icon_div.css({
		        height: "auto",
		    });
		
		    // 새로운 div 요소 생성
		    let innerDiv = $("<div></div>")
		        .addClass("inner_div")
		        .css({
		            cursor: "pointer", // 마우스 커서 포인터로 변경
		        })
		        .click(function () {
		            // innerDiv를 클릭했을 때 Instagram 프로필 페이지로 이동
		            window.location.href = "https://www.instagram.com/ody_1004/", "_blank";
		        });
		
		    // 첫 번째 내부 div 생성 및 클래스 추가
		    let innerDivIcon = $("<div></div>").addClass("innerDiv_icon");
		
		    // 이미지를 포함하는 img 요소 생성 및 속성 설정
		    let img = $("<img />")
		        .addClass("insta_img")
		        .attr("src", "${pageContext.request.contextPath}/user/introduce/album/0.img/insta_logo2.png")
		        .css({
		            width: "100%",
		            height: "100%",
		        });
		
		    // img 요소를 innerDivIcon에 추가
		    innerDivIcon.append(img);
		
		    // 두 번째 내부 div 생성 및 클래스 추가
		    let innerDivWord = $("<div></div>").addClass("innerDiv_word");
		
		    innerDivWord.html("Instagram&nbsp;でフォロー");
		
		    // 각 내부 div를 innerDiv에 추가
		    innerDiv.append(innerDivIcon);
		    innerDiv.append(innerDivWord);
		
		    // 각 내부 div에 CSS 속성 설정
		    innerDivIcon.css({
		        width: "20%",
		        height: "20%",
		    });
		
		    innerDivWord.css({
		        color: "#006400",
		        "font-weight": "700",
		        "margin-left": "1.5%",
		        "font-size": "1.5rem",
		        "white-space": "nowrap",
		    });
		
		    // innerDiv를 under_icon_div에 추가
		    under_icon_div.append(innerDiv);
		
		    container.append(under_icon_div);
		} // makeInstaIcon()

        window.addEventListener("scroll", function () {
          console.log("window.scrollY ::: " + window.scrollY);
          let scrollValue_px = window.scrollY;
          let scrollPercentage =
            (scrollValue_px /
              (document.body.scrollHeight - window.innerHeight)) *
            100;
          console.log("scrollPercentage :::" + scrollPercentage);

          switch (scroll_index) {
            case 0:
              scroll_per_val = 73;
              break;
            case 1:
              scroll_per_val = 84;
              break;
            case 2:
              scroll_per_val = 90;
              break;
            default:
              scroll_per_val = 101; // 예외 처리 101 도달 불가능함
              break;
          }

          if (scrollPercentage >= scroll_per_val) {
            if (scroll_index <= 2) {
              makeView(); // makeView 함수 호출
              if (scroll_index == 2) {
                makeInstaIcon();
                console.log("makeInstaIcon()실행");
              }
            }

            scroll_index++;
            console.log("scroll_index ::" + scroll_index);
          } // if (scrollPercentage >= scroll_per_val)
        }); // window.addEventListener('scroll', function()
      }); //  $(document).ready(function () {
    </script>
  </body>
</html>
