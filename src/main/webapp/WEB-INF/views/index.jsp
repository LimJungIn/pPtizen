<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Bangers&display=swap" rel="stylesheet">
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
	<link href="/css/common.css" rel="stylesheet">
	<link href="/css/index.css" rel="stylesheet">
	<script>
        function openPage(pageName, elmnt) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablink");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
                tablinks[i].style.border = "solid 1px transparent";
                tablinks[i].style.borderBottom = "none";
                tablinks[i].style.color = "white";
            }
            document.getElementById(pageName).style.display = "block";
            elmnt.style.backgroundColor = "white";
            elmnt.style.border = "solid 1px #d7d7d7";
            elmnt.style.borderBottom = "none";
            elmnt.style.color = "black";
        }
        
        function opentab(pageName, elmnt) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("hashcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("hash_1");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].style.backgroundColor = "";
                tablinks[i].style.fontWeight = "normal";
                tablinks[i].style.border = "solid 1px #91adcc";
                tablinks[i].style.borderBottom = "none";
            }
            document.getElementById(pageName).style.display = "block";
            document.getElementById(pageName).style.backgroundColor = "#e9eff7";
            elmnt.style.backgroundColor = "#e9eff7";
            elmnt.style.fontWeight = "bold";
            elmnt.style.border = "solid 1px #e9eff7";
        }
        
        $(document).ready(function() {
            $("#defaultOpen").click();
            $("#tabDefaultOpen").click();
            
            $("a[name='board_subject']").click(function(){
        		location.href = "/board/view?id="+$(this).attr("content_id");
        	});
            
            $("a[name='template_subject']").click(function(){
        		location.href = "/template/view?id="+$(this).attr("content_id");
        	});
            
            $(".article-list__template__image").click(function(){
        		location.href = "/template/view?id="+$(this).attr("content_id");
        	});
            $("a[name='subject']").click(function(){
        		location.href = "/template/view?id="+$(this).attr("content_id");
        	});
        });
    </script>
    <style>
    		section {
			    /* height: 100%; */
			    height: auto;
			    display: flex;
			    flex-direction: column;
			}

			.tabcontent {
			    margin-bottom: 40px;
			}
						
			
	    	.navbar-default{
	    		background-color:white;
	    	}
	    	
			.navbar-default .navbar-brand, #navbar>ul>li>a {
			    color: black;
			    padding: 0px 15px 0px 15px;
			}
			
			.navbar-brand>img {
			    margin-top: 6px;
			}
			
			element.style {
			}
			.navbar-default .navbar-brand, .dropdown-content a:hover, #navbar>ul>li>a {
			    color: black;
			    padding: 0px 15px 0px 15px;
			}
			.navbar-default .navbar-brand, .dropdown-content a:hover, #navbar>ul>li>a {
			    color: black;
			}
			.navbar-default .navbar-nav>li>a {
			    color: #777;
			}
			.navbar-default .navbar-nav>li>a {
			    color: #777;
			}
			@media (min-width: 768px)
			.navbar-nav>li>a {
			    padding-top: 15px;
			    padding-bottom: 15px;
			}
			.navbar-nav>li>a {
			    padding-top: 10px;
			    padding-bottom: 10px;
			    line-height: 20px;
			}
			.nav>li>a {
			    position: relative;
			    display: block;
			    padding: 10px 15px;
			}
			.navbar-nav>li>a {
			    padding-top: 0;
			    padding-bottom: 0;
			}
			@media (min-width: 768px)
			.navbar-nav>li>a {
			    padding-top: 15px;
			    padding-bottom: 15px;
			}
			.navbar-nav>li>a {
			    padding-top: 10px;
			    padding-bottom: 10px;
			    line-height: 20px;
			}
			.nav>li>a {
			    position: relative;
			    display: block;
			    padding: 10px 15px;
			}
			.menu-nickname {
			    /* padding: 4.5px; */
			    margin-top: 5px;
			    font-family: 'Francois One', sans-serif;
			    font-size:14px;
			}
							
		
/* 		.navbar-brand>img {
		    margin-top: 5px;
		}
 */
    </style>
</head>

