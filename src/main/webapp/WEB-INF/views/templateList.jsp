<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Template</title>
	<!--무한스크롤 CSS -->
    <link rel="stylesheet" type="text/css" href="/css/template.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script>
   		 $(document).scroll(function() {
   			 if ($(document).scrollTop() > $(".navbar-fixed-top").position().top) {
   				 $(".navbar-fixed-top").css({
   					 position: "fixed",
   					 top: "0px",
   					 bottom: ""
   					 });
   			}
            //상단 헤더가 눈에 보일 때즘 상단 메뉴 붙박이 해제
            if ($(document).scrollTop() <= $(".navbar-fixed-top").outerHeight()) {
                $(".navbar-fixed-top").css({
                    position: "static",
                    top: "",
                    bottom: "0px"
                });
            }
        });
    </script>
    <script>
        if (document.location.search.match(/type=embed/gi)) {
            window.parent.postMessage("resize", "*");
        }
        
        var sortCheck;
        
        $(document).ready(function(){
        	
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
        		
        		if(totalPage>11){	//9
        			forEnd = 12;		//10
        		}else{
        			forEnd = totalPage;
        		}
        		
        	}else{
        		
        		if((startPage+4) > totalPage){
            		
        			forEnd = totalPage;
            		
            		if(forEnd>11){
            			forStart = forEnd-11 //9
            		}
            		
            	}else{
            		forEnd = startPage+4;
            	}
        	}
        	//--페이지네이션에 항상 10개가 보이도록 조절
        	
        	//전체 페이지 수를 받아 돌린다.
        	for(var i = forStart ; i<= forEnd ; i++){
        		if(startPage == i){
        			pagination += ' <button name="page_move" style="color:#1d89ff;" start_page="'+i+'" disabled>'+i+'</button>';
        		}else{
        			pagination += ' <button name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
        		}
        	}
        	
        	$("#pagination").append(pagination);
        	
        	$(".article-list__template").click(function(){
        		location.href = "/template/view?id="+$(this).attr("content_id");
        	});
        	
        	//정렬
    		var sortListCheck = "${listCheck}";
    		$("#sortList").val(sortListCheck);
    		var active = $(".sort[data-list="+ sortListCheck + "]");
    		
    		active.addClass("active");
    		
        	$(".sort").click(function(){
        		$(".sort").removeClass("active");
        		$(".sort").css("font-weight", "normal");
        		$(".sort").css("color", "#777");
        		$(this).addClass("active");
        		$("#sortList").val($(".active").data("list"));
        		
        		$("#frmSearch").submit();
        	});
        	
        	//글 작성
        	$("#write").click(function(){
        		var check_writer = "${sessionScope.user_id}";
                if(!check_writer){
            		alert("로그인을 해주세요.");
            	} else{
            		location.href = "/template/edit";
            	}
        	});
        	
        	$(document).on("click","button[name='page_move']",function(){
                var visiblePages = 12;//리스트 보여줄 페이지 10
                
                /* $("#sortCheck").val($(".active").data("list"));*/
                $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                $('#visiblePages').val(visiblePages);
                
                $("#frmSearch").submit();
                
        	});
        
			$("#search").keydown(function (key) {
        		var searchdata=document.getElementById("search");
                if (key.keyCode == 13) { // 엔터키면 
                    if($('#search').val()==""){
                    	console.log("enter");
                    	location.href = "/template/list" ;
                    } else if($('#search').val().indexOf('#')==0){
                    	var tagsearch = $('#search').val().substring(1,$('#search').val().length);
                    	location.href = "/template/tagsearch?search="+tagsearch;
                    } else{
                    	location.href = "/template/search?search="+$('#search').val();
                    }
                } 
            });
        });
    </script>
   	 <style>
	         @import url("/css/common.css");
		
			.menu-nickname {
			    /* padding: 4.5px; */
			    margin-top: 5px;
			    font-family: 'Francois One', sans-serif;
			    font-size:14px;
			}
			
	        .container,
	        .navbar,
	        .navbar-header,
	        .navbar-nav {
	            height: auto;
	        }
	
	        .container>.navbar-header,
	        .navbar {
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
	        
	        .navbar-default .navbar-brand, .dropdown-content a:hover, #navbar>ul>li>a {
          		padding: 0px 15px 0px 15px;
      		}
      		
      		.navbar-brand>img {
      			margin-top: 6px;
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
	
	        .nav>li {
	            float: none;
	            position: relative;
	            display: inline-block;
	        }
	
	        .navbar-fixed-top {
	            position: static;
	            /*없으면 fixed 적용되는데 다른 컨텐츠 위로 위치해 가릴 수 있음*/
	        }
    </style>
    <script>
      $( document ).ready( function() {
        var jbOffset = $( '.align-navbar' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top + 50 ) {
            $( '.align-navbar' ).addClass( 'align-navbar-fixed' );
          }
          else {
            $( '.align-navbar' ).removeClass( 'align-navbar-fixed' );
          }
        });
      } );
    </script>
</head>
<body>
	<div class="align-navbar">
		<div class="align-navbar-container">
			<div class="align-navbar-header">
				<ul class="align-navbar-nav">
					<li class="btnWrap">
						<a data-list="latestList" class="sort">최신순</a>
					</li>
					<li class="btnWrap">
						<a data-list="viewList" class="sort">인기순</a>
					</li>
					<li class="btnWrap">
						<a data-list="likeList" class="sort">LIKE순</a>
					</li>
					<li class="btnWrap">
						<a id= "write" name="write" style = "color:#1d89ff;">새 글</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<section class="s1">
	<form class="form-inline" id="frmSearch">
		<input type="hidden" id="sortList" name="sortList" value="">
		<input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	    <input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
		<div class="article-list" id="article-list">
	        	<c:choose>
	        		<c:when test="${fn:length(templateList) == 0}">
	        			<table>
	        				<tr>
	        					<td colspan="4" align="center">
	        						조회결과가 없습니다.
	        					</td>
	        				</tr>
	        			</table>
	        		</c:when>
	        		<c:otherwise>
	        			<c:forEach var="templateList" items="${templateList}" varStatus="status">
	        				<div class="article-loop">
	        					<article class="article-list__item">
	        						<div class="article-list__template" content_id="${templateList.id}">
		        						<!-- <img class="article-list__template__image" src="https://picsum.photos/id/27/500"> -->
		        						<img src="${templateList.file1}" class="article-list__template__image">
		        						<p>view ${templateList.read_count} like ${templateList.like_count}</p>
		        						<%-- <p><a name="subject" class="mouseOverHighlight">${templateList.subject}</a></p> --%>
	        						</div>
	        						<div class="article-list__user">
	        							<img class="article-list__user__image" src="http://api.adorable.io/avatars/250/8566768890215977">
	        							<a href="#">${templateList.writer}</a>
	        						</div>
	        					</article>
	        				</div>
	        			</c:forEach>
	        		</c:otherwise>
	        	</c:choose>
	        </div>
	        <br>
	        <div id="pagination"></div>
	   </form>
	   		<div class="searchbox">
		    		<div class="form-group has-feedback has-search">
					    <span class="glyphicon glyphicon-search form-control-feedback"></span>
					    <input type="text" class="form-control" id="search" placeholder="Search">
				  	</div>
			 </div>
    </section>
    	<section class="lpopup-bottomside">
</body>
</html>