<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link href="/css/common.css" rel="stylesheet">
	<link href="/css/index.css" rel="stylesheet">
</head>

<body>
	<section>
            <div id="view" class="tabcontent" style="display: block;">
                <c:forEach var="userLikeList" items="${userLikeList}">
	                <div class="article-loop">
		            	<article class="article-list__item">
		            		<div class="article-list__template">
								<img src="${userLikeList.file1}" class="article-list__template__image">
								<span class="title"><a name="subject" class="mouseOverHighlight">${userLikeList.subject}</a></span>
								<span class="writer"><a href="#">${userLikeList.writer}</a></span>
							</div>
			        	</article>
	            	</div>
            	</c:forEach>
            </div>
    </section>
</body>

</html>
