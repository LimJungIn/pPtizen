<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.categoryItem {
		background-color: white;
    	border-bottom: 2.5px solid #479FFF;
		cursor: pointer;
	}
	.share {
		text-align: center;
	}
	.share img {
		width: 15px;
	    margin-top: -1px;
	    margin-right: 4px;
	}
	.save_template {
		text-align: center;
	}
	#save {
		background-color: #333;
    	font-size: 15.5px;
	}
	.viewWrapper {
		padding: 4% 0 9% 0;
	}
	.bttn-bordered.bttn-xs {
    	margin-left: 4px;
	}
</style>
<script>
	
	function printDiv(div) {
		div = div[0];
		html2canvas(div).then(function(canvas) {
			var myImage = canvas.toDataURL();
			var date = new Date();
			date = getFormatDate(date);
			var text = makeid();
			downloadURI(myImage, date + "_pPtizen_" + text);
		});
	}
	
	function downloadURI(uri, name) {
		var link = document.createElement("a");
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
	}
	
	function getFormatDate(date) {
		var year = date.getFullYear();
		var month = (1 + date.getMonth());
		month = month >= 10 ? month : '0' + month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		
		return year + '' + month + '' + day;
	}

	function makeid() {
	    var text = "";
	    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	    for( var i=0; i < 5; i++ )
	        text += possible.charAt(Math.floor(Math.random() * possible.length));

	    return text;
	}
	
	$(document).ready(function () {
		
		$("#write").click(function(){ 
        	location.href = "/template/edit";
    	});
		
		$("#save").click(function() {
			if($(".textBox").length){
				alert("텍스트를 모두 지워주세요.");
			} else {
				printDiv($(".contentPane"));
			}
		});
	});
</script>

<div class="detailCategory">
	<button data-tab="diyz-navASideTap2" class="categoryItem" id="category_default" type="button">
		<label class="icon">저장 및 공유</label>
	</button>
</div>

<article class="diyz-background">
	<div class="diyz-inputImage">
		<div class="title">저장하기</div>
		<div class="save_template">
			<button class="bttn-jelly bttn-md bttn-primary btn-templateSave" id="save" type="submit">이미지로 저장하기
			</button>
		</div>
	</div>
	<div class="viewWrapper">
		<div class="title">공유하기</div>
		<div class="share">
			<button id="facebook" class="bttn-bordered bttn-xs bttn-primary">
				<img src="img/default/facebook.png" />Feed
			</button>
			<button id="tweet" class="bttn-bordered bttn-xs bttn-primary">
				<img src="img/default/twitter.png" />Tweet
			</button>
			<button id="write" class="bttn-bordered bttn-xs bttn-primary">
				<img src="img/diyz/pictorgam/heart.png"/>Write
			</button>
		</div>
	</div>
</article>