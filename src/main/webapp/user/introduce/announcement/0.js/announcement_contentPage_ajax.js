  $(document).ready(function () {
	
	let modal = document.querySelector("#myModal");
	let closeModalButtons = document.querySelectorAll(".qd-content-box-td2-2-button");
    let headerTbl = document.querySelector(".header-tbl");
	
    //모달 조회
    $(".ancTitleDiv").on("click", function () {
      let aidx = $(this).data("anseq");

      $.ajax({
        type: "post",
        url: "/halo/Announced_C",
        data: { an_seq: aidx },
        success: function (result) {
          let dataArr = result.split("|");
          let writer = dataArr[0];
          let title = dataArr[1];
          let content = dataArr[2];
          let regdate = dataArr[3];

          $("#modalWriter").text(writer);
          $("#modalTitle").text(title);
          $("#modalContent").html(content);
          $("#modalregDate").text(regdate);

          //DB조회 -> 화면 그려주고 -> 모달 노출 및 헤더 가리기 
          modal.style.display = "flex";
          $(".header-tbl").hide();
        },
        error: function () {
          alert("error!!!");
        },
      });
    });

    //모달 닫기
    $("#closeModalBtn").on("click", function () {
      modal.style.display = "none";
      $(".header-tbl").show();
    });
  });