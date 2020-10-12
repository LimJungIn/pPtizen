<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    	 <link rel="stylesheet" href="/css/common.css">
	    <link rel="stylesheet" href="/css/mypage_post.css">
	    <link rel="stylesheet" href="/css/mypage_setup.css">
	    <link rel="stylesheet" href="/css/mypage_modify_contacts.css">
	    <link rel="stylesheet" href="/css/bttn.css">
    	
    	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
  		<script type="text/javascript">
  		 $(document).ready(function(){
  			jQuery('#loginfail').css("visibility", "hidden");
  			$("#login").click(function(){
  				
  				 if($("#user_pw").val().trim() == "" &&$("#user_id").val().trim() == ""){
                  	alert("아이디/비밀번호를 입력하세요.");
                  	$("#user_id").focus();
                  	return false;
                  }
  				 if($("#user_id").val().trim() == ""){
                 	alert("아이디를 입력하세요.");
                 	$("#user_id").focus();
                 	return false;
                 }
  				 if($("#user_pw").val().trim() == ""){
                 	alert("비밀번호를 입력하세요.");
                 	$("#user_pw").focus();
                 	return false;
                 }
  				 
  				 
  				var objParams = {
  						user_id	: 	$("#user_id").val(),
         				user_pw	: 	$("#user_pw").val()
                };
  				
  				$.ajax({
         			url			:	"/login/login",
         			dataType	:	"json",
         			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
         			type 		:	"post",
         			data		:	objParams, user_id:$("#user_id").val(),
         			success 	:	function(retVal){

         				if(retVal.code == "OK") {
         					alert(retVal.message);
         					jQuery('#loginfail').css("visibility", "hidden");
         					
         					if($("#user_id").val().trim() == "admin"){
         						location.href = "/admin/member";
         					}else{
         						location.href = "/user/view/loading?user_id="+$("#user_id").val();
         					}
         					
         				} else {
         					jQuery('#loginfail').css("visibility", "visible"); 
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
		
			.menu-nickname {
			    /* padding: 4.5px; */
			    margin-top: 5px;
			    font-family: 'Francois One', sans-serif;
			    font-size:14px;
			}
			
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
                    <h2>로그인</h2>
                    <p class="contxt">로그인을 하시면 pPtizen의 다양한 서비스를 이용하실 수 있습니다.</p>
                </div>
                <form>
                    <table border="0">
                        <tbody>
                            <tr>
                                <th scope="row">아이디</th>
                            <td style="padding-bottom: 25px;">
								<input type="text"  style="margin-bottom: 0;" id="user_id" name="user_id"/>
                            </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호</th>
                            <td style="padding-bottom: 25px;">
                                <input type="password"  style="margin-bottom: 0;" id="user_pw" name="user_pw"/>
                                <br><span id="loginfail" style="color:red; font-size: 12px; margin-top: 5px; margin-bottom: 15px;">입력한 사용자 이름 또는 암호가 잘못되었으므로 다시 시도하세요.</span>
                            </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <p><a id ="login" name="login" class="bttn-jelly bttn-md bttn-primary">로그인</a><a class="bttn-jelly bttn-md bttn-primary">취소</a></p>
            </div>
        </div>
    </section>
</body></html>
