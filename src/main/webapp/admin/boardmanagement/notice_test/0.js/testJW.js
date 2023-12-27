
ClassicEditor
	.create(document.querySelector('#classicNR'), {
		simpleUpload: {
			uploadUrl: 'http://localhost/halo/admin/0.js/ckeditor/file',

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



