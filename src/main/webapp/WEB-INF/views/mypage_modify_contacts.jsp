<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/common.css">
	<link rel="stylesheet" href="/css/mypage_post.css">
	<link rel="stylesheet" href="/css/mypage_setup.css">
	<link rel="stylesheet" href="/css/mypage_modify_contacts.css">
	<link rel="stylesheet" href="/css/bttn.css">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){

  			$("#withdraw").click(function(){
  			
  				var objParams = {
  						user_id	: 		$("#user_id").val()	
                }; 
  				
 				$.ajax({
        			url			:	"/user/view/withdraw",
        			dataType	:	"json",
        			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
        			type 		:	"post",
        			data		:	objParams,
        			success 	:	function(retVal){
        				if(retVal.code == "OK") {
        						location.href = "/login";
		        				alert(retVal.message);	
        				} else {
        						alert(retVal.message);		
        				}
        			},
        			error		:	function(request, status, error){
        				console.log("AJAX_ERROR");
        			} 
				});
        	});
  			
  			$("#checkEmail").click(function(){
  				$.ajax({
         			url			:	"/join/checkEmail",
         			dataType	:	"json",
         			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
         			type 		:	"post",
         			data		:	 {
         				user_email	: 	$("#user_email").val()
         			},
         			success 	:	function(retVal){

         				if(retVal.code == "OK") {
         					alert(retVal.message);
         				
         				} else {
         					alert(retVal.message);
         				}
         				
         			},
         				error		:	function(request, status, error){
         				console.log("AJAX_ERROR");
         			} 
         			
					  });
				
         		});
  			
  			
  		//여기부터 내 정보 수정 최종 수정본 --> $("#profile_change")까지 포함해서 수정 필요
		$("#email_change").click(function(){
			if($("#user_email").val().trim() == ""){
             	alert("입력되지 않았습니다. 다시 한 번 확인해주세요.");
             	
             	return false;
             }
        	
     		var objParams = {
     				 user_id	: 	$("#user_id").val(),
     				 user_email	: 	$("#user_email").val()
     	 	};
			$.ajax({
				url			:	"/user/email/update",
     			dataType	:	"json",
     			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
     			type 		:	"post",
     			async       :   false,
     			data		:	objParams,
     			success 	:	function(retVal){

     				if(retVal.code == "OK") {
     					alert(retVal.message);
     					
     				} else {
     					alert(retVal.message);
     				}
     				
     			},
     				error		:	function(request, status, error){
     				console.log("AJAX_ERROR");
     			}
			});
		});
		$("#phonenum_change").click(function(){
			if($("#user_phonenum").val().trim() == ""){
             	alert("입력되지 않았습니다. 다시 한 번 확인해주세요.");
             	
             	return false;
             }
			var objParams = {
    				 user_id	: 	$("#user_id").val(),
    				 user_phonenum	: 	$("#user_phonenum").val()
    	 	};
			$.ajax({
				url			:	"/user/phonenum/update",
    			dataType	:	"json",
    			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
    			type 		:	"post",
    			async       :   false,
    			data		:	objParams,
    			success 	:	function(retVal){

    				if(retVal.code == "OK") {
    					alert(retVal.message);
    					
    				} else {
    					alert(retVal.message);
    				}
    				
    			},
    				error		:	function(request, status, error){
    				console.log("AJAX_ERROR");
    			}
			});
		});
		$("#job_change").click(function(){
			if($("#user_job").val().trim() == "0"){
             	alert("입력되지 않았습니다. 다시 한 번 확인해주세요.");
             	
             	return false;
             }
			var objParams = {
    				 user_id	: 	$("#user_id").val(),
    				 user_job	:	$("#user_job option:selected").val()
    	 	};
			$.ajax({
				url			:	"/user/job/update",
    			dataType	:	"json",
    			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
    			type 		:	"post",
    			async       :   false,
    			data		:	objParams,
    			success 	:	function(retVal){

    				if(retVal.code == "OK") {
    					alert(retVal.message);
    					
    				} else {
    					alert(retVal.message);
    				}
    				
    			},
    				error		:	function(request, status, error){
    				console.log("AJAX_ERROR");
    			}
			});
		});
		$("#profile_change").click(function(){
			if($("#user_profile").val().trim() == ""){
             	alert("입력되지 않았습니다. 다시 한 번 확인해주세요.");
             	
             	return false;
             }
			var objParams = {
    				 user_id	: 	$("#user_id").val(),
    				 user_profile	: 	$("#user_profile").val()
    	 	};
			$.ajax({
				url			:	"/user/profile/update",
    			dataType	:	"json",
    			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
    			type 		:	"post",
    			async       :   false,
    			data		:	objParams,
    			success 	:	function(retVal){

    				if(retVal.code == "OK") {
    					alert(retVal.message);
    					
    				} else {
    					alert(retVal.message);
    				}
    				
    			},
    				error		:	function(request, status, error){
    				console.log("AJAX_ERROR");
    			}
			});
		});
  			
  			$("#cancel").click(function(){
        		location.href = "/board/list"; //나중에 내가 했던 마지막 페이지로 이동 수정 필요
        	});
    	});
    </script>
    <style>
        .bttn-bordered.bttn-xs {
            padding: 10px 5px 8px 5px;
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
            margin: 0 15%;
        }

        @media only screen and (max-width: 629px) {
            .post-content-section .column {
                float: none;
                width: 100%;
                margin: 0;
            }
        }
    </style>
