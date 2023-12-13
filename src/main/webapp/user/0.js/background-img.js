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

// var $html = $("html");
// var page = 1;
// var lastPage = $(".content").length;

// window.addEventListener(
//   "wheel",
//   function (e) {
//     e.preventDefault();
//   },
//   { passive: false }
// );

// $(window).on("wheel", function (e) {
//   if ($html.is(":animated")) return;

//   if (e.originalEvent.deltaY > 0) {
//     if (page == lastPage) return;

//     page++;
//   } else if (e.originalEvent.deltaY < 0) {
//     if (page == 1) return;

//     page--;
//   }
//   var posTop = (page - 1) * $(window).height();

//   $html.animate({ scrollTop: posTop });
// });

window.addEventListener("scroll", function () {
  // 스크롤 위치를 가져온다.
  var scrollY = window.scrollY;

  // 각 슬라이드의 z-index를 설정한다.
  var slide1 = document.querySelector("#background-img-rightCloud");
  slide1.style.zIndex = 1 - Math.floor(scrollY / 200);
  var slide2 = document.querySelector("#background-img-leftCloud");
  slide2.style.zIndex = 2 - Math.floor(scrollY / 200);
  var slide3 = document.querySelector("#background-img-rightPink");
  slide3.style.zIndex = 3 - Math.floor(scrollY / 200);
  var slide4 = document.querySelector("#background-img-leftPink");
  slide4.style.zIndex = 4 - Math.floor(scrollY / 200);
  var slide5 = document.querySelector("#background-img-mountain");
  slide5.style.zIndex = 5 - Math.floor(scrollY / 200);
});
