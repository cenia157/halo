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
    const loader = this.loader;
    const genericErrorText = `Couldn't upload file: ${file.name}.`;

    xhr.addEventListener("error", () => reject(genericErrorText));
    xhr.addEventListener("abort", () => reject());
    xhr.addEventListener("load", () => {
      const response = xhr.response;

      if (!response || response.error) {
        console.log(
          `File ${
            file.name
          } failed to upload at ${new Date().toLocaleTimeString()}`
        );
        return reject(
          response && response.error ? response.error.message : genericErrorText
        );
      }

      resolve({ default: response.url });
      console.log(
        `File ${
          file.name
        } uploaded successfully at ${new Date().toLocaleTimeString()}`
      );

      var newInput = document.createElement("input");
      var targetDiv = document.getElementById("img-temporary");
      var nextInput = targetDiv.appendChild(newInput);

      nextInput.name = "saveFname";
      nextInput.id = "img-url";
      nextInput.value = response.fName;

      document.querySelector("figure").lastChild.src = response.fName;
 	  document.querySelector('.ck-content').click();
      console.log(`File ${file.name} displayed in the content.`);
    });

    if (xhr.upload) {
      xhr.upload.addEventListener("progress", (evt) => {
        if (evt.lengthComputable) {
          loader.uploadTotal = evt.total;
          loader.uploaded = evt.loaded;
        }
      });
    }
  }

  _sendRequest(file) {
    const data = new FormData();
    data.append("upload", file);
    this.xhr.send(data);
  }
}

function MyCustomUploadAdapterPlugin(editor) {
  editor.plugins.get("FileRepository").createUploadAdapter = (loader) => {
    return new MyUploadAdapter(loader);
  };
}

async function uploadFilesSequentially(editor, files) {
  for (const file of files) {
    console.log(
      `Starting upload for ${file.name} at ${new Date().toLocaleTimeString()}`
    );
    const loader = editor.plugins.get("FileRepository").createLoader(file);
    if (loader) {
      await loader.file.then((file) => {
        return new Promise((resolve, reject) => {
          const myUploadAdapter = new MyUploadAdapter(loader);
          myUploadAdapter.upload().then(resolve).catch(reject);
        });
      });
    }
  }
  console.log("All files have been uploaded sequentially");
}

ClassicEditor.create(document.querySelector("#classicNR"), {
  extraPlugins: [MyCustomUploadAdapterPlugin],
})
  .then((editor) => {
    window.editor = editor;
    const files = document.querySelector('input[type="file"]').files;
    uploadFilesSequentially(editor, files).then(() => {
      console.log("All files have been processed");
    });
  })
  .catch((error) => {
    console.error("Error occurred:", error);
  });
