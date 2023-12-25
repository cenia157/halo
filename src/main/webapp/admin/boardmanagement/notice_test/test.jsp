<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">




</head>
<body>


	<script src="admin/0.js/ckeditor.js"></script>


	<script src="admin/boardmanagement/notice_test/0.js/myuploader.js"></script>





	<textarea id="ckeditor" name="ckeditor" class="txtarea"></textarea>

	<script>

		ClassicEditor

			.create(document.querySelector('#ckeditor'), {

				//툴바 옵션

				toolbar: {

					items: ['fontFamily', 'fontSize', 'fontColor', 'fontBackgroundColor', 'highlight', 'bold', 'italic', 'link', 'insertTable', 'imageUpload', 'undo', 'sourceediting'],

					shouldNotGroupWhenFull: true,

				},

				table: {

					contentToolbar: [

						'tableColumn',

						'tableRow',

						'mergeTableCells'

					]

				}



			}).then(function (editor) {

				// 이미지 업로드 세팅

				editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {

					return new MyUploadAdapter(loader, 1);

				};



				$('style').append('.ck-content { min-height: ' + $('textarea[name="ckeditor"]').height() + 'px !important; }');



			}).catch(error => { console.log(error); });


	</script>
	asd





</body>
</html>
