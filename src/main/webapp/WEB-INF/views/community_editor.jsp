<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="/img/default/paicon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="/js/bootstrap-tagsinput.js"></script>
	<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/bootstrap-tagsinput.css" rel="stylesheet">
    <link href="/css/community_editor.css" rel="stylesheet">
    <link href="/css/bttn.css"rel="stylesheet">
  	<script type="text/javascript">
            $(document).ready(function(){
			    
            	CKEDITOR.replace('content');
            	CKEDITOR.config.height = 1000;
            	CKEDITOR.config.filebrowserImageUploadUrl= '/community/imageUpload';
            	CKEDITOR.config.language='ko';
            	CKEDITOR.config.resize_enabled = false; // 에디터 크기를 조절하지 않음
            	CKEDITOR.config.enterMode=CKEDITOR.ENTER_BR; // 엔터키를 <br> 로 적용함.
            	CKEDITOR.config.shiftEnterMode=CKEDITOR.ENTER_P; // 쉬프트 + 엔터를 <p> 로 적용함.
            	
            	$("#list").click(function(){
            		location.href = "/board/list";
            	});
            	
            	$("#save").click(function(){
            		
            		//에디터 내용 가져옴
            		var content = CKEDITOR.instances.content.getData();
            		var tags = $("#tagsinput").tagsinput('items');
                	
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
            				content		: content,
            				writer		: $("#writer").val(),
            				tag1		: tags[0],
            				tag2		: tags[1],
            				tag3		: tags[2],
            				tag4		: tags[3],
            				tag5		: tags[4],
            				tag6		: tags[5],
            				tag7		: tags[6],
            				tag8		: tags[7]
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
			.navbar>.container{
				flex-wrap:initial;
			}
			.navbar-nav{
				flex-direction:initial;
			}
			.section_editor{
				margin-bottom:50px;
			}
			.navbar{
				float:none;
			}
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
	<input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
	<input type="hidden" id="writer" name="writer" value="${sessionScope.user_nickname}" />
    	<div class="editor_wrapper">
			<h1>New Post</h1>
			<div id="post_title">
				<input type="text" id="subject" name="subject" placeholder="제목" value="${boardView.subject}" autocomplete=off>
			</div>
			<div class="bs-example">
				<input type="text" class="tagsinput" id="tagsinput" value="<c:if test="${boardView.tag1 != null}">${boardView.tag1}</c:if><c:if test="${boardView.tag2 != null}">,${boardView.tag2}</c:if><c:if test="${boardView.tag3 != null}">,${boardView.tag3}</c:if><c:if test="${boardView.tag4 != null}">,${boardView.tag4}</c:if><c:if test="${boardView.tag5 != null}">,${boardView.tag5}</c:if><c:if test="${boardView.tag6 != null}">,${boardView.tag6}</c:if><c:if test="${boardView.tag7 != null}">,${boardView.tag7}</c:if><c:if test="${boardView.tag8 != null}">,${boardView.tag8}</c:if>" placeholder="Add tags" data-role="tagsinput"/>
			</div>
			<textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
		</div>
		<div class="btnWrapper">
   				<button id="save" class="btn_postSave bttn-jelly bttn-md bttn-primary" name="save">저장</button>
		</div>
    </section>
  </body>
</html>