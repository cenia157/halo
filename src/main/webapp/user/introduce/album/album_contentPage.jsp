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
          <div class="a_content-box-tr1-td3-1-1">
            <div class="a_content-box-tr1-td3-1-1-1">
              <img
                src="data:image/jpeg;base64,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"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-1-2">
              <img
                src="https://i.namu.wiki/i/NaXqN1_8XqH2LP6Y80BBHF_5I0HS7Sgdiac1UjhSSME4sSPrZj7JFsKgfxR0Lq8LZZIQZrZLitIqBPsmBdX9jQ.webp"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-1-3">
              <img
                src="https://i.namu.wiki/i/SEPry2iv71cQhyCsFR4Sl1JVHSmewopL6mggHqnxnVSm-wj2R9OuIOJzykNk3lgCFVjiwcHI9OvcSgLsaf3icQ.webp"
                alt=""
              />
            </div>
          </div>
          <div class="a_content-box-tr1-td3-1-2">
            <div class="a_content-box-tr1-td3-1-2-1">
              <img
                src="https://t1.daumcdn.net/cfile/tistory/996069425A50557005"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-2-2">
              <img
                src="https://media.bunjang.co.kr/product/221293138_1_1682679846_w%7Bres%7D.jpg"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-2-3">
              <img
                src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/5273745818/B.jpg?522000000"
                alt=""
              />
            </div>
          </div>
          <div class="a_content-box-tr1-td3-1-3">
            <div class="a_content-box-tr1-td3-1-3-1">
              <img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsgTIEPItgW4R2BLDoHSIXnYFl_EGJqx8FXQ&usqp=CAU"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-3-2">
              <img
                src="https://contents.lotteon.com/itemimage/_v175301/LO/20/19/75/22/87/_2/01/97/52/28/8/LO2019752287_2019752288_1.jpg/dims/resizef/720X720"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-3-3">
              <img
                src="https://mblogthumb-phinf.pstatic.net/MjAyMDEyMjZfMjI5/MDAxNjA4OTgxNTM4MzQx.gHYI63jA4STPDV27uzebkwfXOOrmAs_J-mSSExhKGu0g.zKU7uibIhu1-rIMhXLU7PQcI6UAkqFCIaO6Xp-ij_yIg.JPEG.rayharp/%ED%8E%98%ED%8E%9813.jpeg?type=w800"
                alt=""
              />
            </div>
          </div>
        </div>
      </div>
    </div>

<!--     <script type="text/javascript">
<!--       $.ajax({ -->
<!--         url: "https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url,is_shared_to_feed&access_token=IGQWRQZAWR4ZA2Q5QVk3bVlMQnhmZADFLaUZANQ3RsZAlRoWWJQbWV1RGp6c3F3VUNXM0VFWlllOWx3V3d5aGF5N28zMDJWTU02djJmdTVzdGJYT3hTaGhyQllHNUticWZAMVkdkb2xyQnlOelVsTF82anJrMk9oSExHQ3cZD", -->
<!--         method: "GET", -->
<!--         dataType: "jsonp", -->
<!--         success: function (response) { -->
<!--           console.log(response); -->
<!--           makeView(response); -->
<!--         }, -->
<!--         error: function (xhr, status, error) { -->
<!--           console.log(xhr.responseText); -->
<!--         }, -->
<!--       }); -->

<!--       function makeView(res) { -->
<!--         let items = res.data; -->

<!--         $(".a_content-box-tr1-td3-1").empty(); -->

<!--         $.each(items, function (i, obj) { -->
<!--           let mediaType = obj.media_type; -->
<!--           let mediaTag, mediaUrl; -->

<!--           if (mediaType === "VIDEO") { -->
<!--             mediaTag = $("<video class='api_media' controls></video>"); -->
<!--             mediaUrl = obj.media_url; -->
<!--           } else if (mediaType === "IMAGE") { -->
<!--             mediaTag = $("<img class='api_media'>"); -->
<!--             mediaUrl = obj.media_url; // 이미지일 경우 media_url 사용 -->
<!--           } -->

<!--           let captionDiv = $("<div class='caption'></div>"); -->

<!--           let aTag; -->
<!--           if (mediaType === "VIDEO" || mediaType === "IMAGE") { -->
<!--             aTag = $("<a href='" + obj.permalink + "' target='_blank'></a>"); -->
<!--             mediaTag.attr("src", mediaUrl); // 이미지일 경우 src 속성 지정 -->
<!--           } -->

<!--           $(aTag).append(mediaTag); -->
<!--           $(captionDiv).text(obj.caption); -->

<!--           let gridItem = $("<div class='grid-item'></div>") -->
<!--             .append(aTag) -->
<!--             .append(captionDiv); -->

<!--           $(".content-box-tr1-td3-1").append(gridItem); -->

<!--           // 이미지 로딩 후에 로딩 횟수 증가 -->
<!--           loadImage(mediaTag, function () { -->
<!--             // 이미지가 로딩되면 페이지 버튼을 생성 -->
<!--           }); -->
<!--         }); -->
<!--       } -->

<!--       function loadImage(imgTag, callback) { -->
<!--         imgTag -->
<!--           .on("load", function () { -->
<!--             callback(); -->
<!--           }) -->
<!--           .on("error", function () { -->
<!--             callback(); -->
<!--           }); -->

<!--         imgTag.attr("src", imgTag.attr("src")); -->
<!--       } -->
<!--     </script> --> 
  </body>
</html>
