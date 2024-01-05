
let regBtn = document.querySelector("#reg-btn");
regBtn.addEventListener("click", function(event) {
	let ckForm = document.querySelector("#ck-form");
	const content = window.editor.getData();
	const formData = new FormData(ckForm);
	formData.set("txt", content);
	console.log("--------------------");
	console.log(content);
	console.log(formData);
	const payload = new URLSearchParams(formData);
	console.log(payload);
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
			console.log("POST 요청 성공:", data);
			console.log(CkeditorC123);
		})
		.catch((error) => {
			console.error("POST 요청 실패:", error);
		});
}); // regBtn.addEventListener("click", function(event) {

console.log('----------------------------------------------------')
console.log('-----------------예외처리 시작------------------------- ')
console.log('----------------------------------------------------')



// 인덱스를 업데이트하는 함수
function updateIndexes() {
	let figures = $(".ck-content figure img");
	let saveFnames = $("input[name='saveFname']");

	figures.each(function(index) {
		$(this).data("index", index);
	});

	saveFnames.each(function(index) {
		$(this).data("index", index);
	});
} // function updateIndexes() {

//       function updateButtonState() {
//         let isSelectedFigureExists =
//           $(".ck-content figure.ck-widget_selected").length > 0;
//         let isBeforeCaretExists =
//           $(".ck-content figure.ck-widget_type-around_show-fake-caret_before")
//             .length > 0;
//         let isAfterCaretExists =
//           $(".ck-content figure.ck-widget_type-around_show-fake-caret_after")
//             .length > 0;

//         if (
//           isSelectedFigureExists &&
//           !isBeforeCaretExists &&
//           !isAfterCaretExists
//         ) {
//           $(".ck-button[data-cke-tooltip-text='区切り']").addClass(
//             "ck-disabled"
//           );
//           $(".ck-button[data-cke-tooltip-text='区切り']").prop(
//             "disabled",
//             true
//           ); // disabled 속성 설정
//           console.log("추가");
//         } else {
//           $(".ck-button[data-cke-tooltip-text='区切り']").removeClass(
//             "ck-disabled"
//           );
//           $(".ck-button[data-cke-tooltip-text='区切り']").prop(t
//             "disabled",
//             false
//           ); // disabled 속성 제거
//           console.log("제거");
//         }
//       } // function updateButtonState() {

