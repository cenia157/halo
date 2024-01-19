let updateFileOrder = [];

class MyUploadAdapter {
	
	constructor(loader) {
	    this.loader = loader;
	    this.uploadPromise = null;
	
	    this.loader.file.then(file => {
	        updateFileOrder.push({id: this.loader.id, file: file});
	
//	        console.log('파일 업로드 중:', file.name);
//	        console.log(`파일 업로드 중: ${file.name}, 파일 크기: ${file.size}`);
//	        console.log('현재 파일 순서:', updateFileOrder.map(item => item.file.name));
	    });
	}

	upload() {
	    return this.loader.file.then(
	        (file) => new Promise((resolve, reject) => {
	            const uploadSequentially = () => {
	                // updateFileOrder 배열이 비어있으면 함수 실행을 중단합니다.
	                if (updateFileOrder.length === 0) {
	                    console.log('업로드할 파일이 더 이상 없습니다.');
	                    return;
	                }
	
	                // updateFileOrder 배열에서 현재 파일의 위치를 찾습니다.
	                const index = updateFileOrder.findIndex(item => item.file === file);
	
	                if (index === 0) { // 이 파일이 첫 번째로 업로드 해야 할 파일이면
	                    console.log('파일 업로드 중:', file.name);
	                    this._initRequest();
	                    this._initListeners(resolve, reject, file);
	                    this._sendRequest(file).then(() => {
	                        // 업로드를 시작한 후, updateFileOrder에서 해당 파일을 제거합니다.
	                        updateFileOrder.shift();
	                        console.log('대기열에서 제거된 파일:', file.name); 
	                        console.log('현재 파일 순서:', updateFileOrder.map(item => item.file.name)); 
	
	                        // 다음 파일이 있으면 그 파일도 업로드합니다.
	                        if (updateFileOrder.length > 0) {
	                            uploadSequentially();
	                        }
	                    });
	                } else {    
	                    setTimeout(uploadSequentially, 100); 
	                }
	            };
	
	            uploadSequentially();
	        })
	    );
	}

	abort() {
		if (this.xhr) {
			this.xhr.abort();
		}
	}

	_initRequest() {
		const xhr = (this.xhr = new XMLHttpRequest());
		xhr.open("POST", "/halo/CKEditorAjax", true);
		xhr.responseType = "json";
	}

	_initListeners(resolve, reject, file) {
		const xhr = this.xhr;
		const genericErrorText = `파일 업로드에 실패했습니다: ${file.name}.`;

		xhr.addEventListener("error", () => reject(genericErrorText));
		xhr.addEventListener("abort", () => reject());
		xhr.addEventListener("load", () => {
			const response = xhr.response;

			if (!response || response.error) {
				return reject(
					response && response.error ? response.error.message : genericErrorText
				);
			}

			this._updateInputField(response.fName);
			document.querySelector(".ck-content").click();

			resolve({ default: response.url });
		});

		if (xhr.upload) {
			xhr.upload.addEventListener("progress", (evt) => {
				if (evt.lengthComputable) {
					this.loader.uploadTotal = evt.total;
					this.loader.uploaded = evt.loaded;
				}
			});
		}
	}
	
//   원래 코드(안정화 테스트후 삭제하겠음)
//	_sendRequest(file) {
//		const data = new FormData();
//		data.append("upload", file);
//		this.xhr.send(data);
//		
//		// 파일 정보 로그 출력
//  	    console.log("Appending file:", file.name, "Size:", file.size, "bytes");
//	}

