<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/introduce/album/0.css/album.css" />
    <!-- 인스타 API 연동을 위한 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
            <!-- include 영역 시작 -->
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
                    <img class="content-box-tr1-td2-1" src="${pageContext.request.contextPath}/user/introduce/album/0.img/home_icon.svg" alt="" />
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
                        <!-- chat-gpt 수정or추가: 여기에 test_mz2.html 코드 전부 추가 -->
                        <div class="pagination"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- include 영역 끝 -->
        <div class="content-tbl2">하단 배너</div>
        <div class="footer-tbl">footer</div>
    </div>
    
 <script type="text/javascript">
  $.ajax({
    url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url,is_shared_to_feed&access_token=IGQWRQcnJKVUZAjLTJJZAzhtV1J6UEF4M000azdRZAm5nYTh6bkl6dHg5VW1IaTVSNXBkdEE5cGNoMmFxSjkyamtKQ2poU19VWUhVQXFKRm5TekNvWC03LVFNV2JvYURaZAXNqLUlyNDh4QzRyeFozbGFXeDJBcFluUjQZD',
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
    let originUrl;

    // 한 페이지당 보여줄 아이템 수
    const itemsPerPage = 9;

    // 현재 페이지
    let currentPage = 1;

    // 전체 페이지 수
    const totalPages = Math.ceil(items.length / itemsPerPage);

    // 시작 인덱스
    const startIndex = (currentPage - 1) * itemsPerPage;

    // 끝 인덱스
    const endIndex = startIndex + itemsPerPage;

    // 현재 페이지에 해당하는 아이템들만 가져오기
    const currentPageItems = items.slice(startIndex, endIndex);

    // 이미지를 보여주는 함수
    function showImages(items) {
      $(".content-box-tr1-td3-1").empty();
      $.each(items, function (i, obj) {
        let wrapDiv = $("<div class='grid-item'></div>");
        let imgDiv = $("<img class='api_img'>");
        let captionDiv = $("<div class='caption'></div>");
        let aTag = $("<a></a>");
        $(aTag).attr("href", obj.permalink);
        $(aTag).attr("target", "_blank");
        $(imgDiv).attr("onclick", originUrl);
        $(imgDiv).attr("src", obj.media_url);
  
        $(aTag).append(imgDiv);
        $(captionDiv).text(obj.caption);
        $(wrapDiv).append(aTag).append(captionDiv);
        $(".content-box-tr1-td3-1").append(wrapDiv);
      });
    }

    // 페이지 변경을 처리하는 함수
    function changePage(newPage) {
      currentPage = newPage;
      const newStartIndex = (currentPage - 1) * itemsPerPage;
      const newEndIndex = newStartIndex + itemsPerPage;

      // 서버에서 새로운 데이터 가져오도록 수정
      $.ajax({
        url: 'https://graph.instagram.com/me/media?fields=id,caption,media_type,media_url,permalink,thumbnail_url,is_shared_to_feed&access_token=IGQWRQcnJKVUZAjLTJJZAzhtV1J6UEF4M000azdRZAm5nYTh6bkl6dHg5VW1IaTVSNXBkdEE5cGNoMmFxSjkyamtKQ2poU19VWUhVQXFKRm5TekNvWC03LVFNV2JvYURaZAXNqLUlyNDh4QzRyeFozbGFXeDJBcFluUjQZD',
        method: 'GET',
        dataType: 'jsonp',
        success: function (response) {
          items = response.data;
          const newPageItems = items.slice(newStartIndex, newEndIndex);
          showImages(newPageItems);
        },
        error: function (xhr, status, error) {
          console.log(xhr.responseText);
        }
      });
    }

    // 페이지 버튼을 생성하는 함수
    function createPagination() {
      $(".pagination").empty();
      for (let i = 1; i <= totalPages; i++) {
        const pageButton = $("<button></button>").text(i);
        pageButton.click(function () {
          changePage(i);
        });
        $(".pagination").append(pageButton);
      }
    }

    showImages(currentPageItems);
    createPagination();
  }
</script>





    
</body>
</html>