//-------------------------------------------------- $(document).ready시작--------------------------------------------------
$(document).ready(function() {

	// 표기능 비활성화
	$(".ck-button[data-cke-tooltip-text='表の挿入']").remove();
	// 링크 기능 비활성화画像挿入
	$(".ck-button[data-cke-tooltip-text='リンク (Ctrl+K)']").remove();
	// 이미지 주소 첨부 비활성화
	$(".ck-button[data-cke-tooltip-text='画像挿入").remove();

	// 다른 js파일에서 모달창에서 파일업로드 후 미리 클릭이벤트를 줬음(인덱스번호값을 위해서)  
	$(".ck-content").on("click", function(e) {
		updateIndexes();
	});

	// 이미지 다중 업로드 후 인덱스값 맞게 삭제(백스테이스 delte키) 
	$(".ck-content").on("keyup", function(e) {
		if (e.key === "Backspace" || e.key === "Delete") {
			console.log(e.key);

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
					alert("Removed saveFname input at index: " + inputIndex);
				}
			});
			// **삭제후 인덱스 다시 구해야함**
			updateIndexes();
		} // if
	}); // $('.ck-content').on('keyup', function(e){

	// 이미지 추가후 seleted 즉 자동으로 선택될때 방어하는 코드	
	$(".ck-content").on("keydown", function(e) {
		console.log("누른키 :::", e.key, e.code);

		let whiteList = [
			"Enter",
			"Delete",
			"Backspace",
			"ArrowUp",
			"ArrowDown",
		];

		console.log("whiteList:", whiteList);
		let allowedKey = whiteList.includes(e.code); // 허용된 키인지 확인

		let isSelectedFigureExists =
			$(".ck-content figure.ck-widget_selected").length > 0;
		let isBeforeCaretExists =
			$(".ck-content figure.ck-widget_type-around_show-fake-caret_before")
				.length > 0;
		let isAfterCaretExists =
			$(".ck-content figure.ck-widget_type-around_show-fake-caret_after")
				.length > 0;

		console.log("isSelectedFigureExists:", isSelectedFigureExists);
		console.log("isBeforeCaretExists:", isBeforeCaretExists);
		console.log("isAfterCaretExists:", isAfterCaretExists);

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
			console.log("------------------------");
		} // if
	}); // $('.ck-content').on("keydown", function(e) {

	// 이미지 드래그 방지 
	$(".ck-content").on("dragstart", "img", function(e) {
		e.preventDefault(); // 드래그를 방지합니다.
		console.log("드래그 시도가 방지되었습니다.");
	}); // $('.ck-content').on('dragstart', 'img', function(e) {


	// 이미지 셀렉티드 될때 区切り방지 코드 
	//         $(".ck-content").on("click", function (e) {

	//               if (
	//                 isSelectedFigureExists &&
	//                 !isBeforeCaretExists &&
	//                 !isAfterCaretExists
	//               ) {
	//                 console.log("제거");
	//                 $(".ck-button[data-cke-tooltip-text='区切り']").removeClass(
	//                   "ck-disabled"
	//                 );
	//                 $(".ck-button[data-cke-tooltip-text='区切り']").prop(
	//                   "disabled",
	//                   false
	//                 );
	//               }
	//             }

	//             updateButtonState();
	//           });


	// 		 document.querySelector('.ck-content').addEventListener("compositionstart",function handleCompositionStart(e) {
	// 		 	 const self = this;
	// 			 self.blur();
	// 			 requestAnimationFrame(function () {
	// 			      self.focus();
	// 			 });
	// 		 });

	// 	        if (isSelectedFigureExists && !isBeforeCaretExists && !isAfterCaretExists && (isAllowedKey || !(isKoreanOrJapanese))) {
	// 	            if (isAllowedKey) {
	// 	                console.log(`선택된 위젯에서 허용된 키가 눌렸습니다.`);
	// 	            } else {
	// 	                e.preventDefault();
	// 	                console.log(`선택된 위젯에서 허용되지 않은 한글 또는 일본어 키가 입력되었으며, 이를 방지하였습니다.`);
	// 	            }
	// 	        } else if (isSelectedFigureExists && !isBeforeCaretExists && !isAfterCaretExists) {
	// 	            e.preventDefault();
	// 	            console.log(`선택된 위젯에서 허용되지 않은 키가 입력되었으며, 이를 방지하였습니다.`);
	// 	        } else {
	// 	            // ck-widget_selected 클래스가 없는 경우 방어
	// 	            console.log(`선택된 위젯 없이 키가 눌렸습니다.`);
	// 	        }

	//     $('.ck-content').on('keydown', function(e){

	//         let beforeImgIdx = $('.ck-content figure.ck-widget_type-around_show-fake-caret_before').index('figure')
	//         console.log('Selected beforeImgIdx :::' + beforeImgIdx);
	//         console.log('-----------------------------------------');
	//         let afterImgIdx = $('.ck-content figure.ck-widget_type-around_show-fake-caret_after').index('figure')
	//         console.log('Selected afterImgIdx :::' + afterImgIdx);
	//         console.log('-----------------------------------------');
	//         let imgIdx = $('.ck-content figure.ck-widget_selected').index('figure');
	//         console.log('Selected imgIdx ::: ' + imgIdx);
	//         console.log('-----------------------------------------');

	//         if(imgIdx >= 0 && $('figure > img').length > 0){

	//         	if(e.key == 'Backspace' || e.key == 'Delete'){

	//         	}

	//         	if(e.key == 'Backspace'){
	//             	let figure = $(".ck-content figure");
	//             	let saveFname = $("input[name='saveFname']");

	// 				$(figure).each(function(i,fi) {
	// // 				$('input[name="saveFname"]').eq(figure.length + 1).remove();
	// 				});
	// 				console.log(figure);
	// 				console.log(figure.length);
	//         	}

	// 'Delete' 키가 눌렸을 때
	//             if(e.key === 'Delete'){

	//                 // 'before' 클래스가 있을 때만 제거
	//                 if(beforeImgIdx >= 0){
	//                 	imgIdx = beforeImgIdx;
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Delete (before class)::: ' + imgIdx);
	//                     imgIdx = undefined;
	//                     e.preventDefault();

	//                 }
	//                 // 'before'도 'after'도 없을 때 제거
	//                 else if(!(afterImgIdx>=0)){
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Delete (no specific class)::: ' + imgIdx);
	//                     imgIdx = undefined;
	//                     e.preventDefault();
	//                 }
	//             }
	//             // 'Backspace' 키가 눌렸을 때
	//             if(e.key === 'Backspace'){
	//                 // 'after' 클래스가 있을 때만 제거
	//                 if(afterImgIdx >= 0){
	//                 	imgIdx = afterImgIdx;
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Backspace (after class)::: ' + imgIdx);
	//                     imgIdx = undefined;
	//                     e.preventDefault();
	//                 }
	//                 // 'before'도 'after'도 없을 때 제거
	//                 else if(!(beforeImgIdx>=0) && !(afterImgIdx>=0)){
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     console.log('Removed index with Backspace (no specific class)::: ' + imgIdx);
	//                     imgIdx = undefined;
	//                     e.preventDefault();
	//                 }

	//                 else if(beforeImgIdx >= 0 && ($(".ck-content figure").length == $("input[name='saveFname']").length)) {
	//                     imgIdx = beforeImgIdx - 1;
	//                     $('input[name="saveFname"]').eq(imgIdx).remove();
	//                     imgIdx = undefined;
	//                     e.preventDefault();
	//                 }

	//             }
	//         }
	//     });
}); // $(document).ready(function(){
