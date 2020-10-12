<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
	function readURL(input) {
  		if (input.files && input.files[0]) {
  			var reader = new FileReader();
  			reader.onload = function (e) {
  				$(".imgWrapper > img").attr("src", e.target.result);
  			}
  			reader.readAsDataURL(input.files[0]);
  		}
	}
	
	$(document).ready(function () {	
		var diyzBody = $(".contentPane");
		/*내 이미지 추가*/
		$("#upload01").change(function(){
			var imgBox = $("<div/>", {
				class : "imgWrapper imgBox"
			}).appendTo(diyzBody);
			
			var img = $("<img>", {
				src: ""
			}).appendTo(imgBox);
			
			readURL(this);
			imgBox.css("position", "relative");
			imgBox.css("top", "120px");
			imgBox.css("left", "300px");
			imgBox.width("350px");
			imgBox.height("auto")
			//드래그
			imgBox.draggable({
				containment: ".contentPane"
			});
			imgDiv.resizable({
				containment: ".contentPane"
			});
		});
	});
</script>

<div class="diyz-inputImage">
	<div class="title">내 이미지 넣기</div>
	<div class="input-file">
		<input type="text" readonly="readonly" class="file-name" />
		<label for="upload01" class="file-label">파일 업로드</label>
		<input type="file" name="" id="upload01" class="file-upload" />
	</div>
</div>
<div class="viewWrapper">
	<div class="title">사진</div>
	<div class="diagramWrapper">
		<c:forEach var="diyzSelectList" items="${diyzSelectList}">
			<c:if test="${diyzSelectList.kinds == 'picture'}">
				<article class="diagram">
					<div class="imgWrapper">
						<img src="${diyzSelectList.img_path}">
					</div>
				</article>
			</c:if>
		</c:forEach>
	</div>
</div>