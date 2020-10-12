<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<!-- 롤링이미지 CSS -->
	<link rel="stylesheet" type="text/css" media="screen" href="css/CSSreset.min.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="css/rollingImg_CSS.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="js/html2canvas.js"></script>
	<!-- 폰트 에디터 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/froala_editor.pkgd.min.css" type="text/css" rel="stylesheet" />
	<link href="css/froala_style.min.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/froala_editor.pkgd.min.js"></script>
	<!-- 롤링이미지 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.als-1.7.min.js"></script>
	<!--픽토그램 드래그-->
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js">
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/diyz-img.js"></script>
	<!--기타-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/diyz.js"></script>
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
		@import url("css/diyz.css");
		@import url("css/bttn.css");
		@import url("css/diyz_detail.css");
        /*덧씌우기*/
        .bttn-bordered.bttn-xs{
            font-size: 14px;
        }
        html, body{
            width: 1700px;
            margin: 0;
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
	<!-- 이미지 복제 -->
	<!--
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.btn_pictogram', function() {
                var child = $(this).children().clone();
                child.attr('class', 'pictogram_child');
                child.appendTo(".diyz-body");
                child.css("cursor", "move");
                child.draggable();
            });
        });
    </script>
-->
</head>

<body>
	<main>
		<section class="diyz">
			<article class="diyz-body">
				<div class="template_background">
					<img id="title-img" src="img/White/downribbon_white.png" />
				</div>
			</article>
			<div class="detail-wrapper">
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
				<article class="diyz-text">
					<div class="title">텍스트</div>
					<button type="button" class="btn_addtextBox bttn-bordered bttn-xs bttn-primary" id="titleText">제목</button>
					<button type="button" class="btn_addtextBox bttn-bordered bttn-xs bttn-primary" id="mainText">본문</button>
					<button type="button" class="btn_addtextBox bttn-bordered bttn-xs bttn-primary" id="textAlldel">모든 텍스트 지우기</button>
					<!--<div class="editorDIV"></div>-->
				</article>
				<article class="diyz-background">
					<div class="title">배경 이미지</div>
					<div class="input-file">
						<input type="text" readonly="readonly" class="file-name" />
						<label for="upload01" class="file-label">파일 업로드</label>
						<input type="file" name="" id="upload01" class="file-upload" />
					</div>
				</article>
				<div class="save_template">
					<button class="bttn-jelly bttn-md bttn-primary btn-templateSave" id="save" type="submit">확인
					</button>
				</div>
			</div>
		</section>
		<section class="section-rollingImg">
			<h2>픽토그램</h2>
			<div id="pictogram" class="als-container">
				<span class="als-prev"><img src="img/diyz/thin_left_arrow_333.png" /></span>
				<div class="als-viewport">
					<ul class="als-wrapper">
						<li class="als-item"><button type="button" class="btn_pictogram addItem">
								<div class="imgWrapper"><img src="img/diyz/pictorgam/calculator.png" /></div>
							</button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem">
								<div class="imgWrapper"><img src="img/diyz/pictorgam/light_bulb.png" /></div>
							</button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem">
								<div class="imgWrapper"><img src="img/diyz/pictorgam/card.png" /></div>
							</button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/chess.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/clock.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/cut.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/heart.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/map.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/mobile_phone.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/camera.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/music_note.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/protection.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_pictogram addItem"><img src="img/diyz/pictorgam/television.png" /></button></li>
					</ul>
				</div>
				<span class="als-next"><img src="img/diyz/thin_right_arrow_333.png" /></span>
			</div>
		</section>
		<section class="section-rollingImg">
			<h2>타이틀</h2>
			<div id="titleImg" class="als-container">
				<span class="als-prev"><img src="img/diyz/thin_left_arrow_333.png" /></span>
				<div class="als-viewport">
					<ul class="als-wrapper">
						<li class="als-item"><button type="button" class="btn_title addItem">
								<div class="imgWrapper"><img src="img/diyz/title/title01.png" /></div>
							</button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title02.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title03.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title04.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title05.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title06.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title07.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_title addItem"><img src="img/diyz/title/title08.png" /></button></li>
					</ul>
				</div>
				<span class="als-next"><img src="img/diyz/thin_right_arrow_333.png" /></span>
			</div>
		</section>
		<section class="section-rollingImg">
			<h2>기타</h2>
			<div id="otherShapes" class="als-container">
				<span class="als-prev"><img src="img/diyz/thin_left_arrow_333.png" /></span>
				<div class="als-viewport">
					<ul class="als-wrapper">
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/calculator.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/light_bulb.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/card.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/chess.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/clock.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/cut.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/heart.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/map.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/mobile_phone.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/camera.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/music_note.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/protection.png" /></button></li>
						<li class="als-item"><button type="button" class="btn_otherShapes addItem"><img src="img/diyz/pictorgam/television.png" /></button></li>
					</ul>
				</div>
				<span class="als-next"><img src="img/diyz/thin_right_arrow_333.png" /></span>
			</div>
		</section>
		<div id="img-out" style="background-color:aqua"></div>
	</main>
</body>

</html>
