<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/popup.css" rel="stylesheet">
    <link href="/css/bttn.css" rel="stylesheet">
    <style>
        @media only screen and (max-width: 959px) {
            .bttn-jelly.bttn-lg {
                padding: 5px 10px;
            }
        }
        
        input:focus,textarea:focus {outline-style:none;} 
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <!-- ckeditor 연결  -->
		<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="/ckeditor/config.js"></script>
		<script type="text/javascript" src="/ckeditor/lang/ko.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	var status = false; //수정과 대댓글을 동시에 적용 못하도록
            	
            	$("#list").click(function(){
            		location.href = "/magazine/list";
            	});
            	
            	
            	//글수정
            	$("#modify").click(function(){
            		
            		//ajax로 패스워드 검수 후 수정 페이지로 포워딩
            		//값 셋팅
            		var objParams = {
            				id		 : $("#magazine_id").val()
    				};
            		            		
            		//ajax 호출
            		$.ajax({
            			url			:	"/magazine/check",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					alert(retVal.message);
            				}else{
                				location.href = "/magazine/edit?id="+$("#magazine_id").val();
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            	});
            	
            	//글 삭제
				$("#delete").click(function(){

            		//ajax로 패스워드 검수 후 수정 페이지로 포워딩
            		//값 셋팅
            		var objParams = {
            				id		 : $("#magazine_id").val()
    				};
            		            		
            		//ajax 호출
            		$.ajax({
            			url			:	"/magazine/del",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					alert(retVal.message);
            				}else{
            					alert("삭제 되었습니다.");
                				location.href = "/magazine/list";
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            	});
            	
            });
        </script>
</head>

<body>
	<input type="hidden" id="magazine_id" name="magazine_id" value="${magazineView.id}" />
    <div class="layer-popup">
        <header class="layer-header">
            <div>
                <div class="lpopup-left">
                    <div class="lpopup-title">
                        ${magazineView.subject}
                    </div>
                    <div class="lpopup-subtitle">
                    	${magazineView.subtitle}
                    </div>
                    <div>
                        <a id="modify" name="modify" class="modify">수정</a>
   						<a id="delete" name="delete" class="delete">삭제</a>
                    </div>
                </div>
            </div>
        </header>
        <section class="lpopup-bodyWindow">
            <!--본문-->
            <article class="lpopup-body">
                ${magazineView.content}
            </article>
        </section>
        <section class="lpopup-bottomside">
            <div class="lpopup-stats">
                <div class="stats">
                    <div class="date">
                        <div><img src="/img/default/calendar_icon.png" /></div>${magazineView.register_datetime} <!-- 날짜 수정 필요 -->
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

</html>
