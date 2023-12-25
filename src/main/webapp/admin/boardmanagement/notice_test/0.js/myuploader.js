class MyUploadAdapter {
	constructor(loader, sort) {

		this.loader = loader;

		this.sort = sort

	}



	upload() {

		return this.loader.file

			.then(file => new Promise((resolve, reject) => {

				this._initRequest();

				this._initListeners(resolve, reject, file);

				this._sendRequest(file);

			}));

	}



	abort() {

		if (this.xhr) {

			this.xhr.abort();

		}

	}





	_initRequest() {

		const xhr = this.xhr = new XMLHttpRequest();



		//POST 요청으로 파일을 업로드하는 페이지 지정 - json 으로 결과값 수신

		xhr.open('POST', '/admin/src/main/webapp/admin/boardmanagement/notice_test/0.img/upload', true);



/*C:/KJW/halo/src/main/webapp/admin/boardmanagement/notice_test/0.img_upload*/




		xhr.responseType = 'json';

	}



	//XHR 리스너 초기화 하기 

	_initListeners(resolve, reject, file) {

		const xhr = this.xhr;

		const loader = this.loader;

		const genericErrorText = "파일업로드 실패 (FILE:${ file.name })";



		xhr.addEventListener('error', () => reject(genericErrorText));

		xhr.addEventListener('abort', () => reject());



		xhr.addEventListener('load', () => {

			const response = xhr.response;



			//에러처리

			if (!response || response.error) {

				return reject(response && response.error ? response.error.message : genericErrorText);

			}



			// 만약 업로드가 성공했다면, 업로드 프로미스를 적어도 default URL을 담은 객체와 함께 resolve하라. 

			// 이 URL은 서버에 업로드된 이미지를 가리키며, 컨텐츠에 이미지를 표시하기 위해 사용된다. 

			resolve({ default: response.url });
		});



		// 파일로더는 uploadTotal과 upload properties라는 속성 두개를 갖는다. 

		// 이 두개의 속성으로 에디터에서 업로드 진행상황을 표시 할 수 있다. 

		if (xhr.upload) {

			xhr.upload.addEventListener('progress', evt => {

				if (evt.lengthComputable) {

					loader.uploadTotal = evt.total;

					loader.uploaded = evt.loaded;

				}
			});

		}

	}



	//데이터 설정 및 서버전송

	_sendRequest(file) {

		const data = new FormData();

		data.append('upload', file);



		this.xhr.send(data);

	};

};
