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
	
	<style>
		.dropbtn{
		   margin:10px 0px 0px 10px;
		   float:right;
		   padding: 3px 25px;
		   font-weight: bold;
		   font-size: 16px;
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
		#evboard td {
			font-size: 15px;
		}
		.gs2left{
			height: 50px;
		}
		.gs2left>div{
			margin-top: 20px;
		}
		.gs2right>div {
			margin-bottom: 0;
		}
		table img {
			max-width: 400px;
    		max-height: 400px;
		}
		.navbar-right {
			display: none;
		}
	</style>
	
  	<script type="text/javascript">
  	
	  	function readURL(input) {
	  		if (input.files && input.files[0]) {
	  			var reader = new FileReader();
	  			reader.onload = function (e) {
	  				$("td > img").attr('src', e.target.result);
	  				$(".check").val("yes");
	  			}
	  			reader.readAsDataURL(input.files[0]);
	  		}
		}
	  	
	  	function selectData(type, data) {
	  		if(data!=""){
	  			var splitData = data.split(",");
		  		for(var i in splitData){
		  			$("input[name=" + type + "][value=" + splitData[i] + "]").attr("checked", true);
		  		}
	  		}
	  	}
  		
  		$(document).ready(function(){
  			var imgSrc = $("td > img").attr("src");
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
  			
  			var kind = $("input[name=serverKinds]").val();
  			$("select[name=kinds]").val(kind).prop("selected", true);
  			
  			var dataType = $(".serverData").data("tag");
  			selectData("color", $(".serverData[data-tag=color]").val());
  			selectData("layout", $(".serverData[data-tag=layout]").val());
  			selectData("theme", $(".serverData[data-tag=theme]").val());
  			
  			
  			$("#imgInput").change(function(){
  	  		    readURL(this);
  	  		});
  			
			$("#input").click(function(){
				if($("td > img").attr("src")==""){
					alert("이미지를 첨부해주세요.");
					return;
				}
				if($("select[name=kinds]").val()=="") {
					alert("종류를 선택해주세요.");
					return;
				}
				
				var colors = [];
				var layouts = [];
				var themes = [];
				
				$("input[name=color]").each(function() {
					if($(this).is(":checked"))
						colors.push($(this).val());
				});
				$("#color_data").val(colors);
				
				$("input[name=layout]").each(function() {
					if($(this).is(":checked"))
						layouts.push($(this).val());
				});
				$("#layout_data").val(layouts);
				
				$("input[name=theme]").each(function() {
					if($(this).is(":checked"))
						themes.push($(this).val());
				});
				$("#theme_data").val(themes);
				
				var formData = new FormData($("#imgUploadForm")[0]);
				
        		//ajax 호출
        		$.ajax({
        			type 		:	"post",
        			url			:	"/admin/diyz/save",
        			data		:	formData,
        			processData :	false,
        			contentType :	false,
        			success 	:	function(retVal){
        					location.href = "/admin/diyz";	
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
                  <span class="gstitle">DIYZ 이미지 등록</span>
               </div>
            </div>
         </div>
         <div class="gs2right">
            <div>
            	<form method="post" enctype="multipart/form-data" id="imgUploadForm">
            		<input type="hidden" id="img_id" name="img_id" value="${diyzView.img_id}" />
	                <table id="evboard" cellpadding="5" align="center">
	                   <tr height="50px">
	                   		<th colspan="2" width="200px">종류</th>
	                   		<td colspan="2">
	                   			<input type="hidden" name="serverKinds" value="${diyzView.kinds}" />
	                   			<select name="kinds">
	                   				<option value="">--종류--</option>
	                   				<option value="pictogram">픽토그램</option>
	                   				<option value="diagram">도형</option>
	                   				<option value="picture">사진</option>
	                   				<option value="background_img">배경</option>
	                   			</select>
	                   		</td>
	                   </tr>
	                    <tr height="50px">
	                   		<th rowspan="3">태그</th>
	                   		<th>color</th>
	                   		<td colspan="2">
	                   			<input type="hidden" class="serverData" value="${diyzView.tag1}" data-tag="color" />
	                   			<input type="checkbox" name="color" value="Vivid"/>비비드&ensp;
	                   			<input type="checkbox" name="color" value="Pastel"/>파스텔&ensp;
	                   			<input type="checkbox" name="color" value="Gradient" />그라디언트&ensp;
	                   			<input type="checkbox" name="color" value="Vintage"/>빈티지&ensp;
	                   			<input type="checkbox" name="color" value="Nature"/>내추럴&ensp;
	                   			<input type="checkbox" name="color" value="BlackWhite"/>블랙&amp;화이트&ensp;
	                   			<input type="hidden" id="color_data" name="color_data" value="" />
	                   		</td>
	                   </tr>
	                   <tr height="50px">
	                   		<th>layout</th>
	                   		<td colspan="2">
	                   			<input type="hidden" class="serverData" value="${diyzView.tag2}" data-tag="layout" />
	                   			<input type="checkbox" name="layout" value="title_cover"/>표지&ensp;
	                   			<input type="checkbox" name="layout" value="title1_content1"/>제목 및 내용&ensp;
	                   			<input type="checkbox" name="layout" value="title1_caption1"/>캡션 있는 콘텐츠&ensp;
	                   			<input type="checkbox" name="layout" value="title1_content2"/>제목 및 세부 텍스트&ensp;
	                   			<input type="hidden" id="layout_data" name="layout_data" value="" />
	                   		</td>
	                   </tr>
	                   <tr height="50px">
	                   		<th>theme</th>
	                   		<td colspan="2">
	                   			<input type="hidden" class="serverData" value="${diyzView.tag3}" data-tag="theme" />
	                   			<input type="checkbox" name="theme" value="HealthBeauty"/>건강과 미용&ensp;
	                   			<input type="checkbox" name="theme" value="FoodDrink"/>음식과 음료&ensp;
	                   			<input type="checkbox" name="theme" value="ArtMedia"/>예술과 미디어&ensp;
	                   			<input type="checkbox" name="theme" value="Sports"/>운동&ensp;
	                   			<input type="checkbox" name="theme" value="Tech"/>기술&ensp;
	                   			<input type="checkbox" name="theme" value="Job"/>직업&ensp;
	                   			<input type="checkbox" name="theme" value="Person"/>인물&ensp;
	                   			<input type="checkbox" name="theme" value="Children"/>어린이&ensp;
	                   			<input type="checkbox" name="theme" value="Leisure"/>여가&ensp;
	                   			<input type="checkbox" name="theme" value="Nature"/>자연&ensp;
	                   			<input type="checkbox" name="theme" value="Animal"/>동물&ensp;
	                   			<input type="checkbox" name="theme" value="Weather"/>날씨&ensp;
	                   			<input type="hidden" id="theme_data" name="theme_data" value="" />
	                   		</td>
	                   </tr>
	                   <tr height="600px">
	                   		<th colspan="2">이미지</th>
	                   		<td>
	                   			<input type="hidden" class="check" name="check" value="no"/>
	                   			<input id="imgInput" type="file" name="imgUp"/>
	                   		</td>
	                   		<td>
	                   			<input type="hidden" class="serverImg" name="imgSrc" value="${diyzView.img_path}"/>
	                   			<img src="${diyzView.img_path}">
	                   		</td>
	                   </tr>
	                </table>
	                <input class="dropbtn" id="input" type="submit" name="inputbtn" value="등록"></input>
                </form>
            </div>
         </div>
      </article>
   </section> 
</body>
</html>