
ClassicEditor
	.create(document.querySelector('#classicNR'), {
		simpleUpload: {
			// The URL that the images are uploaded to.
			uploadUrl: 'http://example.com/upload/image',

			// Enable the XMLHttpRequest.withCredentials property.
			withCredentials: true,

			// Headers sent along with the XMLHttpRequest to the upload server.
			headers: {
				'X-CSRF-TOKEN': 'CSRF-Token',
				Authorization: 'Bearer <JSON Web Token>'
			}
		}


	})
	.then(editor => {
		window.editor = editor;
	})
	.catch(error => {
		console.error(error);
	});



