<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<html>
    <head>
    	<title>magazine</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   		 <!--무한스크롤 CSS -->
   		 <link rel="stylesheet" type="text/css" href="/css/community.css">
   		 <link rel="stylesheet" type="text/css" href="/css/common.css">
   		 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   		 <link rel="stylesheet" type="text/css" href="/css/guidebook.css">
   		 <link rel="stylesheet" type="text/css" href="/css/event.css">
   		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   		 <script src="<%=request.getContextPath()%>/js/community.js"></script>
   		 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
   		 <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   		 <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
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
            		
            		location.href = "/magazine/view?id="+$(this).attr("content_id");
            		
            	});
            	
            	$("#write").click(function(){
            		location.href = "/magazine/edit";
            	});
            	            	
            	$(document).on("click","button[name='page_move']",function(){
            		
                    var visiblePages = 9;//리스트 보여줄 페이지 10
                    
                    $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                    $('#visiblePages').val(visiblePages);
                    
                    $("#frmSearch").submit();
                    
            	});
            });
        </script>
        <style>
	         @import url("resources/css/common.css");
	
	        .container,
	        .navbar,
	        .navbar-header,
	        .navbar-nav {
	            float: left;
	            width: 100%;
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
	
	        background-color: white;
	
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
	                display: block;
	            }
	        }
	
	        .navbar-fixed-top {
	            position: static;
	            /*없으면 fixed 적용되는데 다른 컨텐츠 위로 위치해 가릴 수 있음*/
	        }
        </style>
    </head>
    <body>
    	<nav class="navbar navbar-default navbar-fixed-top">
		        <div class="container">
		            <div class="navbar-header">
		                <ul class="nav navbar-nav">
		                    <li class="dropdown">
		                        <a id="admin_member" name="admin_member" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원 관리</a>
		                    </li>
		                    <li class="dropdown">
		                        <a id="admin_board" name="admin_board" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">게시판 관리</a>
		                    </li>
		                    <li class="dropdown">
		                        <a id="admin_template" name="admin_template" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">템플릿 관리</a>
		                    </li>
		                    <li class="dropdown">
		                        <a id="admin_diyz" name="admin_diyz" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">DIYZ 관리</a>
		                    </li>
		                </ul>
		            </div>
		        </div>
		    </nav>
    	<nav class="navbar navbar-default navbar-fixed-top">
	        <div class="container">
	            <div class="navbar-header">
	                <ul class="nav navbar-nav">
	                    <li class="dropdown">
	                        <a id= "write" name="write" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"
	                        style = "color:#1d89ff;">새 글</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	    </nav>
       	<section class="s1">
       		<form class="form-inline" id="frmSearch" action="/magazine/list">
       			<input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	        	<input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	        	<div class="article-list">
	        		<c:choose>
	        			<c:when test="${fn:length(magazineList) == 0}">
	        				<table>
	        					<tr>
	        						<td colspan="4" align="center">
	        							조회결과가 없습니다.
	        						</td>
			            		</tr>
	        				</table>
			           	</c:when>
			           	<c:otherwise>
			            	<c:forEach var="magazineList" items="${magazineList}" varStatus="status">
						    	<div class="article-loop">
						    		<div class="article-list__template">
						    			<img class="article-list__template__image" src="https://picsum.photos/id/34/600"> <%--이미지 변환필요 --%>
						    			<p>view 200 like 9</p>
						    			<div class="title">
						    				<a name="subject" class="mouseOverHighlight" content_id="${magazineList.id}">${magazineList.subject}</a>
						    			</div>
						    			<div class="content">
						    				<!-- <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p> -->
						    				<p>
						    						<c:choose>
						    							<c:when test="${fn:length(magazineList.content) > 14}">
						    								<c:out value='${fn:substring(magazineList.content.replaceAll("\\\<.*?\\\>",""),0, 13)}' />..
						    							</c:when>
						    							<c:otherwise>
						    								<c:out value="${magazineList.subtitle}"/>
						    							</c:otherwise> 
						    						</c:choose>
						    				</p>
						    			</div>
						    		</div>
						    		<div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
						    		<div class="date">${magazineList.register_datetime}</div>
						    	</div>
						    </c:forEach>
			           	</c:otherwise>
	        		</c:choose>
	        	</div>
	        	<br>
	    		<div id="pagination"></div>
    	</form>
    </section>
	        <section class="lpopup-bottomside">
    </body>
</html>