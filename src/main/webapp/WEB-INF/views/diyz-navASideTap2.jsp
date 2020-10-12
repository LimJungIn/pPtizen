<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.categoryItem {
		background-color: white;
    	border-bottom: 2.5px solid #479FFF;
		cursor: pointer;
	}
</style>
<script>
	function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$(".contentPane").css({"background":"url(" + e.target.result + ")"});
					$(".contentPane").css("background-size", "cover");
				}
				reader.readAsDataURL(input.files[0]);
			}
	}
	$(document).ready(function () {
		$(document).on('click', '.background', function () {
			var imgPath = $(this).find(".imgWrapper").find("img").attr("src");
			$(".contentPane").css({"background":"url(" + imgPath + ")"});
			$(".contentPane").css("background-size", "cover");
		});
		
		/*배경 내 이미지로 변경*/
		$("#upload01").change(function(){
			readURL(this);
		});
	});
</script>

<div class="detailCategory">
	<button data-tab="diyz-navASideTap2" class="categoryItem" id="category_default" type="button">
		<label class="icon">레이아웃</label>
	</button>
</div>

<article class="diyz-background">
	<div class="diyz-inputImage">
		<div class="title">내 이미지 넣기</div>
		<div class="input-file">
			<input type="text" readonly="readonly" class="file-name" />
			<label for="upload01" class="file-label">파일 업로드</label>
			<input type="file" name="" id="upload01" class="file-upload" />
		</div>
	</div>
	<div class="viewWrapper">
		<div class="title">배경 이미지</div>
		<div class="diagramWrapper">
			<c:forEach var="diyzSelectList" items="${diyzSelectList}">
			<c:if test="${diyzSelectList.kinds == 'background_img'}">
				<article class="background">
					<div class="imgWrapper">
						<img src="${diyzSelectList.img_path}">
					</div>
				</article>
			</c:if>
		</c:forEach>
		</div>
	</div>
</article>

