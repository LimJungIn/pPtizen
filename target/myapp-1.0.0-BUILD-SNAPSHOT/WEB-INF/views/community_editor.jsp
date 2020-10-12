<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/img/default/paicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
  	        <script type="text/javascript">
            $(document).ready(function(){
            	
            	CKEDITOR.replace('content');
            	CKEDITOR.config.height = 1000;
            	CKEDITOR.config.filebrowserImageUploadUrl= '/community/imageUpload';
            	CKEDITOR.config.language='ko';
            	CKEDITOR.config.resize_enabled = false; // 에디터 크기를 조절하지 않음
            	CKEDITOR.config.enterMode=CKEDITOR.ENTER_BR; // 엔터키를 <br> 로 적용함.
            	CKEDITOR.config.shiftEnterMode=CKEDITOR.ENTER_P; // 쉬프트 + 엔터를 <p> 로 적용함.
				
            	CKEDITOR.config.toolbarGroups = [
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
            		{ name: 'others', groups: [ 'others' ] }];
            	
            	$("#list").click(function(){
            		location.href = "/board/list";
            	});
            	
            	$("#save").click(function(){
            		
            		//에디터 내용 가져옴
            		var content = CKEDITOR.instances.content.getData();
            		
            		//널 검사
                    if($("#subject").val().trim() == ""){
                    	alert("제목을 입력하세요.");
                    	$("#subject").focus();
                    	return false;
                    }
            		
            		//값 셋팅
            		var objParams = {
            				<c:if test="${boardView.id != null}"> //있으면 수정 없으면 등록
            				id			: $("#board_id").val(),
            				</c:if>
            				subject		: $("#subject").val(),
            				content		: content
    				};
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"/board/save",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code == "OK") {
            					alert(retVal.message);
            					location.href = "/board/list";	
            				} else {
            					alert(retVal.message);
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            		
            	});
            	
            });
        </script>
  	<style>
  		@import url("css/community_editor.css");
  		.section_editor>form{
  			width:90%;
  			margin: 0 auto;
  		}
  	</style>
  </head>
  <body>
  <section class="section_editor">
	<input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
    	<div align="center">
    		</br>
    		</br>
   			<table width="100%">
   				<tr>
   					<td>
   						제목: <input type="text" id="subject" name="subject" style="width:600px;" placeholder="제목" value="${boardView.subject}"/>
   						<button id="save" name="save">저장</button>   						
   					</td>
   				</tr>
   				<tr>
   					<td>
   						<textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
   					</td>
   				</tr>
   				<tr>
   					<td align="right">
   						<button id="list" name="list">게시판</button>
   					</td>
   				</tr>
   			</table>
    	</div>
    </section>
  </body>
</html>