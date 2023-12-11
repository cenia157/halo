// $(function () {
//   $(document).scroll(function () {
//     var scrollPosition = $(window).scrollTop();
//     var slideImage = $(".background-imge-leftPink");
//     var slideFactor = 0.5;
//     slideImage.css(
//       "transform",
//       "translateX(" + scrollPosition * slideFactor + "px)"
//     );
//   });
// });

// let backImg = document.querySelector(".background-imge-rightCloud");

// window.addEventListener("scroll", function () {
//   let value = this.window.scrollY;
//   console.log("scrollY", value);

//   if (value > 100) {
//     backImg.style.animation = "disappear 1s ease-out forwards";
//   } else {
//     backImg.style.animation = "slide 1s ease-out";
//   }
// });
//배경이미지 애니메이션 로직
// $(document).ready(function () {
//   $(window).scroll(function () {
//     // 스크롤 위치에 따라 투명도를 조절하여 나타나게 함
//     var scrollTop = $(this).scrollTop();
//     $(".background-image").css("opacity", Math.max(0, 1 - scrollTop / 400));

//     // 필요에 따라 다른 애니메이션 로직 추가
//   });
// });

var $html = $("html");
var page = 1;
var lastPage = $(".content").length;

window.addEventListener(
  "wheel",
  function (e) {
    e.preventDefault();
  },
  { passive: false }
);

$(window).on("wheel", function (e) {
  if ($html.is(":animated")) return;

  if (e.originalEvent.deltaY > 0) {
    if (page == lastPage) return;

    page++;
  } else if (e.originalEvent.deltaY < 0) {
    if (page == 1) return;

    page--;
  }
  var posTop = (page - 1) * $(window).height();

  $html.animate({ scrollTop: posTop });
});
