<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/introduce/album/0.css/album_contentPage.css" />
    <!-- 인스타 API 연동을 위한 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>

<body>
            <!-- 구분선1 시작 -->
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
                    <img class="a_content-box-tr1-td2-1" src="${pageContext.request.contextPath}/user/introduce/album/0.img/home_icon.svg" alt="" />
                    <!-- [ > 소식 > 앨범 ] 상위 box -->
                    <div class="a_content-box-tr1-td2-2">
                        <div class="a_content-box-tr1-td2-2-1"><span>></span></div>
                        <div class="a_content-box-tr1-td2-2-2"><span>소식</span></div>
                        <div class="a_content-box-tr1-td2-2-3"><span>></span></div>
                        <div class="a_content-box-tr1-td2-2-4"><span>앨범</span></div>
                    </div>
                </div>

                <!-- content-box-tr1-td3 ::: display: flex wrap용 -->
                <div class="a_content-box-tr1-td3">
                    <!-- 인스타 3x3 담을 곳 -->
<!--일단 주석처리해줌 나중에 api 연동할떄 열기<div class="content-box-tr1-td3-1"> -->
                    </div>
                </div>
            </div>

<script type="text/javascript">
    $.ajax({
        url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url,is_shared_to_feed&access_token=IGQWRQZAWR4ZA2Q5QVk3bVlMQnhmZADFLaUZANQ3RsZAlRoWWJQbWV1RGp6c3F3VUNXM0VFWlllOWx3V3d5aGF5N28zMDJWTU02djJmdTVzdGJYT3hTaGhyQllHNUticWZAMVkdkb2xyQnlOelVsTF82anJrMk9oSExHQ3cZD',
        method: 'GET',
        dataType: 'jsonp',
        success: function (response) {
            console.log(response);
            makeView(response);
        },
        error: function (xhr, status, error) {
            console.log(xhr.responseText);
        }
    });

    function makeView(res) {
        let items = res.data;

        $(".a_content-box-tr1-td3-1").empty();

        $.each(items, function (i, obj) {
            let mediaType = obj.media_type;
            let mediaTag, mediaUrl;

            if (mediaType === 'VIDEO') {
                mediaTag = $("<video class='api_media' controls></video>");
                mediaUrl = obj.media_url;
            } else if (mediaType === 'IMAGE') {
                mediaTag = $("<img class='api_media'>");
                mediaUrl = obj.media_url;  // 이미지일 경우 media_url 사용
            }

            let captionDiv = $("<div class='caption'></div>");

            let aTag;
            if (mediaType === 'VIDEO' || mediaType === 'IMAGE') {
                aTag = $("<a href='" + obj.permalink + "' target='_blank'></a>");
                mediaTag.attr("src", mediaUrl);  // 이미지일 경우 src 속성 지정
            }

            $(aTag).append(mediaTag);
            $(captionDiv).text(obj.caption);

            let gridItem = $("<div class='grid-item'></div>").append(aTag).append(captionDiv);

            $(".content-box-tr1-td3-1").append(gridItem);

            // 이미지 로딩 후에 로딩 횟수 증가
            loadImage(mediaTag, function () {
                // 이미지가 로딩되면 페이지 버튼을 생성
            });
        });
    }

    function loadImage(imgTag, callback) {
        imgTag.on("load", function () {
            callback();
        }).on("error", function () {
            callback();
        });

        imgTag.attr("src", imgTag.attr("src"));
    }
</script>

</body>

</html>
