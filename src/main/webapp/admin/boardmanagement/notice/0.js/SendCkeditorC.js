let regBtn = document.querySelector("#reg-btn");
regBtn.addEventListener("click", function(event) {
	if(!noValue()){
		return false;
	}
	
	let ckForm = document.querySelector("#ck-form");
	let writer = document.querySelector("#regBtnHiddenInput").value;
	const content = window.editor.getData();
	const formData = new FormData(ckForm);
	formData.set("txt", content);
	formData.set("writer", writer)
	console.log("--------------------");
	console.log(content);
	console.log(formData);
	const payload = new URLSearchParams(formData); 
	console.log("payload확인용"+payload);
	for (var pair of formData.entries()) {
		console.log(pair[0] + ": " + pair[1]);
	}

	var isTitleValid = false;
	var isTxtValid = false;
	var iskategorieValid = false;

	for (var pair of formData.entries()) {

		if (pair[0] === 'title') {
			if (pair[1] !== '') {
				console.log('제목 O')
				isTitleValid = true;
			} else {
				console.log('제목 X')
			}
		} else if (pair[0] === 'txt') {
			if (pair[1] !== '') {
				console.log('내용 O');
				isTxtValid = true;
			} else {
				console.log('내용 X');
			}
		}
		if (pair[0] === 'select') {
			console.log('카테고리 O');
			var iskategorieValid = true;
		}
	}
	// 여기서 제목, 카테고리, 내용입력 둘다 만족할 경우 모달창이 닫히도록 함
	if (isTitleValid && isTxtValid && iskategorieValid) {
		closeModalNR();
	}

	console.log("--------------------");
	let CkeditorC123 = fetch("CkeditorC", {
		method: "POST",
		body: payload,
		headers: {
			"Content-Type": "application/x-www-form-urlencoded", // 헤더 설정
		},
	})
		.then((response) => {
			if (!response.ok) {
				throw new Error("Network response was not ok");
			}
			return response.text();
		})
		.then((data) => {
			console.log("POST 요청 성공: 이거맞음?????", data);
			ckForm.submit();
			console.log(CkeditorC123);
		})
		.catch((error) => {
			console.error("POST 요청 실패:", error);
		});
}); // regBtn.addEventListener("click", function(event) {


	      
    	
  $(document).ready(function () {
                     
	// 표기능, 외부 주소 첨부기능 비활성화
    $(".ck-button[data-cke-tooltip-text='画像挿入']").remove();
	$(".ck-button[data-cke-tooltip-text='メディアの挿入']").remove();
	$(".ck-button[data-cke-tooltip-text='表の挿入']").remove();
		
	 $(".ck-content").on("click", function (e) {
		console.log('클릭 이벤트 발생')
	    let figures = $(".ck-content figure img");
	    let saveFnames = $("input[name='saveFname']");

		if ($("#myModal-tblR").css("display") !== "none") {
			console.log('신규 등록 모달창 -> none');
			console.log('업데이트  모달창 -> flex');
			figures = $("#ck-formR .ck-content figure img")					
		} else {
			console.log('신규 등록 모달창 -> flex');
			console.log('업데이트  모달창 -> none');
	  		figures = $("#ck-form .ck-content figure img")
	 	}
	
	     console.log("figures의 갯수:", figures.length);
	     console.log("saveFnames의 갯수:", saveFnames.length);
	
	     figures.each(function (index) {
	         $(this).attr("index", index); 
	     });
	
	     saveFnames.each(function (index) {
	         $(this).attr("index", index); 
	     });
	 });

    // 이미지 다중 업로드 후 인덱스값 맞게 삭제(백스테이스 delte키) 
	 $(".ck-content").on("keyup", function (e) {
	  if (e.key === "Backspace" || e.key === "Delete") {
	    $("input[name='saveFname']").each(function () {
	      let inputIndex = $(this).attr("index"); // 클릭 이벤트로 할당된 인덱스 사용
	      let correspondingFigure = $(".ck-content figure img").filter(function () {
	        return $(this).attr("index") === inputIndex;
	      });
	
	      if (!correspondingFigure.length) {
	        $(this).remove();
	        alert("삭제된 이미지 인덱스값: " + inputIndex);
	      }
	    });
	    
	    // 인덱스를 재할당
	    $(".ck-content").click();
	  }
	});
	
    // 이미지 추가후 seleted 즉 자동으로 선택될때 방어하는 코드	
    $(".ck-content").on("keydown", function (e) {
      console.log("누른키 :::test", e.key, e.code);

      let whiteList = [
        "Enter", "Delete", "Backspace", "ArrowUp", "ArrowDown"];

      let allowedKey = whiteList.includes(e.code); // 허용된 키인지 확인

      let isSelectedFigureExists =
        $(".ck-content figure.ck-widget_selected").length > 0;
      let isBeforeCaretExists =
        $(".ck-content figure.ck-widget_type-around_show-fake-caret_before")
          .length > 0;
      let isAfterCaretExists =
        $(".ck-content figure.ck-widget_type-around_show-fake-caret_after")
          .length > 0;

      if (
        !whiteList.includes(e.code) &&
        isSelectedFigureExists &&
        !isBeforeCaretExists &&
        !isAfterCaretExists
      ) {
        // 허용되지 않은 키이면
        console.log("not allowed");
        e.preventDefault(); // 입력 방지
        this.blur(); // 입력 필드에서 포커스 제거
      } // if
    }); // $('.ck-content').on("keydown", function(e) {

    // 이미지 드래그스타트 방지 
    $(".ck-content").on("dragstart", "img", function (e) {
      e.preventDefault(); 
    }); // $('.ck-content').on('dragstart', 'img', function(e) {

    // UI메뉴 셀렉티드 될때 방어 코드 
    $(".ck-content").on("click keydown", function (e) {
        let isSelectedFigureExists =
            $(".ck-content figure.ck-widget_selected").length > 0;

        let buttonsToDisable = [
            "区切り",
            "リンク (Ctrl+K)",
            "パソコンから画像を置換",
            "パソコンから画像をアップロード"
        ];

        buttonsToDisable.forEach(buttonText => {
            let $button = $(".ck-button[data-cke-tooltip-text='" + buttonText + "']");
            if (isSelectedFigureExists && !(e.type === "keydown" && e.key === "Enter")) {
                $button.addClass("ck-disabled");
                $button.prop("disabled", true);
            } else {
                $button.removeClass("ck-disabled");
                $button.prop("disabled", false);
            }
        });
    }); //(".ck-content").on("click keydown", function (e) {

  }); // $(document).ready(function(){