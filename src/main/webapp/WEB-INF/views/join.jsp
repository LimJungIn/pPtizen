<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 여기는 처음부터 수정하면 될거야 -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="stylesheet" href="/css/common.css">
	    <link rel="stylesheet" href="/css/mypage_post.css">
	    <link rel="stylesheet" href="/css/mypage_setup.css">
	    <link rel="stylesheet" href="/css/mypage_profile.css">
	    <link rel="stylesheet" href="/css/mypage_modify_contacts.css">
	    <link rel="stylesheet" href="/css/bttn.css">
	    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
  		<script type="text/javascript">
  		 $(document).ready(function(){
  			  
  				/*  아이디 중복 체크 버튼 */
  				$("#checkId").click(function(){
  				$.ajax({
         			url			:	"/join/checkId",
         			dataType	:	"json",
         			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
         			type 		:	"post",
         			data		:	 {user_id	: 	$("#user_id").val()},
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
  				
  				/* 닉네임 중복 체크 버튼 */
  				$("#checkNickname").click(function(){
  	  				$.ajax({
  	         			url			:	"/join/checkNickName",
  	         			dataType	:	"json",
  	         			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
  	         			type 		:	"post",
  	         			data		:	 {user_nickname	: 	$("#user_nickname").val()},
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
  				
  				/* 이메일 중복 체크 버튼 */
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
        	
  			$("#cancel").click(function(){
        		location.href = "/board/list";
        	});
        	
         	$("#join").click(function(){
         		 if($("#user_id").val().trim() == "" || $("#user_pw").val().trim() == "" || $("#user_name").val().trim() == ""
         			|| $("#user_birth").val().trim() == "" || $("#user_phonenum").val().trim() == "" || $("#user_job").val().trim() == "0"
         				|| $("#user_nickname").val().trim() == "" || $("#user_email").val().trim() == ""){
                 	alert("입력되지 않은 항목이 있습니다. 다시 한 번 확인해주세요.");
                 	
                 	return false;
                 }
            	
         		var objParams = {
         				 user_id	: 	$("#user_id").val(),
        				 user_pw	 :	$("#user_pw").val(),
        				 user_name	:	$("#user_name").val(),
        				 user_birth	:	$("#user_birth").val(),
        				 user_phonenum	:	$("#user_phonenum").val(),
        				 user_job	:	$("#user_job option:selected").val(),
        				 user_nickname	:	$("#user_nickname").val(),
        				 user_email	:	$("#user_email").val(),
        				 user_profile	:	$("#user_profile").val()
         	 	};
         		
         		$.ajax({
         			url			:	"/join/save",
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
        });

  		</script>
	    <style>
	        .bttn-bordered.bttn-xs {
	            padding: 4px 5px 4px 5px;
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
	            width: 70%;
	            border-radius: 10px;
	            margin: 50px 15%;
	            /* background-color: white; */
	            box-shadow: 0px 0px 20px rgba(0,0,0,0.1);
	        }
	
	        .post-content-section .column {
	            width: 100%;
	            border-radius: rebeccapurple;
	            flot: left;
	            /* margin: 0 15%; */
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
    <section class="post-content-section">
        <div class="column">
            <div class="column-group group1">
                <div class="column-header">
                    <h2>회원가입</h2>
                     <p class="contxt">중복 조회는 필수입니다.</p>
                </div>
                <table>
                    <tbody>
                        <tr>
                            <th scope="row">아이디</th>
                            <td>
                                <input type="text" id="user_id" name="user_id"/><a id="checkId" name="checkId" class="bttn-bordered bttn-xs bttn-primary">조회</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">비밀번호</th>
                            <td>
                                <input type="password" id="user_pw" name="user_pw"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">이름</th>
                            <td>
                                <input type="text" id="user_name" name="user_name" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">생년월일</th>
                            <td>
                                <input type="text"  id="user_birth" name="user_birth" placeholder="주민번호앞자리"  />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">전화번호</th>
                            <td>
                                <input type="text" id="user_phonenum" name="user_phonenum"   />
                            </td>
                        </tr>
                         <tr>
                            <th scope="row">직업</th>
                            <td>
                                <select name="user_job" id="user_job" style="width:22%;">
                                    <option value="0">직업을 선택해주세요.</option>
                                    <option value="초등학생">초등학생</option>
                                    <option value="중고등학생">중고등학생</option>
                                    <option value="대학생">대학생</option>
                                    <option value="직장인">직장인</option>
                                    <option value="교직원">교직원</option>
                                    <option value="기타">기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">닉네임</th>
                            <td>
                                <input type="text" id="user_nickname" name="user_nickname"  placeholder="8자리 이내로 입력"/> <a id="checkNickname" name="checkNickname" class="bttn-bordered bttn-xs bttn-primary">조회</a>
                            </td>
                        </tr>            
                        <tr>
                            <th scope="row">이메일</th>
                            <td>
                                <input type="text" id="user_email" name="user_email"  placeholder="account@pptizen.com"/> <a id="checkEmail" name="checkEmail" class="bttn-bordered bttn-xs bttn-primary">조회</a>
                            </td>
                        </tr>
                        <tr>
                        	<th scope="row">프로필 메시지</th>
                        	<td>
                        		<input type="text" id="user_profile" name="user_profile" placeholder="오늘은 누군가의 마음에 헤엄치고 싶구만" style="width:500px"/>
                        	</td>
                    </tbody>
                </table>
                <p><a class="bttn-jelly bttn-md bttn-primary" id="join" name="join">가입</a><a class="bttn-jelly bttn-md bttn-primary" id="cancel" name="cancel">취소</a></p>
            </div>
        </div>
    </section>
</body></html>