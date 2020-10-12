<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 세부 카테고리 -->
<script>
	$(function() {
		$('.categoryItem').click(function() {
			var activeTab = $(this).attr('data-tab');
			$('.categoryItem').css('background-color', 'white');
			$('.categoryItem').css('border-bottom', 'none');
			$(this).css('border-bottom', '2.5px solid #479FFF');
			$.ajax({
				type: 'GET',
				url: activeTab,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				error: function() { //통신 실패시
					alert('통신실패!');
				},
				success: function(data) { //통신 성공시
					if(activeTab!="diyz-diagram_picture"){
						$('.diyz-color').css("display", "block");
					}else{
						$('.diyz-color').css("display", "none");
					}
					$('.diyz-diagram').html(data);
				}
			});
		});
		$('#category_default').click();
	});
</script>

<style>
	.diyz-color {
		display : none;
	}
	label {
		cursor: pointer;
	}
</style>

<div class="detailCategory">
	<button data-tab="diyz-diagram_picture" class="categoryItem" id="category_default" type="button">
		<label class="icon">사진</label>
	</button>
	<button data-tab="diyz-diagram_diagram" class="categoryItem" type="button">
		<label class="icon">도형</label>
	</button>
	<button data-tab="diyz-diagram_pictogram" class="categoryItem" type="button">
		<label class="icon">픽토그램</label>
	</button>
</div>
<div clas="detailWrapper">
	<article class="diyz-color">
		<div class="title">색상</div>
		<table>
			<tbody>
				<tr>
					<td><input type="button" class="btn_color white" style="background-color: #FFFFFF" name="white" onclick="javascript:color_change(this.name)"></td>
					<td><input type="button" class="btn_color lavender" name="lavender" style="background-color: #D9A7FF" onclick="javascript:color_change(this.name)"></td>
					<td><input type="button" class="btn_color rose" name="rose" style="background-color: #F18F9E" onclick="color_change(this.name)"></td>
					<td><input type="button" class="btn_color salmon" style="background-color: #FFA78C" name="salmon" onclick="color_change(this.name)"></td>
					<td><input type="button" class="btn_color baeige" style="background-color: #F9F1C9"></td>
					<td><input type="button" class="btn_color melon" style="background-color: #EAFFC4"></td>
				</tr>
				<tr>
					<td><input type="button" class="btn_color light-grey" style="background-color: #C9C9C9"></td>
					<td><input type="button" class="btn_color light-blue" style="background-color: #85D8F6"></td>
					<td><input type="button" class="btn_color magenta" style="background-color: #EE0084"></td>
					<td><input type="button" class="btn_color orange" style="background-color: #FF8B44"></td>
					<td><input type="button" class="btn_color light-yellow" style="background-color: #FFE574"></td>
					<td><input type="button" class="btn_color light-green" style="background-color: #A9D154"></td>
				</tr>
				<tr>
					<td><input type="button" class="btn_color grey" style="background-color: #7D7D7D"></td>
					<td><input type="button" class="btn_color blue" style="background-color: #3A76B5"></td>
					<td><input type="button" class="btn_color red" style="background-color: #E5222E"></td>
					<td><input type="button" class="btn_color brown" style="background-color: #7B4B19"></td>
					<td><input type="button" class="btn_color yellow" style="background-color: #FFEA37"></td>
					<td><input type="button" class="btn_color green" style="background-color: #3A9D6E"></td>
				</tr>
				<tr>
					<td><input type="button" class="btn_color black" style="background-color: #221715"></td>
					<td><input type="button" class="btn_color dark-blue" style="background-color: #065C81"></td>
					<td><input type="button" class="btn_color wine" style="background-color: #A6263C"></td>
				</tr>
			</tbody>
		</table>
	</article>
	<!-- 도형 세부 카테고리 내용 변경 부분 -->
	<article class="diyz-diagram">
	</article>
</div>