	// Promise를 반환하도록 수정 -> "TypeError: Cannot read properties of undefined (reading 'then')" 오류가 발생 방지
	_sendRequest(file) {
	    return new Promise((resolve, reject) => {
	        // XMLHttpRequest 객체를 초기화합니다.
	        const xhr = this.xhr = new XMLHttpRequest();
	        xhr.open("POST", "/halo/CKEditorAjax", true);
	        xhr.responseType = "json";
	
	        xhr.addEventListener("error", () => reject(`파일 업로드에 실패했습니다: ${file.name}.`));
	        xhr.addEventListener("abort", () => reject('파일 업로드가 중단되었습니다.'));
	
	        // 파일 업로드가 성공 시 resolve를 호출.
	        xhr.addEventListener("load", () => {
	            const response = xhr.response;
	            if (!response || response.error) {
	                reject(response && response.error ? response.error.message : `파일 업로드에 실패했습니다: ${file.name}.`);
	            } else {
	                this._updateInputField(response.fName);
	                document.querySelector(".ck-content").click();
//					document.querySelectorAll(".ck-content")[1]?.click();
	                resolve({ default: response.url });
	            }
	        });
	
	        // 업로드 진행 상황을 추적.
	        if (xhr.upload) {
	            xhr.upload.addEventListener("progress", (evt) => {
	                if (evt.lengthComputable) {
	                    this.loader.uploadTotal = evt.total;
	                    this.loader.uploaded = evt.loaded;
	                }
	            });
	        }
	
	        // FormData 객체를 생성하고 파일 데이터를 추가.
	        const data = new FormData();
	        data.append("upload", file);
	
	        // 서버로 요청을 보냅니다.
	        xhr.send(data);
	        
	        // 파일 정보 로그 출력
	        console.log("Sending file:", file.name, "Size:", file.size, "bytes");
	    });
	}

	_updateInputField(fName) {
		const newInput = document.createElement("input");
		newInput.name = "saveFname";
		newInput.id = "img-url";
		newInput.value = fName;
		newInput.dataset.check = fName;

		const targetDiv = document.getElementById("img-temporaryR")
		//#ck-formR추가함 
		const figures = document.querySelectorAll("#ck-formR .ck-content figure");


		let matchedFigureIndex = -1; // 삽입할 figure의 인덱스를 저장할 변수

		// 모든 figure 태그를 순회하며 적절한 위치 찾기
		for (let i = 0; i < figures.length; i++) {
			const imgTag = figures[i].querySelector("img");
			if (imgTag && !imgTag.dataset.check) {
				// dataset.check가 설정되지 않은 첫 번째 img를 찾으면 삽입 위치로 설정
				imgTag.dataset.check = fName;
				matchedFigureIndex = i;
				console.log(`figure 인덱스 ${i}에 dataset.check 설정됨:`, fName);
				break;
			}
		}

		// 삽입할 위치가 결정된 경우
		if (matchedFigureIndex !== -1) {
			const inputs = targetDiv.querySelectorAll("input");
			if (matchedFigureIndex < inputs.length) {
				targetDiv.insertBefore(newInput, inputs[matchedFigureIndex]);
			} else {
				targetDiv.appendChild(newInput);
			}
		} else {
			console.error("적절한 삽입 위치를 찾을 수 없어서 데이터셋을 설정 못 함!");
		}
	}
} // end class

function MyCustomUploadAdapterPlugin(editor) {
	editor.plugins.get("FileRepository").createUploadAdapter = (loader) => {
		return new MyUploadAdapter(loader);
	};
}

ClassicEditor.create(document.querySelector("#classicR"), {
	extraPlugins: [MyCustomUploadAdapterPlugin],
})
	.then((editor) => {
		window.editorR = editor;
	})
	.catch((error) => {
		console.log(error);
	});
	
	
	
	
	
	
	
	
	
	
	
	
  $(document).ready(function () {
                     
	// 표기능, 외부 주소 첨부기능 비활성화
    $(".ck-button[data-cke-tooltip-text='画像挿入']").remove();
	
    // 다른 js파일에서 모달창에서 파일업로드 후 미리 클릭이벤트를 줬음(인덱스번호값을 위해서)  
    $(".ck-content").on("click", function (e) {
    	
    	let figures = $(".ck-content figure img");
    	let saveFnames = $("input[name='saveFname']");

   	    figures.each(function (index) {
          $(this).data("index", index);
     	});

       saveFnames.each(function (index) {
       $(this).data("index", index);
       });
    });

   // 이미지 다중 업로드 후 인덱스값 맞게 삭제(백스테이스 delte키) 
    $(".ck-content").on("keyup", function (e) {
      if (e.key === "Backspace" || e.key === "Delete") {

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
            alert("삭제된 이미지 인덱스값: " + inputIndex);
          }
        });
        // **삭제후 인덱스 다시 구하는코드 **
        let figures = $(".ck-content figure img");
    	let saveFnames = $("input[name='saveFname']");

   	    figures.each(function (index) {
          $(this).data("index", index);
     	});

       saveFnames.each(function (index) {
       $(this).data("index", index);
       });
      } // if
    }); // $('.ck-content').on('keyup', function(e){

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

  }); // $(document).ready(function(){

	


	
	
	
	
	
	
	
	
	
	
	
	
	
