ClassicEditor
  .create(document.querySelector('#editor'), {
    toolbar: ['heading', '|', 'bold', 'italic', 'link', 'imageUpload'],
    image: {
      toolbar: ['imageTextAlternative', 'imageStyle:full', 'imageStyle:side'],
      upload: {
        // 이미지 업로드를 처리하는 함수를 지정합니다.
        // 여기에서는 간단한 예제로 alert 함수를 사용하였습니다.
        handler: function (file) {
          return new Promise((resolve, reject) => {
            // 이미지를 업로드하고, 업로드 성공 시 이미지 URL을 반환합니다.
            // 실제로는 서버에 이미지를 업로드하고 해당 이미지의 URL을 받아와야 합니다.
            uploadImageToServer(file)
              .then((imageUrl) => {
                resolve({ default: imageUrl });
              })
              .catch((error) => {
                reject(error);
              });
          });
        },
        // 이미지 업로드에 성공한 경우 발생하는 이벤트입니다.
        // 여기에서는 간단한 예제로 alert 함수를 사용하였습니다.
        onUploadDone: function (info) {
          console.log('Upload completed! Info:', info);
        },
        // 이미지 업로드에 실패한 경우 발생하는 이벤트입니다.
        // 여기에서는 간단한 예제로 alert 함수를 사용하였습니다.
        onUploadFailed: function (info) {
          console.log('Upload failed. Info:', info);
        }
      }
    }
  })
  .catch(error => {
    console.error(error);
  });

// 실제로는 서버에 이미지를 업로드하는 함수를 구현해야 합니다.
function uploadImageToServer(file) {
  return new Promise((resolve, reject) => {
    // 여기에서 서버에 이미지를 업로드하고 해당 이미지의 URL을 받아와야 합니다.
    // 이 예제에서는 단순히 이미지의 Data URL을 반환합니다.
    const reader = new FileReader();
    reader.onload = function (event) {
      resolve(event.target.result);
    };
    reader.onerror = function (error) {
      reject(error);
    };
    reader.readAsDataURL(file);
  });
}
