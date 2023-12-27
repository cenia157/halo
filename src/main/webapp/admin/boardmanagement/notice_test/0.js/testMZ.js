import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor';
import UploadAdapter from '@ckeditor/ckeditor5-upload/src/uploadadapter';

ClassicEditor
	.create(document.querySelector('#classicNR'), {
	})
	.then(editor => {
		  editor.model.document.on('change', (event, data) => {
		const insertedImages = data.operations
                ?.filter(operation => {
                    return (
                        operation.type === 'insert' &&
                        operation.data &&
                        operation.data.is &&
                        operation.data.is('element') &&
                        operation.data.name === 'image'
                    );
                })
                .map(operation => operation.data) || [];

            if (insertedImages.length > 0) {
                console.log('이미지가 삽입되었습니다.', insertedImages);
                // 여기에 원하는 처리를 추가합니다.
            }
        });
    })
	.catch(error => {
		console.error(error);
	});