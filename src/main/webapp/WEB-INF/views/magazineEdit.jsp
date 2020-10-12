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
    <link href="/css/community_editor.css" rel="stylesheet">
    <link href="/css/bttn.css"rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
	<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
  		<script type="text/javascript">
	  		function readURL(input) {
		  		if (input.files && input.files[0]) {
		  			var reader = new FileReader();
		  			reader.onload = function (e) {
		  				$("td > img").attr('src', e.target.result);
		  				$(".check").val("yes");
		  			}
		  			reader.readAsDataURL(input.files[0]);
		  		}
			}
            $(document).ready(function(){
            	
            	CKEDITOR.replace('content');
            	CKEDITOR.config.height = 1000;
            	CKEDITOR.config.filebrowserImageUploadUrl= '/magazine/imageUpload';
            	CKEDITOR.config.language='ko';
            	CKEDITOR.config.resize_enabled = false; // 에디터 크기를 조절하지 않음
            	CKEDITOR.config.enterMode=CKEDITOR.ENTER_BR; // 엔터키를 <br> 로 적용함.
            	CKEDITOR.config.shiftEnterMode=CKEDITOR.ENTER_P; // 쉬프트 + 엔터를 <p> 로 적용함.
            	
            	$("#list").click(function(){
            		location.href = "/magazine/list";
            	});
            	
            	$("#imgInput").change(function(){
      	  		    readURL(this);
      	  		});
            	
            	$("#save").click(function(){
            		
            		//에디터 내용 가져옴
            		var content = CKEDITOR.instances.content.getData();
            		
            		if($("td > img").attr("src")==""){
    					alert("이미지를 첨부해주세요.");
    					return;
    				}
            		
            		var formData = new FormData($("#imgUploadForm")[0]);
            		
            		//널 검사
                    if($("#subject").val().trim() == ""){
                    	alert("제목을 입력하세요.");
                    	$("#subject").focus();
                    	return false;
                    }
               
                    if($("#subtitle").val().trim() == ""){
                    	alert("서브제목을 입력하세요.");
                    	$("#subtitle").focus();
                    	return false;
                    }
            		//값 셋팅
            		var objParams = {
            				<c:if test="${magazineView.id != null}"> //있으면 수정 없으면 등록
            				id			: $("#magazine_id").val(),
            				</c:if>
            				subject		: $("#subject").val(),
            				subtitle	: $("#subtitle").val(),
            				content		: content
    				};
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"/magazine/save",
            			data		:	formData,
            			processData :	false,
            			contentType :	false,
            			type 		:	"post",
            			success 	:	function(retVal){

            				if(retVal.code == "OK") {
            					alert(retVal.message);
            					location.href = "/magazine/list";	
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
        	body{
        		font-family: 'Nanum Gothic', sans-serif;
        	}
        	#save {
        	    padding: 5px 25px;
        	}
        </style>
  </head>
  <body>
  <section class="section_editor">
  	<form method="post" enctype="multipart/form-data" id="imgUploadForm">
	<input type="hidden" id="magazine_id" name="magazine_id" value="${magazineView.id}" />
    	<div class="editor_wrapper">
			<h1>New Post</h1>
			<div id="post_title">
				<input type="text" id="subject" name="subject" placeholder="제목" value="${magazineView.subject}" autocomplete=off>
			</div>
			<div id="post_title">
				<input type="text" id="subtitle" name="subtitle" placeholder="서브제목" value="${magazineView.subtitle}" autocomplete=off>
			</div>
			<textarea name="content" id="content" rows="10" cols="80">${magazineView.content}</textarea>
			<table>
			<tr height="600px">
				<th colspan="2">이미지</th>
				<td>
					<input type="hidden" class="check" name="check" value="no"/>
					<input id="imgInput" type="file" name="imgUp"/>
				</td>
				<td>
					<input type="hidden" class="serverImg" name="imgSrc" value="${magazineView.main_img_path}"/>
					<img src="${magazineView.main_img_path}">
				</td>
			 </tr>
		</table>
		</div>
   				<input id="save" type="submit" value="등록" class="btn_postSave bttn-jelly bttn-md bttn-primary" name="save"></input>
		</form>
    </section>
  </body>
</html>