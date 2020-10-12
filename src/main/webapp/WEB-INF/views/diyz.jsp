<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/html2canvas.js"></script>
	<!-- 롤링이미지 JS -->
	<script type="text/javascript" src="js/jquery.als-1.7.min.js"></script>
	<!--픽토그램 드래그-->
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js">
	</script>
	<script src="/js/diyz-img.js" type="text/javascript"></script>
	<script src="/js/diyz.js" type="text/javascript"></script>
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
	<style>
		@import url("css/common.css");
		@import url("css/diyz2.css");
		@import url("css/bttn.css");
        /*덧씌우기*/
        .bttn-bordered.bttn-xs{
            font-size: 14px;
        }
        .bttn-jelly.bttn-md{
            padding: 5px 20px;
        }
	</style>
	<!--색상 변경-->
	<script type="text/javascript">
		function color_change(name) {
			var image = document.getElementById('title-img');
			switch (name) {
				case 'white':
					image.src = "img/White/downribbon_white.png";
					break;
				case 'lavender':
					image.src = "img/Lavender/downribbon_lavender.png";
					break;
				case 'rose':
					image.src = "img/Rose/downribbon_rose.png";
					break;
				case 'salmon':
					image.src = "img/Salmon/downribbon_salmon.png";
					break;
			}
		}
	</script>
	
	<!-- 사이트 탭 -->
	<script>
		$(function() {
			$('.iconButton').click(function() {
				var activeTab = $(this).attr('data-tab');
				$('.iconButton').css('background-color', 'white');
				$(this).css('background-color', '#75B2FB');
				$.ajax({
					type: 'GET',
					url: activeTab,
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					error: function() { //통신 실패시
						alert('통신실패!');
					},
					success: function(data) { //통신 성공시
						$('.detailContent').html(data);
					}
				});
			});
			$('#default').click();
		});
	</script>
</head>
<body>
	<main>
		<section id="navASide">
			<div class="navASideButtons">
				<div class="no">
					<label class="icon"></label>
				</div>
				<button data-tab="diyz-navASideTap1" class="iconButton" type="button" id="default">
					<label class="icon"><img src="img/diyz/nav_diagram.png"></label>
				</button>
				<button data-tab="diyz-navASideTap2" class="iconButton" type="button">
					<label class="icon"><img src="img/diyz/nav_background.png"></label>
				</button>
				<button data-tab="diyz-navASideTap3" class="iconButton" type="button">
					<label class="icon"><img src="img/diyz/nav_text.png"></label>
				</button>
				<button data-tab="diyz-navASideTap4" class="iconButton" type="button">
					<label class="icon"><img src="img/diyz/nav_save.png"></label>
				</button>
			</div>
			<!-- 메뉴 컨텐츠 변경 부분 -->
			<div class="detailContent">
			</div>
		</section>
		<section id="contentWrapper">
			<div class="zoomBtns">
				<span class="zoombtn" data-zoom="in"><img src="img/diyz/zoom_in.png"></span>
				<span class="zoombtn" data-zoom="out"><img src="img/diyz/zoom_out.png"></span>
			</div>
			<div class="contentPane">
			</div>
		</section>
	</main>
</body>
</html>
