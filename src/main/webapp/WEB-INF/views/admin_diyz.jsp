<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  			$("#input").click(function(){ 
            	location.href = "/admin/diyz/edit";
        	});
  			
			$(".link").find("td").not($('.ckBox')).click(function(){
				var id = $(this).siblings(".ckBox").find(".check").val();
        		location.href = "/admin/diyz/edit?img_id="+ id;
        	});
			
			
			$("#dropbtn").click(function(){
				var img_id="";
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
	  						url: "/admin/diyz/delete",
	  						data:{"drop": drop},
	  						success:function pageReload(){
	  							location.href = "/admin/diyz";
	  						},
	  						 error:function(request,status,error){
	 	                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	                	}
	  					});
						drop = new Array();
						img_id="";
					}
					else{location.reload(true);}
			}
  		});  
			
			//--페이지 셋팅
        	var totalPage = ${totalPage}; //전체 페이지
        	var startPage = ${startPage}; //현재 페이지
        	
        	var pagination = "";
        	
        	//--페이지네이션에 항상 10개가 보이도록 조절
        	var forStart = 0;
        	var forEnd = 0;
        	
        	if((startPage-5) < 1){
        		forStart = 1;
        	}else{
        		forStart = startPage-5;
        	}
        	
        	if(forStart == 1){
        		
        		if(totalPage>9){	//9
        			forEnd = 10;		//10
        		}else{
        			forEnd = totalPage;
        		}
        		
        	}else{
        		
        		if((startPage+4) > totalPage){
            		
        			forEnd = totalPage;
            		
            		if(forEnd>11){
            			forStart = forEnd-9 //9
            		}
            		
            	}else{
            		forEnd = startPage+4;
            	}
        	}
        	
        	for(var i = forStart ; i<= forEnd ; i++){
        		if(startPage == i){
        			pagination += ' <button name="page_move" style="color:#1d89ff;" start_page="'+i+'" disabled>'+i+'</button>';
        		}else{
        			pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
        		}
        	}
        	
        	$("#pagination").append(pagination);
        	
        	$(document).on("click","button[name='page_move']",function(){
                var visiblePages = 10;
                
                $('#startPage').val($(this).attr("start_page"));
                $('#visiblePages').val(visiblePages);
                
                $("#frmSearch").submit();
                
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
	.link {
		cursor: pointer;
	}
	.ckBox {
		cursor: default;
	}
	#pagination {
		text-align: center;
		clear: both;
	}
	.gs2right>div {
	    margin: 30px 30px 50px 30px;
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
	<form class="form-inline" id="frmSearch">
		<input type="hidden" id="startPage" name="startPage" value="">
	    <input type="hidden" id="visiblePages" name="visiblePages" value="">
		<article>
	         <div class="gs2left">
	            <div>
	               <div>
	                  <span class="gstitle">DIYZ 관리</span>
	               </div>
	            </div>
	         </div>
	         <div class="gs2right">
	            <div>
	                <table id="evboard" cellpadding="5" align="center">
	                   <thead>
	                   		<th width="3%"></th>
	                   		<th width="15%">종류</th>
	                   		<th width="30%">이미지</th>
	                   		<th width="28.5%">태그</th>
	                   </thead>
	                   <c:choose>
	                   		<c:when test="${fn:length(diyzList) == 0}">
			        			<table>
			        				<tr>
			        					<td colspan="4" align="center">
			        						조회결과가 없습니다.
			        					</td>
			        				</tr>
			        			</table>
	        				</c:when>
	        				<c:otherwise>
		                   		<c:forEach var="diyzList" items="${diyzList}">
				                   <tr class="link">
				         		  		<td class="ckBox"><input type="checkbox" class="check" id="check" name="check" value="${diyzList.img_id}" /></td>
					                   <td>${diyzList.kinds}</td>
					                   <td><img width=250px height=150px style="padding: 10px 0;" src="${diyzList.img_path}"></td>
					                   <td style="text-align: left; padding-left:25px;">
					                   		color&ensp; :&ensp;${diyzList.tag1}<br>
					                   		layout&ensp;: ${diyzList.tag2}<br>
					                   		theme&ensp;: ${diyzList.tag3}
					                   </td>
				                   </tr>
		              			</c:forEach>
	                   		</c:otherwise>
	                   </c:choose>
	                </table>
	                <input class="dropbtn" id="input" type="button" name="inputbtn"  value="등록"></input>
	                <input class="dropbtn" id="dropbtn" type="button" name="dropbtn"  value="삭제"></input>
	            </div>
	         </div>
		</article>
		<div id="pagination"></div>
		<br><br>
	</form>
   </section> 
</body>
</html>