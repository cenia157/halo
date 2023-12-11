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

$(function () {
  $(window).scroll(function () {
    //스크롤 위치를 가져옴
    var scrollPosition = $(window).scrollTop();
    //구름을 스크롤 위치에 맞게 이동
    $(".background-imge-leftPink").css(
      "transform",
      "translateX(" + -scrollPosition + "px)"
    );
    $(".background-imge-rightPink").css(
      "transform",
      "translateX(" + scrollPosition + "px)"
    );
  });
});
