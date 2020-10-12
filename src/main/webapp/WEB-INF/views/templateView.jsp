<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
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
        
        .imgWrapper {
        	width: 100%;
        }
        .imgWrapper > img {
        	width: 100%;
        	height: auto;
        }
        
        .lpopup-attachment .templateList {
		    height: auto;
		    overflow-y: auto;
		}
        
       .lpopup-attachment .templateList img {
		    width: 15%;
			height: 80px;
		}
		.template > img {
			cursor: pointer;
		}
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	var status = false; //수정과 대댓글을 동시에 적용 못하도록
            	
            	$("#list").click(function(){
            		location.href = "/template/list";
            	});
            	
            	$(".template > img").click(function(){
            		var src = $(this).attr("src");
            		
            		$(".imgWrapper > img").attr("src", src); 
            	});
            	
            	$(".tag a"). each(function(index, value){
                	if($(this).text()==""){
                		jQuery(this).css("display", "none");
                	}
                	else{
               			jQuery(this).css("display", "inline");
               		}
                });
            	
            	var writer="${sessionScope.user_nickname}";
            	
            	//팔로우
            	var follow_id="";
            	var follow_check=0;
            	
				$("#writer, .layer-header > img").hover(
					function(e){ //mouseover
						$("#follow-popup").css("left", $(".layer-header > img").offset().left);
						$("#follow-popup").css("top", $("#writer").offset().top+20);
						follow_id=$("#writer").text();
					}
				);
					
				$(".lpopup-comment .left div, .lpopup-comment .profile").hover(
					function(e){ //mouseover
						$("#follow-popup").css("left", $(".lpopup-comment .left").offset().left);
						$("#follow-popup").css("top", $(this).offset().top+35);
					}
				);
				$(".lpopup-comment .left div").hover(
						function(e){ //mouseover
							follow_id=$(this).text();
						}
				);
				$(".lpopup-comment .profile").hover(
						function(e){ //mouseover
							follow_id=$(this).next().children().text();
						}
				);
				 
				$("#writer, .layer-header > img, .lpopup-comment .left div, .lpopup-comment .profile").hover(
					function(e){ //mouseover
						$("#follow-nickname").text(follow_id);
						var objParams = {
								following_id	: writer,
	            				follow_id		: follow_id
	    				};
						
						//프로필 메시지 출력(현재는 이메일)
						$.ajax({
	            			url			:	"/board/follow/message",
	            			dataType	:	"text",
	            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
	            			type 		:	"post",
	            			async		: 	false,
	            			data		:	objParams,
	            			success 	:	function(followMessage){
	            				$("#follow-message").text(followMessage);
	            				return false;
	            			},
	            			error		:	function(request, status, error){
	            				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	            				console.log("AJAX_ERROR");
	            			}
	            		});
						
						//팔로잉 수 출력
						$.ajax({
	            			url			:	"/board/follow/count",
	            			dataType	:	"json",
	            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
	            			type 		:	"post",
	            			async		: 	false,
	            			data		:	objParams,
	            			success 	:	function(followCount){
	            				$("#follow-followers .num").text(followCount);
	            				return false;
	            			},
	            			error		:	function(request, status, error){
	            				console.log("AJAX_ERROR");
	            			}
	            		});
						
						//팔로우 중인지 아닌지 체크
						$.ajax({
	            			url			:	"/board/follow/check",
	            			dataType	:	"json",
	            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
	            			type 		:	"post",
	            			async		: 	false,
	            			data		:	objParams,
	            			success 	:	function(retVal){
	            				if(retVal.code == "NOT NULL") {
	            					$("#follow-button img").attr("src", "/img/default/follow_icon.png");
	            					follow_check=0;
	            				}else{
	            					$("#follow-button img").attr("src", "/img/default/unfollow_icon.png");
	            					follow_check=1;
	            				}
	            				return false;
	            			},
	            			error		:	function(request, status, error){
	            				console.log("AJAX_ERROR");
	            			}
	            		});
					
						$("#follow-popup").css("display", "block");
					}
				);
				
				$(".lpopup-comment").hover(
					function(){ //mouseout
						$("#follow-popup").css("display", "none");
					}
				);
					
				$("#follow-popup").hover(
					function(e){ //mouseover
						$("#follow-popup").css("display", "block");
					}, function(){ //mouseout
						$("#follow-popup").css("display", "none");
					}
				);
				
				$("#follow-button img").click(function(){
						if(!writer){ //로그인 상태가 아니면
	                		//alert("로그인을 해주세요.");
	                		return false;
	                	}
						
						var objParams = {
								following_id	: writer,
	            				follow_id		: follow_id
	    				};
						
						console.log(follow_check);
						
						if(follow_check==0){
							$.ajax({
		            			url			:	"/board/unfollow",
		            			dataType	:	"json",
		            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
		            			type 		:	"post",
		            			async		: 	false,
		            			data		:	objParams,
		            			success 	:	function(retVal){
		            				$("#follow-button img").attr("src", "/img/default/unfollow_icon.png");
	            					return false;
		            			},
		            			error		:	function(request, status, error){
		            				console.log("AJAX_ERROR");
		            			}
		            		});
						}else{
							$.ajax({
		            			url			:	"/board/follow",
		            			dataType	:	"json",
		            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
		            			type 		:	"post",
		            			async		: 	false,
		            			data		:	objParams,
		            			success 	:	function(retVal){
									$("#follow-button img").attr("src", "/img/default/follow_icon.png");
	            					return false;
		            			},
		            			error		:	function(request, status, error){
		            				console.log("AJAX_ERROR");
		            			}
		            		});
						}
					}
				);
				
            	//댓글 저장
            	$("#reply_save").click(function(){
            		
            		if(!writer){
                		alert("로그인을 해주세요.");
                		return false;
                	}
                	else if($("#reply_content").val().trim() == ""){
                    	alert("내용을 입력하세요.");
                    	$("#reply_content").focus();
                    	return false;
                    }
                    
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
            		
            		//값 셋팅
            		var objParams = {
            				template_id		: $("#template_id").val(),
            				parent_id		: "0",
            				depth			: "0",
            				writer			: writer,
            				reply_content	: reply_content
    				};
            		
            		var reply_id;
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"/template/reply/save",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){
            				if(retVal.code != "OK") {
            					alert(retVal.message);
            					return false;
            				}else{
                				reply_id = retVal.reply_id;
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            		var reply_area = $("#reply_area");
            		
            		var reply = 
            			'<article class="lpopup-comment" reply_type="main">'+
	            		'<div class="left">'+
	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
	            		'   <div><a class="nickname" name="nickname" nickname="'+writer+'">'+writer+'</a></div>'+
	            		'</div>'+
	            		'<div class="right">'+
	            		'   <div class="body">'+
	            		reply_content+
	            		'</div>'+
	            		'<div class="bottom"> May 13,2019'+
	            		'   <span class="sep">|</span>'+
	            		'   <a name="reply_reply" class="reply" reply_id = "'+reply_id+'">답글</a>'+
	            		'   <a name="reply_modify" class="modify"  r_type = "main" parent_id = "0" reply_id = "'+reply_id+'" nickname="'+writer+'">수정</a>'+
	            		'   <a name="reply_del" class="delete" r_type = "main" reply_id = "'+reply_id+'" nickname="'+writer+'">삭제</a>'+
	            		'   <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />'+
	            		'</div>'+
	            		'</div>'+
	            		'</article>';
	            		
            		 if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }

            		//댓글 초기화
    				$("#reply_content").val("");
    				
            	});
            	
            	//댓글 삭제
                $(document).on("click","a[name='reply_del']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var r_type = $(this).attr("r_type");
                    var check_writer = $(this).attr("nickname");
                    
                    if(!writer){
                		alert("로그인을 해주세요.");
                		return false;
                	} else if(check_writer != writer){
                		alert("댓글 작성자가 다릅니다.");
                		return false;
                	}
                    
                    //패스워드와 아이디를 넘겨 삭제를 한다.
                    //값 셋팅
                    var objParams = {
                            reply_id        : reply_id,
                            r_type            : r_type
                    };
                   
                    //ajax 호출
                    $.ajax({
                        url         :    "/template/reply/del",
                        dataType    :    "json",
                        contentType :    "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :    "post",
                        async       :     false, //동기: false, 비동기: ture
                        data        :    objParams,
                        success     :    function(retVal){
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                check = true;               
                            }
                        },
                        error : function(request,status,error){
                        	alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                        	alert("댓글이 삭제되지 않았습니다");
                        }
                    });
                    
                    if(check){
                        if(r_type=="main"){//depth가 0이면 하위 댓글 다 지움
                            //삭제하면서 하위 댓글도 삭제
                            var prevTr = $(this).parent().parent().parent().next(); //댓글의 다음
                            
                            while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                                prevTr.remove();
                                prevTr = $(this).parent().parent().parent().next();
                            }
                                                        
                            $(this).parent().parent().parent().remove();
                        }else{ //아니면 자기만 지움
                        	$(this).parent().parent().parent().remove();
                        }
                        
                    }
                    
                });
            	
            	//댓글 수정 입력
                $(document).on("click","a[name='reply_modify']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    var r_type = $(this).attr("r_type");
                    var check_writer = $(this).attr("nickname");
                    
                    if(!writer){
                		alert("로그인을 해주세요.");
                		return false;
                	} else if(check_writer != writer){
                		alert("댓글 작성자가 다릅니다. "+check_writer+" "+writer);
                		return false;
                	}

                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "/template/reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
                            if(retVal.code != "OK") {
                                check = false;//패스워드가 맞으면 체크값을 true로 변경
                                alert(retVal.message);
                            }else{
                                check = true;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    if(status){
                        alert("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }
                    
                    if(check){
                    	status = true;
                        //자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
                        var txt_reply_content = $(this).parent().prev().html().trim(); //댓글내용 가져오기
        
                        //입력받는 창 등록
                        var replyEditor = 
                        	'<article class="lpopup-comment" reply_type="main">'+
    	            		'<div class="left">'+
    	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
    	            		'   <div><a class="nickname">nickname</a></div>'+
    	            		'</div>'+
    	            		'<div class="right">'+
    	            		'   <div class="body">'+
    	            		'   <textarea class="reply_content" name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'">'+txt_reply_content+'</textarea>'+
    	            		'</div>'+
    	            		'<div class="bottom"> May 13,2019'+
    	            		'   <span class="sep">|</span>'+
    	            		'   <a name="reply_modify_save" class="modify" r_type = "'+r_type+'" parent_id="'+parent_id+'" reply_id="'+reply_id+'">등록</a>'+
    	            		'   <a name="reply_modify_cancel" class="delete" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" parent_id="'+parent_id+'" reply_id="'+reply_id+'">취소</a>'+
    	            		'</div>'+
    	            		'</div>'+
    	            		'</article>';
                        var prevTr = $(this).parent().parent().parent();
                           //자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().parent().remove(); 
                    }
                     
                });
            	
                //댓글 수정 취소
                $(document).on("click","a[name='reply_modify_cancel']", function(){
                    //원래 데이터를 가져온다.
                    var r_type = $(this).attr("r_type");
                    var r_content = $(this).attr("r_content");
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    
                    var reply;
                    //자기 위에 기존 댓글 적고 
                    if(r_type=="main"){
                        reply = 
                        	'<article class="lpopup-comment" reply_type="main">'+
    	            		'<div class="left">'+
    	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
    	            		'   <div><a class="nickname" name="nickname" nickname="'+writer+'">'+writer+'</a></div>'+
    	            		'</div>'+
    	            		'<div class="right">'+
    	            		'   <div class="body">'+
    	            		r_content+
    	            		'</div>'+
    	            		'<div class="bottom"> May 13,2019'+
    	            		'   <span class="sep">|</span>'+
    	            		'   <a name="reply_reply" class="reply" reply_id = "'+reply_id+'">답글</a>'+
    	            		'   <a name="reply_modify" class="modify" r_type = "main" parent_id="0" reply_id = "'+reply_id+'" nickname="'+writer+'">수정</a>'+
    	            		'   <a name="reply_del" class="delete" reply_id = "'+reply_id+'" nickname="'+writer+'">삭제</a>'+
    	            		'   <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />'+
    	            		'</div>'+
    	            		'</div>'+
    	            		'</article>';
                    }else{
                        reply = 
                        	'<article class="lpopup-comment" reply_type="main">'+
    	            		'<div class="left">'+
    	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
    	            		'   <div><a class="nickname" name="nickname" nickname="'+writer+'">'+writer+'</a></div>'+
    	            		'</div>'+
    	            		'<div class="right">'+
    	            		'   <div class="body">'+
    	            		r_content+
    	            		'</div>'+
    	            		'<div class="bottom"> May 13,2019'+
    	            		'   <span class="sep">|</span>'+
    	            		'   <a name="reply_reply" class="reply" reply_id = "'+reply_id+'">답글</a>'+
    	            		'   <a name="reply_modify" class="modify" r_type = "sub" parent_id="'+parent_id+'" reply_id = "'+reply_id+'" nickname="'+writer+'">수정</a>'+
    	            		'   <a name="reply_del" class="delete" reply_id = "'+reply_id+'" nickname="'+writer+'">삭제</a>'+
    	            		'   <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />'+
    	            		'</div>'+
    	            		'</div>'+
    	            		'</article>';
                    }
                    
                    var prevTr = $(this).parent().parent().parent();
                       //자기 위에 붙이기
                    prevTr.after(reply);
                       
                      //자기 자신 삭제
                    $(this).parent().parent().parent().remove(); 
                      
                    status = false;
                    
                });
                
                  //댓글 수정 저장
                $(document).on("click","a[name='reply_modify_save']", function(){
                    
                    var reply_id = $(this).attr("reply_id");
                    
                    //널 체크
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                    //DB에 업데이트 하고
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    var reply_content = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                    var r_type = $(this).attr("r_type");
                    
                    var parent_id;
                    var depth;
                    if(r_type=="main"){
                        parent_id = "0";
                        depth = "0";
                    }else{
                        parent_id = $(this).attr("parent_id");
                        depth = "1";
                    }
                    
                    //값 셋팅
                    var objParams = {
                    		template_id     : $("#template_id").val(),
                            reply_id		: reply_id,
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_content   : reply_content
                    };

                    $.ajax({
                        url         :   "/template/reply/update",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_id;
                                parent_id = retVal.parent_id;
                                writer = retVal.writer;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                  //수정된댓글 내용을 적고
                    if(r_type=="main"){
                        reply = 
                        	'<article class="lpopup-comment" reply_type="main">'+
    	            		'<div class="left">'+
    	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
    	            		'   <div><a class="nickname" name="nickname" nickname="'+"${sessionScope.user_nickname}"+'">'+"${sessionScope.user_nickname}"+'</a></div>'+
    	            		'</div>'+
    	            		'<div class="right">'+
    	            		'   <div class="body">'+
    	            		$("#reply_modify_content_"+reply_id).val()+
    	            		'</div>'+
    	            		'<div class="bottom"> May 13,2019'+
    	            		'   <span class="sep">|</span>'+
    	            		'   <a name="reply_reply" class="reply" reply_id = "'+reply_id+'">답글</a>'+
    	            		'   <a name="reply_modify" class="modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'" nickname="'+writer+'">수정</a>'+
    	            		'   <a name="reply_del" class="delete" reply_id = "'+reply_id+'" nickname="'+writer+'">삭제</a>'+
    	            		'   <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />'+
    	            		'</div>'+
    	            		'</div>'+
    	            		'</article>';
                    }else{
                        reply = 
                        	'<article class="lpopup-comment" reply_type="main">'+
    	            		'<div class="left">'+
    	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
    	            		'   <div><a class="nickname" name="nickname" nickname="'+"${sessionScope.user_nickname}"+'">'+"${sessionScope.user_nickname}"+'</a></div>'+
    	            		'</div>'+
    	            		'<div class="right">'+
    	            		'   <div class="body">'+
    	            		$("#reply_modify_content_"+reply_id).val()+
    	            		'</div>'+
    	            		'<div class="bottom"> May 13,2019'+
    	            		'   <span class="sep">|</span>'+
    	            		'   <a name="reply_reply" class="reply" reply_id = "'+reply_id+'">답글</a>'+
    	            		'   <a name="reply_modify" class="modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'" nickname="'+writer+'">수정</a>'+
    	            		'   <a name="reply_del" class="delete" reply_id = "'+reply_id+'" nickname="'+writer+'">삭제</a>'+
    	            		'   <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />'+
    	            		'</div>'+
    	            		'</div>'+
    	            		'</article>';
                    }
                    
                    var prevTr = $(this).parent().parent().parent();
                    //자기 위에 붙이기
                    prevTr.after(reply);
                       
                    //자기 자신 삭제
                    $(this).parent().parent().parent().remove(); 
                      
                    status = false;
                    
                });
                  
            	//대댓글 입력창
            	$(document).on("click","a[name='reply_reply']",function(){ //동적 이벤트
            		
            		if(status){
                        alert("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }
                    
                    status = true;
            		
            		$("#reply_add").remove();
            		
            		var reply_id = $(this).attr("reply_id");
            		var check_writer = "${sessionScope.user_id}";
            		var last_check = false;//마지막 tr 체크
            		
            		if(!check_writer){
                		alert("로그인을 해주세요.");
                		return false;
                	}
            		
            		//입력받는 창 등록
            		 var replyEditor = 
            			'<article class="lpopup-comment reply_reply" id="reply_add">'+
	            		'<div class="left">'+
	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
	            		'   <div><a class="nickname" name="nickname" nickname="'+writer+'">'+writer+'</a></div>'+
	            		'</div>'+
	            		'<div class="right">'+
	            		'   <div class="body">'+
	            		'   <textarea class="reply_content" name="reply_reply_content"></textarea>'+
	            		'</div>'+
	            		'<div class="bottom"> May 13,2019'+
	            		'   <span class="sep">|</span>'+
	            		'   <a name="reply_reply_save" class="modify" parent_id="'+reply_id+'">등록</a>'+
	            		'   <a name="reply_reply_cancel" class="delete">취소</a>'+
	            		'</div>'+
	            		'</div>'+
	            		'</article>';
					var prevTr = $(this).parent().parent().parent().next();
	            	
	            	//부모의 부모 다음이 sub이면 마지막 sub 뒤에 붙인다.
            		//마지막 리플 처리
            		if(prevTr.attr("reply_type") == undefined){
            			prevTr = $(this).parent().parent().parent();
            		}else{
            			while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                        }
            			
            			if(prevTr.attr("reply_type") == undefined){//next뒤에 tr이 없다면 마지막이라는 표시를 해주자
            				last_check = true;
            			}else{
            				prevTr = prevTr.prev();
            			}
            			
            		}
	            	
	            	if(last_check){//마지막이라면 제일 마지막 tr 뒤에 댓글 입력을 붙인다.
	            		$('#reply_area tr:last').after(replyEditor);	
	            	}else{
	            		prevTr.after(replyEditor);
	            	}
            		
            	});
            	
            	//대댓글 등록
            	$(document).on("click","a[name='reply_reply_save']",function(){
            		            		
            		var reply_reply_content = $("textarea[name='reply_reply_content']");
            		var reply_reply_content_val = reply_reply_content.val().replace("\n", "<br>"); //개행처리
            		
            		if(!writer){
                		alert("로그인을 해주세요.");
                		return false;
                	} else if(reply_reply_content.val().trim() == ""){ //널 검사
                    	alert("내용을 입력하세요.");
                    	reply_reply_content.focus();
                    	return false;
                    }
            		
            		//값 셋팅
            		var objParams = {
            				board_id		: $("#board_id").val(),
            				parent_id		: $(this).attr("parent_id"),	
            				depth			: "1",
            				writer			: writer,
            				reply_content	: reply_reply_content_val
    				};
            		
            		var reply_id;
            		var parent_id;
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"/template/reply/save",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					alert(retVal.message);
            				}else{
                				reply_id = retVal.reply_id;
                				parent_id = retVal.parent_id;
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            		var reply = 
            			'<article class="lpopup-comment" reply_type="main">'+
	            		'<div class="left">'+
	            		'   <img class="profile" src="/img/default/default_profile.png" />'+
	            		'   <div><a class="nickname" name="nickname" nickname="'+writer+'">'+writer+'</a></div>'+ //writer ajax가 바로 안먹어서 session 사용
	            		'</div>'+
	            		'<div class="right">'+
	            		'   <div class="body">'+
	            		reply_reply_content_val+
	            		'</div>'+
	            		'<div class="bottom"> May 13,2019'+
	            		'   <span class="sep">|</span>'+
	            		'   <a class="modify" name="reply_modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'" nickname="'+writer+'">수정</a>'+
	            		'   <a class="delete" name="reply_del" r_type = "sub" reply_id = "'+reply_id+'" nickname="'+writer+'">삭제</a>'+
	            		'   <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />'+
	            		'</div>'+
	            		'</div>'+
	            		'</article>';
	            	var prevTr = $(this).parent().parent().parent().prev();
	            	
            		prevTr.after(reply);
	            	            		
            		$("#reply_add").remove();
            		
            		status = false;
            		
            	});
            	
            	//대댓글 입력창 취소
            	$(document).on("click","a[name='reply_reply_cancel']",function(){
            		$("#reply_add").remove();
            		
            		status = false;
            	});
            	
            	//글 수정
            	$("#modify").click(function(){
            		if("${templateView.writer}" == writer){
            			//ajax로 패스워드 검수 후 수정 페이지로 포워딩
                		//값 셋팅
                		var objParams = {
                				id		 : $("#template_id").val()
        				};
                		            		
                		//ajax 호출
                		$.ajax({
                			url			:	"/template/check",
                			dataType	:	"json",
                			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
                			type 		:	"post",
                			async		: 	false, //동기: false, 비동기: ture
                			data		:	objParams,
                			success 	:	function(retVal){

                				if(retVal.code != "OK") {
                					alert(retVal.message);
                				}else{
                    				location.href = "/template/edit?id="+$("#template_id").val();
                				}
                				
                			},
                			error		:	function(request, status, error){
                				console.log("AJAX_ERROR");
                			}
                		});
            		}
            		
            	});
            	
            	//글 삭제
				$("#delete").click(function(){
					if("${templateView.writer}" == writer){
						//ajax로 패스워드 검수 후 수정 페이지로 포워딩
	            		//값 셋팅
	            		var objParams = {
	            				id		 : $("#template_id").val()
	    				};
	            		            		
	            		//ajax 호출
	            		$.ajax({
	            			url			:	"/template/del",
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
	                				location.href = "/template/list";
	            				}
	            				
	            			},
	            			error		:	function(request, status, error){
	            				console.log("AJAX_ERROR");
	            			}
	            		});
					}
            		
            	});
            	
				//like ajax
				$("#like").click(function(){
                		var objParams = {
                				id				 : $("#template_id").val(),
                				like_templateId	 : $("#template_id").val(),
                				like_getUserNickName   : $("#template_writer").val(),
                				like_sendUserId  : $("#user_id").val()
        				};
                		
                		$.ajax({
                			url			:	"/template/like",
                			dataType	:	"json",
                			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
                			type 		:	"post",
                			async		: 	false,
                			data		:	objParams,
                			success 	:	function(retVal){
                				if(retVal.code == "OK") {
                					if(retVal.state=="like"){
                						$(".lpopup-like-icon > img").attr("src", "/img/default/like_icon.png");
                					}else {
                						$(".lpopup-like-icon > img").attr("src", "/img/default/unlike_icon.png");
                					}
                					$(".like > span").text(retVal.likeCnt + " likes");
                				}else{
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
</head>

<body>
	<input type="hidden" id="user_id" name="user_id" value="${sessionScope.user_id}" /> 
	<input type="hidden" id="job" name="job" value="${users.user_job}" /> 
	<input type="hidden" id="template_id" name="template_id" value="${templateView.id}" />
	<input type="hidden" id="template_writer" name="template_writer" value="${templateView.writer}"/>
    <div class="layer-popup">
     	<!-- 팔로우 -->
		<div id="follow-popup">
			<div id="follow-img"><img src="/img/default/default_profile.png"></div>
			<div id="follow-nickname">nickname</div>
			<div id="follow-message">message</div>
			<div id="follow-button"><img src="/img/default/unfollow_icon.png"></div>
			<div id="follow-followers"><span class="num">0</span>&nbsp;<span>followers</span></div>
		</div>
        <header class="layer-header">
            <img src="/img/diyz_select/color_gradient.jpg" />
            <div>
                <div class="lpopup-left">
                    <div class="lpopup-title">
                        ${templateView.subject}
                    </div>
                    <div class="nickname">
                        <a id="writer">${templateView.writer}</a>
                        <a id="modify" name="modify" class="modify">수정</a>
   						<a id="delete" name="delete" class="delete">삭제</a>
                    </div>
                </div>
                <a class="bttn-jelly bttn-lg bttn-default" id="like">
                 <div> <div class="lpopup-like-icon"><img src="${likeCheck}" /></div>
                    Like
                	</div>
                </a>
            </div>
        </header>
        <section class="lpopup-bodyWindow">
            <!--본문-->
            <div class="imgWrapper">
            		<img src="${templateView.file1}" />
            </div>
            <article class="lpopup-body">
                ${templateView.content}
            </article>
            <!--템플릿 첨부-->
            <article class="lpopup-attachment">
                <div class="name">공유된 템플릿</div>
                <div class="templateList">
                    <div class="template">
                        <img src="${templateView.file1}" />
                        <img src="${templateView.file2}" />
                        <img src="${templateView.file3}" />
                        <img src="${templateView.file4}" />
                        <img src="${templateView.file5}" />
                    </div>
                </div>
            </article>
        </section>
        <section class="lpopup-commentWindow">
            <div class="lpopup-commentHeader">
           		<div border="0" class="lpopup-comment">
	   				<textarea class="reply_content" id="reply_content" name="reply_content" cols="50" placeholder="댓글 입력"></textarea>
	   				<button id="reply_save" name="reply_save">댓글 등록</button>
	   			</div>
                Comments
                <div class="comment-sort">
                    <a>newest</a>
                    <a>liked</a>
                </div>
            </div>
            <div class="comment-list">
				<table border="0" class="lpopup-comment" id="reply_area">
	   				<tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
	   					<td colspan="4"></td>
	   				</tr>
		   			<!-- 댓글이 들어갈 공간 -->
		   			<c:forEach var="replyList" items="${replyList}" varStatus="status">
		   				<article class="lpopup-comment" reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>">
	                        <div class="left">
	                        	<c:if test="${replyList.depth == '1'}"> <span>&nbsp;re:&nbsp;</span></c:if>
	                            <img class="profile" src="/img/default/default_profile.png" />
	                            <div><a class="nickname">nickname</a></div>
	                        </div>
	                        <div class="right">
	                            <div class="body">
	                                ${replyList.reply_content}
	                            </div>
	                            <div class="bottom">
	                                May 13,2019
	                                <span class="sep">|</span>
	                                <c:if test="${replyList.depth != '1'}">
				    					<a name="reply_reply" class="reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">답글</a><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
					    			</c:if>
					    			<a name="reply_modify" class="modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</a>
					    			<a  name="reply_del" class="delete" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">삭제</a>
	                                <input type="image" src="/img/default/unlike_icon.png" value="" onclick="" />
	                            </div>
	                        </div>
                    	</article>
				    </c:forEach>
   				</table>
            </div>
        </section>
        <section class="lpopup-bottomside">
            <div class="lpopup-stats">
                <div class="share">
                    <a id="facebook" class="bttn-bordered bttn-xs bttn-primary">
                        <div><img src="/img/default/facebook.png" /></div>Feed
                    </a>
                    <a id="tweet" class="bttn-bordered bttn-xs bttn-primary">
                        <div><img src="/img/default/twitter.png" /></div>Tweet
                    </a>
                    <a id="linkcopy" class="bttn-bordered bttn-xs bttn-primary">
                        <div><img src="/img/default/link.png" /></div>Copy
                    </a>
                </div>
                <div class="stats">
                	<div class="view tag">
                        <div><img src="/img/default/tag_icon.png" /></div>
                        <a href="/template/tagsearch?search=${templateView.tag1}" id="tag1">${templateView.tag1}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag2}" id="tag2">${templateView.tag2}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag3}" id="tag3">${templateView.tag3}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag4}" id="tag4">${templateView.tag4}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag5}" id="tag5">${templateView.tag5}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag6}" id="tag6">${templateView.tag6}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag7}" id="tag7">${templateView.tag7}</a>&nbsp;&nbsp;
                        <a href="/template/tagsearch?search=${templateView.tag8}" id="tag8">${templateView.tag8}</a>
                    </div>
                    <div class="view">
                        <div><img src="/img/default/view_icon_gray.png" /></div>${templateView.read_count} views
                    </div>
                    <div class="like">
                        <div><img src="/img/default/unlike_icon.png" /></div><span>${templateView.like_count} likes</span>
                    </div>
                    <div class="date">
                        <div><img src="/img/default/calendar_icon.png" /></div>${templateView.register_datetime}
                    </div>
                </div>
            </div>
            <div class="lpopup-player-shots">
                	당신이 흥미로워할 만한 템플릿
                <ol>
                    <li><a><img src="/img/diyz_select/layout_cover.jpg" /></a></li>
                    <li><a><img src="/img/diyz_select/layout_1title_1content.jpg" /></a></li>
                    <li><a><img src="/img/diyz_select/layout_1title_1content_1caption.jpg" /></a></li>
                    <li><a><img src="/img/diyz_select/layout_1title_2content.jpg" /></a></li>
                </ol>
            </div>
            <div class="ad">
                <img src="/img/ad/ad1_mobile.JPG" /><br>
                See how users are interacting with your designs - for free.
            </div>
        </section>
    </div>
</body>
</html>