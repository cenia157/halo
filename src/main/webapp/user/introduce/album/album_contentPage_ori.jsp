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
            <div class="a_content-box-tr1-td3-1-1-1 insta0">
   
            </div>
            <div class="a_content-box-tr1-td3-1-1-2 insta1">
       
            </div>
            <div class="a_content-box-tr1-td3-1-1-3 insta2">
       
            </div>
          </div>
          <div class="a_content-box-tr1-td3-1-2">
            <div class="a_content-box-tr1-td3-1-2-1 insta3">
        
            </div>
            <div class="a_content-box-tr1-td3-1-2-2 insta4">
              <img
                src="https://media.bunjang.co.kr/product/221293138_1_1682679846_w%7Bres%7D.jpg"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-2-3 insta5">
              <img
                src="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/product/5273745818/B.jpg?522000000"
                alt=""
              />
            </div>
          </div>
          <div class="a_content-box-tr1-td3-1-3">
            <div class="a_content-box-tr1-td3-1-3-1 insta6">
              <img
                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsgTIEPItgW4R2BLDoHSIXnYFl_EGJqx8FXQ&usqp=CAU"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-3-2 insta7">
              <img
                src="https://contents.lotteon.com/itemimage/_v175301/LO/20/19/75/22/87/_2/01/97/52/28/8/LO2019752287_2019752288_1.jpg/dims/resizef/720X720"
                alt=""
              />
            </div>
            <div class="a_content-box-tr1-td3-1-3-3 insta8">
              <img
                src="https://mblogthumb-phinf.pstatic.net/MjAyMDEyMjZfMjI5/MDAxNjA4OTgxNTM4MzQx.gHYI63jA4STPDV27uzebkwfXOOrmAs_J-mSSExhKGu0g.zKU7uibIhu1-rIMhXLU7PQcI6UAkqFCIaO6Xp-ij_yIg.JPEG.rayharp/%ED%8E%98%ED%8E%9813.jpeg?type=w800"
                alt=""
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            // JSTL을 사용하여 서블릿에서 전달받은 토큰 사용
            var token = "${token}";

            $.ajax({
                url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url&access_token=' + token,
                method: 'GET',
                dataType: 'jsonp',
                success: function(response) {
                    console.log(response);
                    makeView(response);
                },
                error: function(xhr, status, error) {
                    console.log(xhr.responseText);
                }
            });

            function makeView(res) {
                let items = res.data;
                $(".item-row").empty(); // 기존 내용을 비움

                $.each(items, function(i, obj) {
                    let mediaTag;
                    if (obj.media_type === 'VIDEO') {
                        	mediaTag = $("<video class='video' autoplay loop controls></video>").attr("src", obj.media_url);
		                    /* let aTag = $("<a></a>").attr("href", obj.permalink).attr("target", "_blank").append(mediaTag);*/
		                    let itemDiv = $('.insta'+i).append(mediaTag)
                    } else {
                        mediaTag = $("<img class='img'>").attr("src", obj.media_url);
		                    let itemDiv = $('.insta'+i).append(mediaTag)
                    }


                });
            }
        });
    </script>
  </body>
</html>
