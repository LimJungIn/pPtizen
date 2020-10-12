$(document).ready(function () {
	/* 롤링이미지 */
	$("#pictogram, #otherShapes").als({
		visible_items: 8,
		scrolling_items: 2,
		orientation: "horizontal",
		circular: "yes",
		autoscroll: "no",
		interval: 5000,
		speed: 500,
		easing: "linear",
		direction: "right",
		start_from: 0
	});
	$("#titleImg").als({
		visible_items: 4,
		scrolling_items: 1,
		orientation: "horizontal",
		circular: "yes",
		autoscroll: "no",
		interval: 5000,
		speed: 500,
		easing: "linear",
		direction: "right",
		start_from: 0
	});

	/* 텍스트 상자 */
	$(".btn_addtextBox").click(function () {
		var type = $(this).attr("id");
		var diyzBody = $(".template_background");
		var textBox = document.createElement("div");
		var text;
		switch (type) {
			case "titleText":
				textBox.className = "titleBox textBox movable";
				text = document.createTextNode("제목을 입력해주세요.");
				break;
			case "mainText":
				textBox.className = "mainBox textBox movable";
				text = document.createTextNode("내용을 입력해주세요.");
				break;
			case "textAlldel" :
				$(".textBox").remove();
				break;
		}
		textBox.appendChild(text);
		textBox.style.left = 520;
		textBox.style.top = 330;
		textBox.style.cursor = "default";
		diyzBody.append(textBox);
		//드래그
		$(".textBox").draggable({
			containment: ".diyz-body"
		});
		//    $('.editable').froalaEditor({
		//      toolbarInline: true,
		//      charCounterCount: false,
		//      toolbarButtons: ['fontFamily', 'fontSize', 'color', 'bold', 'italic', 'underline', '-', 'align', 'formatOL', 'formatUL', 'indent', 'undo', 'redo'],
		//      toolbarButtonsMD: null,
		//      toolbarButtonsSM: null,
		//      toolbarButtonsXS: null
		//  });
	});
	
	
	/* 수정, 삭제 버튼 생성 */
	$(document).on("click", ".textBox", function() {
		var editStr = document.createTextNode("수정");
		var delStr = document.createTextNode("삭제");
		var editBtn = $("<button/>", {
			type: "button",
			class: "bttn-pill bttn-xs bttn-primary",
			id: "btn_textEdit"
		}).append(editStr);
		var deleteBtn = $("<button/>", {
			type: "button",
			class: "bttn-pill bttn-xs bttn-primary",
			id: "btn_textDelete"
		}).append(delStr);
		editBtn.appendTo($(this));
		deleteBtn.appendTo($(this));
	});


	$("html").click(function (e) {
		if(e.target.getAttribute("id") == "btn_textDelete") {
			$(e.target).parent(".textBox").remove();
		}
//		else if (e.target.getAttribute("id") == "btn_textEdit") {
//			alert("잘 됐네");
//			$(e.target).parent(".textBox").draggable("option", "disabled", true);
//			$(e.target).parent(".textBox").css("cusor", "text");
//			$(".movable").removeClass("movable").addClass(".editable");
//			$(".editable").froalaEditor({
//				toolbarInline: true,
//				charCounterCount: false,
//				toolbarButtons: ['fontFamily', 'fontSize', 'color', 'bold', 'italic', 'underline', '-', 'align', 'formatOL', 'formatUL', 'indent', 'undo', 'redo']
//			});
//		}
		else {
			$(".textBox").children("#btn_textDelete").remove();
			$(".textBox").children("#btn_textEdit").remove();
		}
	});

	/* 더블클릭으로 텍스트 수정 */
	//	$(document).on("dblclick", ".editable", function () {


	//		if ($(this).hasClass("__curr_edited__")) return;
	//		var text = $(this).text();
	//		var size = $(this).css("font-size");
	//		var textAlign = $(this).css("text-align");
	//
	//		$(this).html("");
	//		$(this).addClass("__curr_edited__");
	//		$("<textarea></textarea>").attr({
	//				type: "text"
	//			}).css("font-size", size)
	//			.css("text-align", textAlign)
	//			.appendTo(".__curr_edited__")
	//			.focus().val(text);
	//
	//		$('textarea').summernote({
	//			airMode : true,
	//			popover: {
	//				air: [
	//					['color', ['color']],
	//					['font', ['bold', 'underline', 'clear']]
	//				]
	//			}
	//		});
	//	});

	//			$(document).on("dblclick", ".editable", function () {
	//		$(this).attr("contentEditable", "true");
	//	});

	//	$($(this)).focusout(function () {
	//			$(this).removeClass("__curr_edited__");
	//			$(this).html($(this).children("input:first").val());
	//			$(this).children("input:first").remove();
	//		});


	/* 템플릿 이미지로 저장 */
	$("#save").click(function () {
		html2canvas($(".diyz-body").get(0)).then(function (canvas) {
			//			var myImg = canvas.toDataURL("image/png");
			//			window.open(myImage);
			$("#img-out").append(canvas);
		});
	});
});
