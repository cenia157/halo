class MyUploadAdapter {
  constructor(loader) {
    this.loader = loader;
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
    xhr.addEventListener("load", async () => {
      const response = xhr.response;

      if (!response || response.error) {
        return reject(
          response && response.error ? response.error.message : genericErrorText
        );
      }

      try {
        await this._updateInputField(response.fName);
        await this._updateImageSource(response.fName, file.name);
      } catch (error) {
        console.error(error);
        reject("파일 처리 중 오류가 발생했습니다.");
      }

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

  async _updateInputField(fName) {
    // 기존
    return new Promise((resolve, reject) => {
      const newInput = document.createElement("input");
      const targetDiv = document.getElementById("img-temporary");

      newInput.name = "saveFname";
      newInput.id = "img-url";
      newInput.value = fName;

      targetDiv.appendChild(newInput); // 입력 필드를 DOM에 추가합니다.
      console.log(`${fName}에 대한 입력 필드가 추가되었습니다.`);
      resolve(); // 작업이 완료되면 Promise를 해결(resolve)합니다.
    });
  }

  async _updateImageSource(fName, fileName) {
    const start = new Date().getTime();
    document.querySelector("figure").lastChild.src = fName;
    document.querySelector(".ck-content").click(); // 클릭 처리를 해야 인덱스 얻을 수 있음

    // ck-widget_selected 클래스를 가진 첫 번째 요소 찾기
    // const selectedFigure = document.querySelector(".ck-content .ck-widget_selected");

    // 해당 요소가 있으면 ck-widget_selected 클래스 제거
    // if (selectedFigure) {
    //	console.log('진입')
    //	selectedFigure.classList.remove("ck-widget_selected");
    //	// 클래스 제거 확인을 위한 로그
    //	if (selectedFigure.classList.contains("ck-widget_selected")) {
    //	  console.log("Class 'ck-widget_selected'가 성공적으로 제거되지 않았습니다.");
    //	} else {
    //	  console.log("Class 'ck-widget_selected'가 성공적으로 제거되었습니다.");
    //	}
    // }

    console.log(`${fileName} 파일이 콘텐츠에 표시되었습니다.`);
    const end = new Date().getTime();
    console.log(`_updateImageSource 실행 시간: ${end - start}ms`);
  }
} // end class

function MyCustomUploadAdapterPlugin(editor) {
  editor.plugins.get("FileRepository").createUploadAdapter = (loader) => {
    return new MyUploadAdapter(loader);
  };
}

//async function uploadFilesSequentially(editor, files) {
//  for (const file of files) {
//    console.log(
//      `${
//        file.name
//      }의 업로드가 ${new Date().toLocaleTimeString()}에 시작되었습니다.`
//    );
//
//    const loader = editor.plugins.get("FileRepository").createLoader(file);
//    if (loader) {
//      const myUploadAdapter = new MyUploadAdapter(loader);
//      try {
//        await myUploadAdapter.upload(); // 이미지 업로드 비동기 처리
//        console.log(`${file.name} 업로드가 성공적으로 완료되었습니다.`);
//        await myUploadAdapter._updateInputField(response.fName); // _updateInputField 비동기 호출
//      } catch (error) {
//        console.error(`${file.name} 업로드 중 오류가 발생했습니다:`, error);
//      }
//    }
//  }
//  console.log(
//    "모든 파일이 순차적으로 업로드되고 입력 필드가 순차적으로 업데이트되었습니다."
//  );
//}

async function uploadFilesSequentially(editor, files) {
  for (const file of files) {
    console.log(`${file.name}의 업로드가 시작되었습니다.`);

    const loader = editor.plugins.get("FileRepository").createLoader(file);
    if (loader) {
      const myUploadAdapter = new MyUploadAdapter(loader);
      try {
        // 이미지 업로드를 기다립니다.
        const response = await myUploadAdapter.upload(); // 변경: 업로드의 결과를 response로 받습니다.
        console.log(`${file.name} 업로드가 성공적으로 완료되었습니다.`);
        // 입력 필드 업데이트를 기다립니다.
        await myUploadAdapter._updateInputField(response.default); // 변경: response.fName -> response.default
      } catch (error) {
        console.error(`${file.name} 업로드 중 오류가 발생했습니다:`, error);
      }
    }
  }
  console.log("모든 파일이 순차적으로 업로드되고 입력 필드가 업데이트되었습니다.");
}

ClassicEditor.create(document.querySelector("#classicNR"), {
  extraPlugins: [MyCustomUploadAdapterPlugin],
})
  .then((editor) => {
    window.editor = editor;
    const files = document.querySelector('input[type="file"]').files;
    uploadFilesSequentially(editor, files).then(() => {
      console.log("모든 파일이 순차적으로 처리되었습니다.");
    });
  })
  .catch((error) => {
    console.error("오류 발생:", error);
  });
