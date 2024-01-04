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
    const genericErrorText = `Couldn't upload file: ${file.name}.`;

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
        reject("An error occurred while processing the file.");
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
    const start = new Date().getTime();
    var newInput = document.createElement("input");
    var targetDiv = document.getElementById("img-temporary");
    var nextInput = targetDiv.appendChild(newInput);

    nextInput.name = "saveFname";
    nextInput.id = "img-url";
    nextInput.value = fName;
    const end = new Date().getTime();
    console.log(`_updateInputField took ${end - start}ms`);
  }

  async _updateImageSource(fName, fileName) {
    const start = new Date().getTime();
    document.querySelector("figure").lastChild.src = fName;
    document.querySelector(".ck-content").click(); // 클릭 처리를 해야 인덱스 얻을수있음

  // ck-widget_selected 클래스를 가진 첫 번째 요소 찾기
//  const selectedFigure = document.querySelector(".ck-content .ck-widget_selected");

  // 해당 요소가 있으면 ck-widget_selected 클래스 제거
//  if (selectedFigure) {
//	console.log('진입')
//	selectedFigure.classList.remove("ck-widget_selected");
//	// 클래스 제거 확인을 위한 로그
//	if (selectedFigure.classList.contains("ck-widget_selected")) {
//	  console.log("Class 'ck-widget_selected' was not removed successfully.");
//	} else {
//	  console.log("Class 'ck-widget_selected' has been successfully removed.");
//	}
//  }






    console.log(`File ${fileName} displayed in the content.`);
    const end = new Date().getTime();
    console.log(`_updateImageSource took ${end - start}ms`);
  }
}

function MyCustomUploadAdapterPlugin(editor) {
  editor.plugins.get("FileRepository").createUploadAdapter = (loader) => {
    return new MyUploadAdapter(loader);
  };
}

async function uploadFilesConcurrently(editor, files) {
  const uploadPromises = [];

  for (const file of files) {
    console.log(`Starting upload for ${file.name} at ${new Date().toLocaleTimeString()}`);
    const loader = editor.plugins.get("FileRepository").createLoader(file);

    if (loader) {
      const uploadPromise = loader.file.then((file) => {
        return new Promise((resolve, reject) => {
          const myUploadAdapter = new MyUploadAdapter(loader);
          myUploadAdapter.upload().then(resolve).catch(reject);
        });
      });
      uploadPromises.push(uploadPromise);
    }
  }

  await Promise.all(uploadPromises);
  console.log("All files have been uploaded concurrently");
}

ClassicEditor.create(document.querySelector("#classicNR"), {
  extraPlugins: [MyCustomUploadAdapterPlugin],
})
  .then((editor) => {
    window.editor = editor;
    const files = document.querySelector('input[type="file"]').files;
    uploadFilesConcurrently(editor, files).then(() => {
      console.log("All files have been processed concurrently");
    });
  })
  .catch((error) => {
    console.error("Error occurred:", error);
  });

