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

// window.addEventListener("scroll", function () {
//   // 스크롤 위치를 가져온다.
//   var scrollY = window.scrollY;

//   // 각 슬라이드의 z-index를 설정한다.
//   var slide1 = document.querySelector("#background-img-rightCloud");
//   slide1.style.zIndex = 1 - Math.floor(scrollY / 200);
//   var slide2 = document.querySelector("#background-img-leftCloud");
//   slide2.style.zIndex = 2 - Math.floor(scrollY / 200);
//   var slide3 = document.querySelector("#background-img-rightPink");
//   slide3.style.zIndex = 3 - Math.floor(scrollY / 200);
//   var slide4 = document.querySelector("#background-img-leftPink");
//   slide4.style.zIndex = 4 - Math.floor(scrollY / 200);
//   var slide5 = document.querySelector("#background-img-mountain");
//   slide5.style.zIndex = 5 - Math.floor(scrollY / 200);
// });

//구글
// window.addEventListener("scroll", function () {
//   // Update the animation progress based on scroll position
//   var scrollY = window.scrollY;
//   var progress = scrollY / window.innerHeight;

//   // Update the transform property of each slide
//   document.querySelector(
//     "#background-img-rightCloud"
//   ).style.transform = `translateY(${progress * 100}vh)`;
//   document.querySelector(
//     "#background-img-leftCloud"
//   ).style.transform = `translateY(${progress * 140}vh)`;
//   document.querySelector(
//     "#background-img-rightPink"
//   ).style.transform = `translateY(${progress * 200}vh)`;
//   document.querySelector(
//     "#background-img-leftPink"
//   ).style.transform = `translateY(${progress * 240}vh)`;
//   document.querySelector(
//     "#background-img-mountain"
//   ).style.transform = `translateY(${progress * 300}vh)`;
// });

// //스크롤 이벤트를 처리하고 애니메이션 진행률을 업데이트하는 함수
// function updateAnimation() {
// //스크롤 위치를 기반으로 애니메이션 진행률을 업데이트합니다.
// var scrollY = window.scrollY;
// var progress = scrollY / window.innerHeight;

//   // 각 슬라이드의 transform 속성을 업데이트합니다.
//   document.querySelector(
//     "#background-img-rightCloud"
//   ).style.transform = `translateY(${progress * 100}vh)`;
//   document.querySelector(
//     "#background-img-leftCloud"
//   ).style.transform = `translateY(${progress * 140}vh)`;
//   document.querySelector(
//     "#background-img-rightPink"
//   ).style.transform = `translateY(${progress * 200}vh)`;
//   document.querySelector(
//     "#background-img-leftPink"
//   ).style.transform = `translateY(${progress * 240}vh)`;
//   document.querySelector(
//     "#background-img-mountain"
//   ).style.transform = `translateY(${progress * 300}vh)`;
// }

// // 스크롤 이벤트를 감지하고 updateAnimation 함수를 호출합니다.
// window.addEventListener("scroll", updateAnimation);

// // 페이지 로딩 시 스크롤 위치를 기반으로 초기 상태를 설정하기 위한 초기 호출
// updateAnimation();

// 애니메이션 함수
function updateAnimation() {
  // 스크롤 위치를 기반으로 애니메이션 진행률
  let scrollY = window.scrollY;
  let progress = scrollY / window.innerHeight;
  let reverseProgress = 1 - progress; //반대 방향 변수
  // 각 슬라이드의 transform 속성
  document.querySelector(
    "#background-img-rightCloud"
  ).style.transform = `translateY(${progress * 100}vh)`;
  document.querySelector(
    "#background-img-leftCloud"
  ).style.transform = `translateY(${progress * 140}vh)`;
  document.querySelector(
    "#background-img-rightPink"
  ).style.transform = `translateY(${progress * 200}vh)`;
  document.querySelector(
    "#background-img-leftPink"
  ).style.transform = `translateY(${progress * 240}vh)`;
  document.querySelector(
    "#background-img-sunset"
  ).style.transform = `translateY(${progress * 300}vh)`;

  // 스크롤 이벤트 리스너를 제거합니다.
  window.removeEventListener("scroll", updateAnimation);
}

// 스크롤 이벤트 리스너를 추가합니다.
window.addEventListener("scroll", updateAnimation);
