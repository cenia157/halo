window.onload = function () {
  console.log("ㅋㅋㅋㅋ");
  let modal = document.getElementById("myModal");
  let triggerElement = document.querySelector(
    ".a_content-box-tr1-td3-1-1-1-2-3"
  );

  // 특정 요소에 클릭 이벤트 리스너 추가
  triggerElement.addEventListener("click", function () {
    console.log("모달을 표시합니다."); // 디버깅용 로그
    modal.style.display = "flex";
  });

  // 모달 외부 클릭 시 모달 닫기
  window.addEventListener("click", function (e) {
    if (e.target === modal) {
      console.log("모달 외부를 클릭하여 모달을 닫았습니다."); // 디버깅용 로그
      modal.style.display = "none";
    }
  });
};
