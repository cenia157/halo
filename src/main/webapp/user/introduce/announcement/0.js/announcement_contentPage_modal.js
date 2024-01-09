	window.onload = function () {
  
    let modal = document.querySelector("#myModal");
    let closeModalButtons = document.querySelectorAll(".qd-content-box-td2-2-button");

    let modalContent = document.querySelector(".modal-content"); 
    let ancTitleDiv = document.querySelector(".ancTitleDiv"); 
    let headerTbl = document.querySelector(".header-tbl");
    let contentBox = document.querySelector(".qd-content-box-td2-1-content"); 

    $(document).keydown(function (e) {
      if (e.key === "Escape") {
     
        let event = new Event("click");
        closeModalButtons[0].dispatchEvent(event);
      }
    });
     
    window.addEventListener("click", function (e) {
      // 모달 내용이 아닌 부분 확인
      if (e.target === modal && !modalContent.contains(e.target)) {
        modal.style.display = "none";
        if (headerTbl) {
          headerTbl.style.display = "block";
        }
      }
    });
  };