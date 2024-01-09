class MyUploadAdapter {
	constructor(loader) {
		this.loader = loader;
		this.uploadPromise = null;
	}

	upload() {
		return this.loader.file.then(
			(file) =>
				new Promise((resolve, reject) => {
					this._initRequest();
					this._initListeners(resolve, reject, file);
					this._sendRequest(file);
				})
		);
	}

	//  upload() {
	//	// 이미 업로드 작업이 진행 중인지 확인하고, 업로드 작업이 이미 진행 중이지 않을 때에만 "_performUpload()" 함수를 호출
	//    if (!this.uploadPromise) {
	//      this.uploadPromise = this._performUpload();
	//    }
	//    return this.uploadPromise;
	//  }

	abort() {
		if (this.xhr) {
			this.xhr.abort();
		}
	}

	//  // 비동기에서 동기처리 효과를 낼수있는 코드 추가 
	//  async _performUpload() {
	//	//  Promise는 비동기 작업의 결과 또는 실패를 기다리고 결과를 처리하는 데 사용
	//    return new Promise(async (resolve, reject) => {
	//      const file = await this.loader.file;
	//
	//      this._initRequest();
	//      this._initListeners(resolve, reject, file);
	//      this._sendRequest(file);
	//    });
	//  }

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

	_sendRequest(file) {
		const data = new FormData();
		data.append("upload", file);
		this.xhr.send(data);
	}

	_updateInputField(fName) {
		const newInput = document.createElement("input");
		newInput.name = "saveFname";
		newInput.id = "img-url";
		newInput.value = fName;
		newInput.dataset.check = fName;

		const targetDiv = document.getElementById("img-temporary");
		const figures = document.querySelectorAll(".ck-content figure");

		console.log("ck-content 클래스 내 figure 태그 수:", figures.length);

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

	// _updateImageSource(fName, fileName) {
	//     document.querySelector(".ck-content").click();
	// }
} // end class

function MyCustomUploadAdapterPlugin(editor) {
	editor.plugins.get("FileRepository").createUploadAdapter = (loader) => {
		return new MyUploadAdapter(loader);
	};
}




ClassicEditor.create(document.querySelector("#classicNR"), {
	extraPlugins: [MyCustomUploadAdapterPlugin],
})
	.then((editor) => {
		window.editor = editor;
	})
	.catch((error) => {
		console.log(error);
	});


ClassicEditor.create(document.querySelector("#classicR"), {
	extraPlugins: [MyCustomUploadAdapterPlugin],
})
	.then((editor) => {
		window.editor = editor;
	})
	.catch((error) => {
		console.log(error);
	});
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
