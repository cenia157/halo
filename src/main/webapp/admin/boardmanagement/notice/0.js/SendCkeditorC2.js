//나중에지우기
let regBtnR = document.querySelector("#reg-btnR");
regBtnR.addEventListener("click", function(event) {
	let ckFormR = document.querySelector("#ck-formR");
	let seq = document.querySelector('#seq').value;
	let pageNum = document.querySelector('#pageNum');
	var checkVal = document.getElementsByName('checkVal')[0];
	const content = window.editorR.getData();
	const formDataR = new FormData(ckFormR);
	formDataR.set("txt", content);
	formDataR.set("seq", seq);
	console.log("--------------------");
	console.log(content);
	console.log(formDataR);
	const payload = new URLSearchParams(formDataR);
	console.log(payload);
	for (var pair of formDataR.entries()) {
		console.log(pair[0] + ": " + pair[1]);
	}

	var isTitleValid = false;
	var isTxtValid = false;
	var iskategorieValid = false;

	for (var pair of formDataR.entries()) {

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
	let CkeditorC123 = fetch("NoticeDeleteC", {
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
			console.log("POST 요청 성공:", data);
			console.log(CkeditorC123);
			location.href ='NoticePagingC?p='+pageNum.value+'&seq='+seq+"&checkVal="+checkVal.value;
		})
		.catch((error) => {
			console.error("POST 요청 실패:", error);
		});
}); // regBtn.addEventListener("click", function(event) {

















console.log('-----------------오단영 예외처리 시작------------------------- ')


//-------------------------------------------------- $(document).ready시작--------------------------------------------------
$(document).ready(function() {

	// 표기능, 외부 주소 첨부기능 비활성화
	$(".ck-button[data-cke-tooltip-text='画像挿入']").remove();

	// 다른 js파일에서 모달창에서 파일업로드 후 미리 클릭이벤트를 줬음(인덱스번호값을 위해서)  
	$(".ck-content").on("click", function(e) {

		let figures = $(".ck-content figure img");
		let saveFnames = $("input[name='saveFname']");

		figures.each(function(index) {
			$(this).data("index", index);
		});

		saveFnames.each(function(index) {
			$(this).data("index", index);
		});
	});

	// 이미지 다중 업로드 후 인덱스값 맞게 삭제(백스테이스 delte키) 
	$(".ck-content").on("keyup", function(e) {
		if (e.key === "Backspace" || e.key === "Delete") {

			// saveFname 입력 필드를 순회
			$("input[name='saveFname']").each(function() {
				let inputIndex = $(this).data("index");

				// 해당 인덱스를 가진 figure 이미지가 존재 확인.
				let correspondingFigure = $(".ck-content figure img").filter(
					function() {
						return $(this).data("index") === inputIndex;
					}
				);

				// 대응하는 figure 이미지가 없으면, 해당 입력 필드를 제거합니다.
				if (!correspondingFigure.length) {
					$(this).remove();
					alert("삭제된 이미지 인덱스값: " + inputIndex);
				}
			});
			// **삭제후 인덱스 다시 구하는코드 **
			let figures = $(".ck-content figure img");
			let saveFnames = $("input[name='saveFname']");

			figures.each(function(index) {
				$(this).data("index", index);
			});

			saveFnames.each(function(index) {
				$(this).data("index", index);
			});
		} // if
	}); // $('.ck-content').on('keyup', function(e){

	// 이미지 추가후 seleted 즉 자동으로 선택될때 방어하는 코드	
	$(".ck-content").on("keydown", function(e) {
		console.log("누른키 :::", e.key, e.code);

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
	$(".ck-content").on("dragstart", "img", function(e) {
		e.preventDefault();
	}); // $('.ck-content').on('dragstart', 'img', function(e) {

	// UI메뉴 셀렉티드 될때 방어 코드 
	$(".ck-content").on("click keydown", function(e) {
		let isSelectedFigureExists =
			$(".ck-content figure.ck-widget_selected").length > 0;

		let buttonsToDisable = [
			"区切り",
			"表の挿入",
			"リンク (Ctrl+K)",
			"画像挿入",
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

	//      $(".ck-content").on("click keydown", function (e) {
	//      let isSelectedFigureExists =
	//          $(".ck-content figure.ck-widget_selected").length > 0;

	//      if (isSelectedFigureExists) {
	//          // 엔터 키 예외 조건 확인
	//          if (e.type === "keydown" && e.key === "Enter") {
	//              console.log('예외 조건 - 엔터 키 이벤트에서 "isSelectedFigureExists" 상태입니다.');
	//              $(".ck-button[data-cke-tooltip-text='区切り']").removeClass("ck-disabled");
	//              $(".ck-button[data-cke-tooltip-text='区切り']").prop("disabled", false);
	//          } else {
	//              console.log('반대 조건 - 클릭 또는 키 다운 이벤트에서 "isSelectedFigureExists" 상태입니다.');
	//              $(".ck-button[data-cke-tooltip-text='区切り']").addClass("ck-disabled");
	//              $(".ck-button[data-cke-tooltip-text='区切り']").prop("disabled", true);
	//          }
	//      } else {
	//          console.log('클릭 또는 키 다운 이벤트에서 "isSelectedFigureExists" 상태가 아닙니다.');
	//          $(".ck-button[data-cke-tooltip-text='区切り']").removeClass("ck-disabled");
	//          $(".ck-button[data-cke-tooltip-text='区切り']").prop("disabled", false);
	//      }
	//  });

}); // $(document).ready(function(){