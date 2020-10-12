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
	<title>Insert title here</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   	<link rel="stylesheet" type="text/css" href="/css/guidebook.css">
   	<link rel="stylesheet" type="text/css" href="/css/event.css">
   	<link rel="stylesheet" type="text/css" href="/css/community.css">
   	<link rel="stylesheet" type="text/css" href="/css/common.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function(){
  			  
  			$("#admin_member").click(function(){
        		location.href = "/admin/member";
        	});
  			$("#admin_board").click(function(){
        		location.href = "/admin/board";
        	});
  			$("#admin_template").click(function(){
        		location.href = "/admin/template";
        	});
  			$("#admin_diyz").click(function(){
        		location.href = "/admin/diyz";
        	});
  			
			$("#dropbtn").click(function(){
				var id="";
				var drop =[];
				
				 $("input[name=check]:checked").each(function(i){  
		            drop.push($(this).val());
		          });
				
				if(drop.length==0){
					alert("삭제할 항목을 선택해주세요.")
				}else{
					if(confirm("정말 삭제하시겠습니까?") == true){
						$.ajax({
	  						type:"POST",
	  						url: "/admin/board/delete",
	  						data:{"drop": drop},
	  						success:function pageReload(){
	  							location.href = "/admin/board";
	  						},
	  						 error:function(request,status,error){
	 	                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	                	}
	  					});
						drop = new Array();
						id="";
					}
					else{location.reload(true);}
			}
  		});  
  	});
</script>
<style>
	.dropbtn{
	   margin:10px 0px 0px 10px;
	   float:right;
	}
	.container, .navbar, .navbar-header, .navbar-nav {
		height: auto;
	}
	.container>.navbar-header, .navbar {
		margin: 0;
	}
	.navbar-nav {
		text-align: center;
	    margin: 0 auto;
		font-family: 'Francois One', sans-serif;
		font-size: 14px;
	}
	body {
		font-family: none;
		color: black;
	}
	.navbar-default {
		background-color: white;
	}
	.navbar-default .navbar-brand {
		color: black;
	}
	.navbar-default .navbar-nav>.open>a,
	.navbar-default .navbar-nav>.open>a:focus,
	.navbar-default .navbar-nav>.open>a:hover {
		background-color: white;
	}
	.dropdown-menu>li>a {
		font-family: 'Francois One', sans-serif;
	}
	#navbar>ul>li>a,
	.dropdown-menu>li>a:hover {
		color: black;
	}
	
	.navbar-default .navbar-brand, .dropdown-content a:hover, #navbar>ul>li>a {
		padding: 0px 15px 0px 15px;
	}
	 .navbar-brand>img {
          margin-top: 6px;
      }
      		
	.nav>li {
		float: none;
		position: relative;
		display: inline-block;
	}
	@media screen and (max-width:768px) {
		.nav>li {
			display: block;
		}
	}
	.navbar-fixed-top {
		position: static;
	}
	.navbar-right {
		display: none;
	}
</style>
</head>
<body>
	<div class="admin-navbar">
		<div class="admin-navbar-container">
			<div class="admin-navbar-header">
				<ul class="admin-navbar-nav">
					<li class="btnWrap">
						<a id="admin_member" name="admin_member">회원 관리</a>
					</li>
					<li class="btnWrap">
						<a id="admin_board" name="admin_board">게시판 관리</a>
					</li>
					<li class="btnWrap">
						<a id="admin_template" name="admin_template">템플릿 관리</a>
					</li>
					<li class="btnWrap">
						<a id="admin_diyz" name="admin_diyz">DIYZ 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<section id="gs2">
      <article>
         <div class="gs2left">
            <div>
               <div>
                  <span class="gstitle">게시판 관리</span>
               </div>
            </div>
         </div>
         <div class="gs2right">
            <div>
                <table id="evboard" cellpadding="5" align="center">
                   <thead>
                      <th width="3%"></th>
                      <th width="20%">글 아이디</th>
                      <th width="20%">글 제목</th>
                      <th width="28.5%">글 내용</th>
                      <th width="24.25%">등록 날짜</th>
                   </thead>
                <c:forEach var="boardList" items="${boardList}"> 
                 <input type="hidden" id="id" name="id" value="${boardList.id}" />
                   <tr>
                   <td><input type="checkbox" class="check" id="check" name="check" value="${boardList.id}" /></td>
                   <td>${boardList.id}</td>
                   <td>${boardList.subject}</td>
                   <td>${boardList.content}</td>
                   <td>${boardList.register_datetime}</td> 
                   </tr>   
              </c:forEach>       
                </table>
                <input class="dropbtn" id="dropbtn" type="submit" name="dropbtn"  value="게시글 삭제"></input>
            </div>
         </div>
      </article>
   </section> 
</body>
</html>