</head>
<body class="mypage-post mypage-profile">
    <section class="post-top-section">
    	<div class="sub-nav">
            <a id="writing-list" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="/img/default/writing_icon.png" />&nbsp;</a>
            <a id="like-list" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="/img/default/like_icon.png" />&nbsp;</a>
            <a id="setup" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="/img/default/setup_icon.png" />&nbsp;</a>
        </div>
        <div class="profile">
            <img src="/img/default/default_profile.png" />
        </div>
        <div class="nickname">
              	${userView.user_nickname}
        </div>
        <input type="hidden" id="user_id" name="user_id" value="${sessionScope.user_id}" />
        <input type="hidden" id="userId" name="userId" value="${userList.user_id}" />
       
    </section>
    <section class="post-content-section">
        <div class="column">
            <div class="column-group group1">
                <div class="column-header">
                    <h2>연락처 수정</h2>
                    <p class="contxt">pPtizen의 대표 프로필과 별명을 수정 하실 수 있습니다.</p>
                </div>
                <form>
                    <table border="0">
                        <tbody>
                            <tr>
                                <th scope="row">이메일</th>
                                <td>
                                    <p>
                                        ${userView.user_email}<br>
                                        <span style="color:#555555; font-size: 12px; margin-top: 5px;">현재 pPtizen 계정의 이메일 주소입니다.</span>
                                    </p>
                                    변경할 이메일<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 이메일 주소를 입력하세요.(예 : abc@naver.com)</span><br>
                                    <input type="text" id="user_email" name="user_email"  placeholder="account@pptizen.com"/> <a id="checkEmail" name="checkEmail" class="bttn-bordered bttn-sm bttn-primary">조회</a>
                                    <a class="bttn-bordered bttn-sm bttn-primary" id="email_change" name="email_change">수정</a><p class="contxt" style="color:blue">중복 조회는 필수입니다.</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대전화</th>
                                <td>
                                    <p>
                                        ${userView.user_phonenum}<br>
                                        <span style="color:#555555; font-size: 12px; margin-top: 5px;">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료 결제 등 pPtizen로부터 알림을 받을 때 사용할 휴대전화입니다.</span>
                                    </p>
                                    변경할 전화번호<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 전화 번호를 입력하세요.(예 : 01012345678)</span><br>
                                    <input type="text" id="user_phonenum" name="user_phonenum" placeholder="01012345678" />
                                    <a id="phonenum_change" name="phonenum_change" class="bttn-bordered bttn-sm bttn-primary">수정</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">직업</th>
                                <td>
                                    <p>
                                        현재 직업은  ${userView.user_job}입니다.<br>
                                    </p>
                                    변경할 직업<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 직업을 선택하세요.</span><br>
                                    <select name="user_job" id="user_job" style="width:22%;">
	                                    <option value="0">직업을 선택해주세요.</option>
	                                    <option value="초등학생">초등학생</option>
	                                    <option value="중고등학생">중고등학생</option>
	                                    <option value="대학생">대학생</option>
	                                    <option value="직장인">직장인</option>
	                                    <option value="교직원">교직원</option>
	                                    <option value="기타">기타</option>
                                	</select>
                                    <a id="job_change" name="job_change" class="bttn-bordered bttn-sm bttn-primary">수정</a>
                                </td>
                            </tr>
                            <!-- 여기를 추가하기는 했는데 위에 아마  수정 필요한 것들도 바꿔야 하면 다 바꾸는게 나을 거야 -->
                            <tr>
                                <th scope="row">프로필 메시지</th>
                                <td>
                                    <p>
                                        ${userView.user_profile}<br>
                                        <span style="color:#555555; font-size: 12px; margin-top: 5px;">본인의 프로필에 쓰고 싶은 말을 적으세요.</span>
                                    </p>변경할 프로필 메시지<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 프로필 메시지를 입력하세요.(예 : 오늘은 누군가의 마음에 헤엄치고 싶구만)</span><br>
                                   <input type="text" id="user_profile" name="user_profile" placeholder="오늘은 누군가의 마음에 헤엄치고 싶구만" style="width:500px"/>
                                    <a id="profile_change" name="profile_change" class="bttn-bordered bttn-sm bttn-primary">수정</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">회원탈퇴</th>
                                <td>
                                  	  탈퇴를 원하시면 하단의 버튼을 눌러주세요.<br>
                                    <span style="color:red; font-size: 12px; margin-top: 5px;">회원 탈퇴 처리는 최대 1~3일이 소요될 수 있습니다.</span><br>
                                    <a id="withdraw" name="withdraw" class="bttn-bordered bttn-sm bttn-primary" style="float:left; margin:20px 0px 20px 85px;">탈퇴 신청</a>
                                   
                              
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <p><a class="bttn-jelly bttn-md bttn-primary">취소</a></p>
            </div>
        </div>
    </section>
</body></html>
