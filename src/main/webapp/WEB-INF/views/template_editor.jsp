<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/img/default/paicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/template_editor.css" rel="stylesheet">
    <link href="/css/bttn.css"rel="stylesheet">
    <link href="/css/bootstrap-tagsinput.css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="/js/bootstrap-tagsinput.js"></script>
    <script type="text/javascript" src="/js/template_editor.js"></script>
  		<script type="text/javascript">
            $(document).ready(function(){
            	
            	$("#list").click(function(){
            		location.href = "/template/list";
            	});
            	
            	$("#save").click(function(){
            		
            		//에디터 내용 가져옴
            		//var content = $("#content").val();
            		//var tags = $("#tagsinput").tagsinput('items');
            		
            		//제목 null 검사
                    if($("#subject").val().trim() == ""){
                    	alert("제목을 입력하세요.");
                    	$("#subject").focus();
                    	return false;
                    }
            		
            		//값 셋팅
            		/* var objParams = {
            				<c:if test="${boardView.id != null}"> //있으면 수정 없으면 등록
            				id			: $("#board_id").val(),
            				</c:if>
            				subject		: $("#subject").val(),
            				content		: content
    				}; */
            		
					var formData = new FormData($("#fileUploadForm")[0]);
    				
            		//ajax 호출
            		$.ajax({
            			type 		:	"post",
            			url			:	"/template/save",
            			data		:	formData,
            			processData :	false,
            			contentType :	false,
            			success 	:	function(retVal){

            				if(retVal.code == "OK") {
            					alert(retVal.message);
            					location.href = "/template/list";	
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
        	.label-info{
	        	background-color:#d1d1d1;
        	}
        	.label{
	        	display: inline;
			    padding: 2px 5px;
			    font-size: 13px;
			    font-weight: 700;
			    line-height: 1;
			    text-align: center;
			    white-space: nowrap;
			    vertical-align: baseline;
			    border-radius: .25em;
        	}
        	.bootstrap-tagsinput{
        		width:100%;
        		margin-bottom:10px;
        		border-radius:0;
        	}
        	.bootstrap-tagsinput, #hastag_label{
        		font-size:13px;
        	}
        	.bootstrap-tagsinput .tag{
        		color:white;
        	}
        </style>
  </head>
  <body>
	<section class="section_editor">
		<form method="post" onsubmit="return false;" enctype="multipart/form-data" id="fileUploadForm" >
			<input type="hidden" id="board_id" name="board_id" value="${templateView.id}" />
			<input type="hidden" id="writer" name="writer" value="${sessionScope.user_nickname}" />
			<div>
			<div class="editor_wrapper">
				<h2>New Template</h2>
				<div id="post_title">
					<input type="text" id="subject" name="subject" placeholder="제목" value="${templateView.subject}" autocomplete=off>
				</div>
				<div class="bs-example">
					<input type="text" name="tagsinput" class="tagsinput" id="tagsinput" value="<c:if test="${templateView.tag1 != null}">${templateView.tag1}</c:if><c:if test="${templateView.tag2 != null}">,${templateView.tag2}</c:if><c:if test="${templateView.tag3 != null}">,${templateView.tag3}</c:if><c:if test="${templateView.tag4 != null}">,${templateView.tag4}</c:if><c:if test="${templateView.tag5 != null}">,${templateView.tag5}</c:if><c:if test="${templateView.tag6 != null}">,${templateView.tag6}</c:if><c:if test="${templateView.tag7 != null}">,${templateView.tag7}</c:if><c:if test="${templateView.tag8 != null}">,${templateView.tag8}</c:if>" placeholder="Add tags" data-role="tagsinput"/>
				</div>
				<textarea placeholder="템플릿을 소개해주세요" name="content" id="content" rows="10" cols="80">${templateView.content}</textarea>
				<input type="file" id="fileUP" name="fileUP" multiple/>
				<!-- <div class="file-upload_wrapper">
					<label class="imagepicker imagepicker-add thumbnail">
						<input type='file' id="imagepicker2" multiple>
					</label>
				</div> -->
			</div>
			<div class="btnWrapper">
				<button id="save" class="btn_postSave bttn-jelly bttn-md bttn-primary" name="save">저장</button>
			</div>
			</div>
		</form>
	</section>
</body>
</html>