<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="viewWrapper">
	<div class="title">픽토그램</div>
	<div class="diagramWrapper">
		<c:forEach var="diyzSelectList" items="${diyzSelectList}">
			<c:if test="${diyzSelectList.kinds == 'pictogram'}">
				<article class="diagram">
					<div class="imgWrapper">
						<img src="${diyzSelectList.img_path}">
					</div>
				</article>
			</c:if>
		</c:forEach>
	</div>
</div>