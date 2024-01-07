<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>noticeEditPage</title>

    <link
      rel="stylesheet"
      href="admin/boardmanagement/notice/0.css/notice.css"
    />
    <link
      href="https://db.onlinewebfonts.com/c/18039781048bd528f6304c029f5d0f99?family=SF+Pro+JP+Regular"
      rel="stylesheet"
    />
  </head>

  <body>
    <div onclick="closeModalNR()" id="myModalNR" class="modal-background"></div>
    <form id="ck-form" method="post">
      <div id="myModal-tblNR" class="modal-tbl">
        <div class="modal-title-set">
          <div class="modal-title-tr">
            <div class="modal-title-td-1">
              <div class="real-title">
                <input
                  class="real-title-editor"
                  name="title"
                  id="real-title-editor"
                  placeholder="이곳에 제목을 입력하세요"
                />
                <!-- 아래의 input은 ajax로 올라갔던 이미지의 실제 이름을 받기 위한 역할을 한다.
							type="hidden"을 삭제하고 이미지를 올려놓으면 올린 이미지의 경로+이름이 나온다. -->

                <div id="img-temporary"></div>

                <div class="real-title-select">
                  <div class="toggle" id="toggle" onclick="toggle()">
                    <div class="kategorie" id="kategorie">카테고리</div>
                    <div class="toggle-down" id="toggle-down">
                      <div class="toggle-down-block">
                        <div class="toggle-item" id="aaaa">
                          <input
                            name="announcementA"
                            type="hidden"
                            id="myInput"
                            value="announcement"
                          />
                          안내
                        </div>
                        <div class="toggle-item" id="일정">
                          <input
                            name="scheduleA"
                            type="hidden"
                            id="myInput"
                            value="schedule"
                          />
                          일정
                        </div>
                        <div class="toggle-item" id="일반">
                          <input
                            name="generalA"
                            type="hidden"
                            id="myInput"
                            value="general"
                          />
                          일반
                        </div>
                        <div class="toggle-item" id="서비스">
                          <input
                            name="serviceA"
                            type="hidden"
                            id="myInput"
                            value="service"
                          />
                          서비스
                        </div>
                        <div class="toggle-item" id="상품">
                          <input
                            name="productA"
                            type="hidden"
                            id="myInput"
                            value="product"
                          />
                          상품
                        </div>
                      </div>
                    </div>
                  </div>
                  <script src="admin/boardmanagement/notice_test/0.js/noticeToggle.js"></script>
                  <!--  -->
                </div>
              </div>
            </div>
            <div class="modal-title-td-2">
              <span
                style="width: 100%"
                class="close"
                id="closeModalBtn"
                onclick="closeModalNR()"
                >&times;</span
              >
            </div>
          </div>
          <div class="modal-content">
            <div class="modal-content-txt">
              <!-- 아래의 코드는 CK Editor를 넣는 부분이다-->
              <textarea name="txt" id="classicNR" class="classicNR"></textarea>
            </div>
            <div class="modal-content-button">
              <button
                class="SubmitButton"
                type="button"
                id="reg-btn"
                onclick="noValue()"
              >
                등aaa록완료
              </button>
              <!-- 여기는 필수 입력값을 안넣었을 때 거부하는 부분이다 (아직 미완성, 마지막에 할 예정)-->
              <!-- <script
							src="admin/boardmanagement/notice_test/0.js/ValidationItems.js"></script> -->
            </div>
          </div>
        </div>
      </div>
    </form>

    <!-- 아래의 스크립트는 CKEditor에 올라온 이미지를 ajax로 올리는 역힐이다-->
    <script
      type="module"
      src="admin/boardmanagement/notice_test/0.js/testMZ.js"
    ></script>
    <!-- 여기는 CKEditor에 들어간 값을 서버로 보내는 역할 + 오단영 각종 이미지 예외처리 메소드 -->
    <script type="text/javascript">
      let regBtn = document.querySelector("#reg-btn");
      regBtn.addEventListener("click", function (event) {
        let ckForm = document.querySelector("#ck-form");
        const content = window.editor.getData();
        const formData = new FormData(ckForm);
        formData.set("txt", content);
        console.log("--------------------");
        console.log("컨텐츠요"+content);
        console.log("폼데이터요"+formData);
        const payload = new URLSearchParams(formData);
        console.log(payload);
        for (var pair of formData.entries()) {
          console.log(pair[0] + ": " + pair[1]);
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
	   
	  let updateCount = 0;
      let updateFlag = false;
	   
      // 이미지 삭제용 인덱스를 업데이트하는 함수
      function delete_indexes() {
        let figures = $(".ck-content figure img");
        let saveFnames = $("input[name='saveFname']");

        figures.each(function (index) {
          $(this).data("index", index);
        });

        saveFnames.each(function (index) {
          $(this).data("index", index);
        });
      } // function delete_Indexes() {
    	  
//       function update_indexes() {
//      	  $(".ck-content figure img").each(function (index) {
     	    
//      	   if(updateFlag == 'true' && updateCount == 0) {
//      		  $(this).attr("original_index", index);
//      	   } 
//      	   $(this).attr("update_idx", index);
//    		  });

//    	       $("input[name='saveFname']").each(function (index) {
//    	    	if(updateFlag == 'true' && updateCount == 0) {
//        		  $(this).attr("original_index", index);
//        	   }
//    		    $(this).attr("update_idx", index);
//    		  }); 
   	      
   		
//    	    console.log('update_indexes 함수 호출 횟수 ::: ' + updateCount);
// 	    console.log('update_indexes 함수 호출 횟수 ::: ' + updateFlag);
//       }

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
      $(document).ready(function () {
                         
    	  
    	// 표기능 비활성화
        $(".ck-button[data-cke-tooltip-text='表の挿入']").remove();
   		// 링크 기능 비활성화画像挿入
        $(".ck-button[data-cke-tooltip-text='リンク (Ctrl+K)']").remove();
   		// 이미지 주소 첨부 비활성화
   		$(".ck-button[data-cke-tooltip-text='画像挿入").remove();

        // 다른 js파일에서 모달창에서 파일업로드 후 미리 클릭이벤트를 줬음(인덱스번호값을 위해서)  
        $(".ck-content").on("click", function (e) {
        	delete_indexes();
//         	update_indexes();
        });

       // 이미지 다중 업로드 후 인덱스값 맞게 삭제(백스테이스 delte키) 
        $(".ck-content").on("keyup", function (e) {
          if (e.key === "Backspace" || e.key === "Delete") {
            console.log(e.key);

            // saveFname 입력 필드를 순회
            $("input[name='saveFname']").each(function () {
              let inputIndex = $(this).data("index");

              // 해당 인덱스를 가진 figure 이미지가 존재 확인.
              let correspondingFigure = $(".ck-content figure img").filter(
                function () {
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
            delete_indexes();
          } // if
        }); // $('.ck-content').on('keyup', function(e){

        // 이미지 추가후 seleted 즉 자동으로 선택될때 방어하는 코드	
        $(".ck-content").on("keydown", function (e) {
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
        $(".ck-content").on("dragstart", "img", function (e) {
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

        //                   else if(beforeImgIdx >= 0 && ($(".ck-content figure").length == $("input[name='saveFname']").length)) {
        //                     imgIdx = beforeImgIdx - 1;
        //                     $('input[name="saveFname"]').eq(imgIdx).remove();
        //                     imgIdx = undefined;
        //                     e.preventDefault();
        //                 }

        //             }
        //         }
        //     });
      }); // $(document).ready(function(){
    </script>
  </body>
</html>
