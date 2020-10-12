<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<html>
    <head>
    	<title>게시판</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   		 <!--무한스크롤 CSS -->
   		 <link rel="stylesheet" href="/css/community.css">
   		 <link rel="stylesheet" href="/css/common.css">
   		 <link href="/css/bttn.css" rel="stylesheet">
   		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   		 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   		 <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
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
   		 <script type="text/javascript">
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
            		
            		if(totalPage>8){	//9
            			forEnd = 9;		//10
            		}else{
            			forEnd = totalPage;
            		}
            		
            	}else{
            		
            		if((startPage+4) > totalPage){
                		
            			forEnd = totalPage;
                		
                		if(forEnd>9){
                			forStart = forEnd-8 //9
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
            	
            	//하단 페이지 부분에 붙인다.
            	$("#pagination").append(pagination);
            	//--페이지 셋팅
            	
            	
            	$("a[name='subject']").click(function(){
            		location.href = "/board/view?id="+$(this).attr("content_id");
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
            	
            	$("#write").click(function(){
            		var check_writer = "${sessionScope.user_nickname}";
                    if(!check_writer){
                		alert("로그인을 해주세요.");
                	} else{
                		location.href = "/board/edit";
                	}
            	});
            	            	
            	$(document).on("click","button[name='page_move']",function(){
            		
                    var visiblePages = 9;//리스트 보여줄 페이지 10
                    
                    $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                    $('#visiblePages').val(visiblePages);
                    
                    $("#frmSearch").submit();
                    
            	});
            
				$("#search").keydown(function (key) {
            		var searchdata=document.getElementById("search");
                    if (key.keyCode == 13) { // 엔터키면 
	                    if($('#search').val()==""){
	                    	console.log("enter");
	                    	location.href = "/board/list" ;
	                    } else if($('#search').val().indexOf('#')==0){
	                    	var tagsearch = $('#search').val().substring(1,$('#search').val().length);
	                    	location.href = "/board/tagsearch?search="+tagsearch;
	                    } else{
	                    	location.href = "/board/search?search="+$('#search').val();
	                    }
                    } 
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
	
	        @media screen and (max-width:768px) {
	            .nav>li {
	            	float:left;
	                display: block;
	                width:50%;
	            }
	        }
	
	        .navbar-fixed-top {
	            position: static;
	            /*없으면 fixed 적용되는데 다른 컨텐츠 위로 위치해 가릴 수 있음*/
	        }
	        
	        /*검색창 Bootstrap3.0*/
	        .searchbox {
	        	clear:both;
			    width: 55%;
			    margin: 50px auto;
			}
	        .has-search .form-control-feedback {
			    right: initial;
			    left: 0;
			    color: #ccc;
			}
			
			.has-search .form-control {
			    padding-right: 12px;
			    padding-left: 34px;
			}
			.has-search .form-control, .form-inline .form-group{
				width:100%
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
       		<form class="form-inline" id="frmSearch"> <!-- action="/board/list" -->
       			<input type="hidden" id="sortList" name="sortList" value="">
       			<input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	        	<input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	        	<div class="article-list">
	        		<c:choose>
	        			<c:when test="${fn:length(boardList) == 0}">
	        				<table>
	        					<tr>
	        						<td colspan="4" align="center">
	        							조회결과가 없습니다.
	        						</td>
			            		</tr>
	        				</table>
			           	</c:when>
			           	<c:otherwise>
			            	<c:forEach var="boardList" items="${boardList}" varStatus="status">
						    	<div class="article-loop">
						    		<div class="article-list__template">
						    			<c:choose>
						    				<c:when test="${fn:containsIgnoreCase(boardList.content, '<img')}">
						    					<img class="article-list__template__image" src="${boardList.thumbnail}">
						    				</c:when>
						    				<c:otherwise>
						    					<img class="article-list__template__image" src="https://picsum.photos/id/34/600">
						    				</c:otherwise>
						    			</c:choose>
						    			<p>view ${boardList.read_count} like ${boardList.like_count}</p>
						    			<div class="title">
						    				<a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a>
						    			</div>
						    			<div class="content">
						    				<p>
						    					<c:choose>
						    						<c:when test="${fn:length(boardList.content) > 14}">
						    							<c:out value='${fn:substring(boardList.content.replaceAll("\\\<.*?\\\>",""),0, 13)}' />..
						    						</c:when>
						    						<c:otherwise>
						    							<c:out value='${fn:substring(boardList.content.replaceAll("\\\<.*?\\\>",""),0, 13)}' />
						    						</c:otherwise> 
						    					</c:choose>
						    				</p>
						    			</div>
						    		</div>
						    		<div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">${boardList.writer}</a></div>
						    		<div class="date">${boardList.register_datetime}</div>
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