<body>
	<section>
        <div id="latestWrapper">
            <div class="latest" id="board_latest">
                <div class="boardTitleWrap">
                	커뮤니티 최신글
                	<span><a href="/board/list">더 보기 ></a></span>
                </div>
                <div class="boardWrap">
	                <c:forEach var="indexBoardList" items="${indexBoardList}">
	                	<div class="hrefWrap">
	                		<span>
	                			<a name="board_subject" content_id="${indexBoardList.id}">${indexBoardList.subject}<span> &#40;${indexBoardList.reply_cnt}&#41;</span></a>
	                		</span>
	                		<span class="date">${indexBoardList.register_datetime}</span>
	                	</div>
	                </c:forEach>
                </div>
            </div>
            <div class="latest" id = "template_latest">
                <div class="boardTitleWrap">
                	템플릿 최신글
                	<span><a href="/template/list">더 보기 ></a></span>
                </div>
                <div class="boardWrap">
	                <c:forEach var="indexTemplateList" items="${indexTemplateList}">
	                	<div class="hrefWrap">
	                		<span>
	                			<a name="template_subject" content_id="${indexTemplateList.id}">${indexTemplateList.subject}<span> &#40;${indexTemplateList.reply_cnt}&#41;</span></a>
	                		</span>
	                		<span class="date">${indexTemplateList.register_datetime}</span>
	                	</div>
	                </c:forEach>
                </div>
            </div>
            <div class="latest video">
                <div style="height: 100%;">
                    <iframe width="100%" height="100%" src="https://www.youtube.com/embed/77faFCcYo9I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <div id="mainTab">
            <button class="tablink" id="defaultOpen" onclick="openPage('magazine', this)">MAGAZINE</button>
            <button class="tablink" onclick="openPage('like', this)">LIKE</button>
            <button class="tablink" onclick="openPage('view', this)">VIEW</button>
            <button class="tablink" onclick="openPage('category', this)">TAG</button>

            <div id="magazine" class="tabcontent">
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            	<div class="article-loop">
	            	<article class="article-list__item">
	            		<div class="article-list__template">
							<img src="https://i.ibb.co/YDxhQvT/pityzen-Untitled.jpg" class="article-list__template__image">
							<span class="title"><a name="subject" class="mouseOverHighlight">제목이 들어갑니다</a></span>
							<span class="writer"><a href="#">djPark12</a></span>
						</div>
		        	</article>
            	</div>
            </div>
            <!-- 라이크 높은 순 -->
            <div id="like" class="tabcontent">
            	<c:forEach var="indexLikeList" items="${indexLikeList}">
	                <div class="article-loop">
		            	<article class="article-list__item">
		            		<div class="article-list__template">
								<img src="${indexLikeList.file1}" class="article-list__template__image" content_id="${indexLikeList.id}">
								<span class="title"><a name="subject" class="mouseOverHighlight" content_id="${indexLikeList.id}">${indexLikeList.subject}</a></span>
								<span class="writer"><a href="#">${indexLikeList.writer}</a></span>
							</div>
			        	</article>
	            	</div>
            	</c:forEach>
            </div>
			<!-- 조회수 높은 순 -->
            <div id="view" class="tabcontent">
                <c:forEach var="indexViewList" items="${indexViewList}">
	                <div class="article-loop">
		            	<article class="article-list__item">
		            		<div class="article-list__template">
								<img src="${indexViewList.file1}" class="article-list__template__image" content_id="${indexViewList.id}">
								<span class="title"><a name="subject" class="mouseOverHighlight" content_id="${indexViewList.id}">${indexViewList.subject}</a></span>
								<span class="writer"><a href="#">${indexViewList.writer}</a></span>
							</div>
			        	</article>
	            	</div>
            	</c:forEach>
            </div>
			<!-- 해시태그 -->
            <div id="category" class="tabcontent">
                <div id="hashWrapper">
                    <c:forEach var="indexTagList" items="${indexTagList}" begin="0" end="0" step="1">
	                    <button class="hash_1" id="tabDefaultOpen" onclick="opentab('hash1', this, 'gray')">#${indexTagList.tags}</button>
	                </c:forEach>	
	                <c:forEach var="indexTagList" items="${indexTagList}" begin="1" end="1" step="1">
	                    <button class="hash_1"  id="tag2" onclick="opentab('hash2', this, 'gray')">#${indexTagList.tags}</button>
	                </c:forEach>
	                <c:forEach var="indexTagList" items="${indexTagList}" begin="2" end="2" step="1">
	                    <button class="hash_1"  id="tag3" onclick="opentab('hash3', this, 'gray')">#${indexTagList.tags}</button>
                   </c:forEach>
                </div>
	                <div id="hash1" class="hashcontent">
	                	<c:forEach var="indexHash1List" items="${indexHash1List}">
		                	<div class="article-loop">
				            	<article class="article-list__item">
				            		<div class="article-list__template">
										<img src="${indexHash1List.file1}" class="article-list__template__image" content_id="${indexHash1List.id}">
										<span class="title"><a name="subject" class="mouseOverHighlight" content_id="${indexHash1List.id}">${indexHash1List.subject}</a></span>
										<span class="writer"><a href="#">${indexHash1List.writer}</a></span>	
									</div>
					        	</article>
		            		</div>
		       			</c:forEach> 
	                </div>
	                <div id="hash2" class="hashcontent">
	                	<c:forEach var="indexHash2List" items="${indexHash2List}">
		                	<div class="article-loop">
				            	<article class="article-list__item">
				            		<div class="article-list__template">
										<img src="${indexHash2List.file1}" class="article-list__template__image" content_id="${indexHash2List.id}">
										<span class="title"><a name="subject" class="mouseOverHighlight" content_id="${indexHash2List.id}">${indexHash2List.subject}</a></span>
										<span class="writer"><a href="#">${indexHash2List.writer}</a></span>	
									</div>
					        	</article>
		            		</div>
		       			</c:forEach> 
	                </div>
	                <div id="hash3" class="hashcontent">
	                	<c:forEach var="indexHash3List" items="${indexHash3List}">
		                	<div class="article-loop">
				            	<article class="article-list__item">
				            		<div class="article-list__template">
										<img src="${indexHash3List.file1}" class="article-list__template__image" content_id="${indexHash3List.id}">
										<span class="title"><a name="subject" class="mouseOverHighlight" content_id="${indexHash3List.id}">${indexHash3List.subject}</a></span>
										<span class="writer"><a href="#">${indexHash3List.writer}</a></span>	
									</div>
					        	</article>
		            		</div>
		       			</c:forEach> 
                </div> 
            </div>
        </div>
    </section>
</body>

</html>
