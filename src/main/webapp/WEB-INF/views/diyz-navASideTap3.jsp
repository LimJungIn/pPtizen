<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumbrushscript.css">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumpenscript.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/font-nanum/1.0/nanumbarungothic/nanumbarungothic.css">

<style>
	.categoryItem {
		background-color: white;
    	border-bottom: 2.5px solid #479FFF;
		cursor: pointer;
	}

	/* 에디터 */
	.formatter {
		    text-align: center;
	}

	.edit-text {
		box-sizing: border-box;
		margin-top: 15px;
		padding: 10px;
		background-color: #f6f6f6;
		min-height: 140px;
		border-radius: 5px;
		border: 1px solid #eee;
	}

	.edit-text:hover,
	.edit-text:focus {
		border: 1px solid transparent;
		outline: none;
		transition: 0.6s;
		box-shadow: none;
		box-shadow: inset 0 0 15px #eee;
	}

	.edit-text:focus {
		box-shadow: inset 0 0 15px #bbb;
	}

	button.btn {
		margin: 2px;
		font-size: 0.8em;
		color: #fff;
		cursor: pointer;
	}

	button.btn:hover,
	button.btn:active {
		background-color: #EAEAEA;
	}
	.btn > img {
		width: 12px;
	}

</style>

<script>
	var wys = select('.edit-text');
	var wyg = select('.text');

	var buttons = select('.formatter button');

	buttons.forEach(function(button) {
		button.addEventListener('click', function() {
			formatText(this.getAttribute('data-command'));
		})
	});

	function formatText(command) {
		document.execCommand(command, false, null);
		wys.dispatchEvent(new Event('keyup'));
	}

	function select(query) {
		var elements = document.querySelectorAll(query);
		return (elements.length > 1) ? elements : elements[0];
	}
</script>

<div class="detailCategory">
	<button data-tab="diyz-navASideTap2" class="categoryItem" id="category_default" type="button">
		<label class="icon">텍스트</label>
	</button>
</div>
<article class="diyz-text">
	<div class="title">텍스트 추가</div>
	<div class="textBtnWrapper">
		<button type="button" class="btn_addtextBox bttn-bordered bttn-xs bttn-primary" id="titleText">제목</button>
		<button type="button" class="btn_addtextBox bttn-bordered bttn-xs bttn-primary" id="mainText">본문</button>
		<button type="button" class="btn_addtextBox bttn-bordered bttn-xs bttn-primary" id="textAlldel">모든 텍스트 지우기</button>
	</div>
	<div class="title">폰트</div>
	<div class="formatter">
		<button class="btn btn-default" data-command="bold"><img src="img/diyz/bold.png"></button>
		<button class="btn btn-default" data-command="italic"><img src="img/diyz/italicize.png"></button>
		<button class="btn btn-default" data-command="underline"><img src="img/diyz/underline.png"></button>
		<!-- <button class="btn btn-default" data-command="justifyLeft">왼쪽</button>
		<button class="btn btn-default" data-command="justifyCenter">가운데</button>
		<button class="btn btn-default" data-command="justifyRight">오른쪽</button> -->
		<button class="btn btn-default" data-command="indent"><img src="img/diyz/right-indent.png"></button>
		<button class="btn btn-default" data-command="outdent"><img src="img/diyz/left-indent.png"></button>
		<button class="btn btn-default" data-command="insertUnorderedList"><img src="img/diyz/list_1.png"></button>
		<button class="btn btn-default" data-command="insertOrderedList"><img src="img/diyz/list_2.png"></button>
		<div class="edit-text" id="content" contenteditable="true" rows="15"></div>
		<script>
		</script>
	</div>
	<!--
	<div class="editFont">
		<div class="fontFamily">
			<div class="selected-item">
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumBarunGothic" />
					<p style="font-family: 'Nanum Barun Gothic';">나눔바른고딕</p>
				</div>
			</div>
			<div class="option-wrap">
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumBarunGothic" />
					<p style="font-family: 'Nanum Barun Gothic';">나눔바른고딕</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumGothic" />
					<p style="font-family: 'Nanum Gothic';">나눔고딕</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="" />
					<p>나눔바른펜</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumPen" />
					<p style="font-family: 'Nanum Pen Script';">나눔손글씨 펜</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumBrush" />
					<p style="font-family: 'Nanum Brush Script';">나눔손글씨 붓</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>배달의민족 주아</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>배달의민족 한나</p>
				</div>
			</div>
		</div>
		<div class="fontSize">
			<div class="selected-item">
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumBarunGothic" />
					<p>10</p>
				</div>
			</div>
			<div class="option-wrap">
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumBarunGothic" />
					<p>10</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumGothic" />
					<p>12</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="" />
					<p>14</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumPen" />
					<p>16</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" value="NanumBrush" />
					<p>18</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>20</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>22</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>24</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>26</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>28</p>
				</div>
				<div class="option">
					<input type="radio" name="fontFamily" />
					<p>30</p>
				</div>
			</div>
		</div>
	</div>-->
</article>
