$(document).ready(function () {
	//    $(function () {
	//        $('div#froala-editor').froalaEditor({
	//            height: 700,
	//            toolbarButtons: ['fontFamily', 'fontSize', 'bold', 'italic', 'underline', 'strikeThrough', '|', 'color', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '|', 'emoticons', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', 'insertLink', '|', 'insertHR', 'clearFormatting', 'undo', 'redo'],
	//            pluginsEnabled: null
	//        });
	//    });

	new FroalaEditor('#froala-editor', {
		height: 500,
		toolbarButtons: ['fontFamily', 'fontSize', 'bold', 'italic', 'underline', 'strikeThrough', '|', 'color', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '|', 'emoticons', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', 'insertLink', '|', 'insertHR', 'clearFormatting', 'undo', 'redo'],
		 language: 'ko'
	});
});
