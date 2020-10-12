/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'ko';
	// config.uiColor = '#AADC6E';
	 config.toolbarGroups = [
	      { name: 'styles', groups: [ 'styles' ] },
	      { name: 'clipboard', groups: [ 'undo', 'clipboard' ] },
	      { name: 'insert', groups: [ 'insert' ] },
	      '/',
	      { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	      { name: 'colors', groups: [ 'colors' ] },
	      { name: 'document', groups: [ 'mode', 'doctools', 'document' ] },
	      { name: 'paragraph', groups: [ 'align', 'indent', 'list', 'bidi', 'blocks', 'paragraph' ] },
	      { name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
	      { name: 'forms', groups: [ 'forms' ] },
	      { name: 'links', groups: [ 'links' ] },
	      { name: 'tools', groups: [ 'tools' ] },
	      { name: 'others', groups: [ 'others' ] },
	      { name: 'about', groups: [ 'about' ] }
	   ];

	   config.removeButtons = 'Save,NewPage,Preview,Print,Templates,Source,PasteFromWord,Find,Replace,SelectAll,Scayt,Checkbox,Radio,TextField,Textarea,Select,Form,HiddenField,ImageButton,Button,Subscript,Superscript,CopyFormatting,RemoveFormat,CreateDiv,BidiLtr,BidiRtl,Anchor,Flash,Table,SpecialChar,PageBreak,Iframe,Styles,Maximize,ShowBlocks,About';
};
