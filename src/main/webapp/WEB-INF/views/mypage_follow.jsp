<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		 var writer="${sessionScope.user_nickname}";
             var follow_id="";
             
                $(".follower .num"). each(function(index, value){
                   var follow_count="";
                   follow_id=$(this).parent().prev().prev().text();
                   //console.log(follow_id);
                   var objParams = {
                        following_id   : writer,
                        follow_id   : follow_id
                  };
                   $.ajax({
                     url         :   "/board/follow/count",
                     dataType   :   "json",
                     contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                     type       :   "post",
                     data      :   objParams,
                     async:false,
                     success    :   function(followCount){
                        follow_count=followCount;
                        return false;
                     },
                     error      :   function(request, status, error){
                        console.log("AJAX_ERROR");
                     }
                  });
                   $(this).text(follow_count);
                  });

                $(".profile_message"). each(function(index, value){
                   var follow_message="";
                   follow_id=$(this).prev().prev().prev().text();
                   var objParams = {
                        following_id   : writer,
                        follow_id   : follow_id
                  };
                   //프로필 메시지 출력(현재는 이메일)
                  $.ajax({
                        url         :   "/board/follow/message",
                        dataType   :   "text",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type       :   "post",
                        async      :    false,
                        data      :   objParams,
                        success    :   function(followMessage){
                           follow_message=followMessage;
                           return false;
                        },
                        error      :   function(request, status, error){
                           alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
                           console.log("AJAX_ERROR");
                        }
                     });
                   $(this).text(follow_message);
                  });
                
                
                $(".follower_img img").click(function(){
                   follow_id=$(this).parent().prev().text();
                   console.log(follow_id);
                  var objParams = {
                        following_id   : writer,
                        follow_id      : follow_id
                   };
                  $.ajax({
                        url         :   "/board/unfollow",
                        dataType   :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type       :   "post",
                        async      :    false,
                        data      :   objParams,
                        success    :   function(retVal){
                           return false;
                        },
                        error      :   function(request, status, error){
                           console.log("AJAX_ERROR");
                        }
                     });
                  $(this).parent().parent().parent().remove();
               }
            );
				
			$(".follow").each(function(index, value){
				var array=[];
				var follow_nickname=$(this).children().first().next().children().first().text();
				var i=0;
				var j=0;
				var objParams = {
							following_id	: writer,
							follow_id	: follow_nickname
				};
				$.ajax({
					url			:	"/user/follow/board",
					dataType	:	"json",
					contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
					type 		:	"post",
					data		:	objParams,
					async:false,
					success 	:	function(followBoardList){
						console.log(followBoardList);
						for(i=0;i<followBoardList.length;i++){
							array[i]=followBoardList[i].id;
							j++;
						}
						for(i=j;i<3;i++){
							array[i]="";
						}
						return false;
					},
					error		:	function(request, status, error){
						console.log("AJAX_ERROR");
					}
				});
				
				if(array[0]!=""){
					$(this).children().next().next().children().children().prop("href","http://localhost:8888/board/view?id="+array[0]);
				}else{
					$(this).children().next().next().children().children().prop("href","#");
				}
				
				if(array[1]!=""){
					$(this).children().next().next().children().next().children().prop("href","http://localhost:8888/board/view?id="+array[1]);
				}else{
					$(this).children().next().next().children().next().children().prop("href","#");
				}
				
				if(array[2]!=""){
					$(this).children().next().next().children().next().next().children().prop("href","http://localhost:8888/board/view?id="+array[2]);
				}else{
					$(this).children().next().next().children().next().next().children().prop("href","#");
				}
			});
    	});
    </script>
    <style>
        @import url("/css/common.css");
        @import url("/css/mypage_post.css");
        @import url("/css/mypage_setup.css");
        @import url("/css/mypage_modify_contacts.css");
        @import url("/css/bttn.css");
        @import url("/css/follow.css");
        .post-top-section {
            margin-top: 25px;
        }

        .bttn-bordered.bttn-xs {
            padding: 12px 5px 3px 5px;
        }

        .bttn-jelly.bttn-md {
            font-size: 14px;
        }

        .bttn-bordered.bttn-sm {
            padding: 4px 10px;
            font-size: 13px;
            font-family: inherit;
        }

        .post-content-section {
            margin-top: 0;
        }

        .column-group {
            border: none;
        }

        .group1 {
            margin: 0;
        }

        .column-content .right span {
            margin: 0;
        }

        .post-content-section {
            background-color: white;
        }

        .post-content-section .column {
            width: 70%;
            margin: 0 10%;
        }
        @media only screen and (max-width: 1240px) {
            .follow .profile_img{
	        	width:20%;
	        	margin-left:40%;
	        	margin-top:0;
        	}
        	.profile_div{
        		margin-top:0;
        		width:27%;
        	}
        	.profile_div .follow_nickname{
	        	font-size:4vw;
	        	margin-left:0;
	        }
	        .profile_div .follower_img{
	        	width:18%;
	        	margin-top:8px;
	        	margin-left:0;
	        }
	        .profile_div .follower{
	        	font-size:1.8vw;
	        	margin-top:15px;
	        	margin-left:0;
	        }
	        .profile_div .profile_message{
	        	font-size:2.5vw;
	        	margin-top:7px;
	        	float:none;
	        	display:block;
	        }
        	.follow .profile_img img{
	        	width:65%;
	        }
	        .follow .recent_product{
	        	width:90%;
	        	margin-left:8%;
	        	margin-top:2%;
        	}
        }
        
    </style>
</head>

<body class="mypage-post mypage-profile">
    <section class="post-top-section">
        <div class="profile">
            <img src="/img/default/default_profile.png" />
        </div>
        <div class="nickname">
            ${sessionScope.user_nickname}
        </div>
        <div class="sub-nav">
            <a id="writing-list" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="/img/default/writing_icon.png" />&nbsp;</a>
            <a id="like-list" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="/img/default/like_icon.png" />&nbsp;</a>
            <a id="setup" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="/img/default/setup_icon.png" />&nbsp;</a>
        </div>
    </section>
    
    	<input type="hidden" id="following_id" name="following_id" value="${sessionScope.user_nickname}"/>
    	<c:choose>
    		<c:when test="${fn:length(followList) == 0}">
    			<table>
    				<tr>
    					<td colspan="4" align="center">
    						조회결과가 없습니다.
    					</td>
    				</tr>
    			</table>
    		</c:when>
    		<c:otherwise>
    			<c:forEach var="followList" items="${followList}" varStatus="status">
    			<section class="follow">
			        <div class="profile_img">
			            <img src="/img/default/default_profile.png" />
			        </div>
			        <div class="profile_div">
				        <div class="follow_nickname">${followList.follow_id}</div>
				        <div class="follower_img">
				        	<img src="/img/default/follow_icon.png" />
				        </div>
				        <div class="follower"><span class="num">0</span><br>followers</div>
				        <div class="profile_message">message</div>
			        </div>
			        <div class="recent_product">
			        	<div class="imgBack"><a href="#"><img src="/img/follow/recent_product.jpg"/></a></div>
			        	<div class="imgBack"><a href="#"><img src="/img/follow/recent_product2.jpg" /></a></div>
			        	<div class="imgBack"><a href="#"><img src="/img/follow/recent_product3.jpg" /></a></div>
			        </div>
			        </section>
			    </c:forEach>
			</c:otherwise>
		</c:choose>
</body>

</html>
