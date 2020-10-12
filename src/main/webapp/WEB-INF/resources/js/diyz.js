$(document).ready(function () {
	
	/* 텍스트 상자 */
	$(document).on('click', '.btn_addtextBox', function () {
		var type = $(this).attr("id");
		var diyzBody = $(".contentPane");
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
			case "textAlldel":
				$(".textBox").remove();
				break;
		}
		textBox.appendChild(text);
		textBox.style.left = 520;
		textBox.style.top = 330;
		textBox.style.cursor = "default";
		diyzBody.append(textBox);
		//드래그
		$(".movable").draggable({
			containment: ".contentPane"
		});
		$(".textBox").attr("data-edit", "content");
	});
	
	function typeLive(element) {
	    "use strict";
	    var myInput = document.getElementById(element.getAttribute("data-edit"));
	    myInput.oninput = function () {
	        element.textContent = this.value;
	        element.innerHTML = element.textContent.replace(/\n/g, "<br>");
	    };
	}

	/* 수정, 삭제 버튼 생성 */
	$(document).on("click", ".textBox", function () {
		if ($(this).hasClass(".editable")) return;
		var box = $(this);
		var text = $(this).text();
		$(".edit-text").text(text);
		var delStr = document.createTextNode("삭제");
		var deleteBtn = $("<button/>", {
			type: "button",
			class: "bttn-pill bttn-xs bttn-primary",
			id: "btn_textDelete"
		}).append(delStr);
		deleteBtn.appendTo(box);
		box.removeClass("movable").addClass("editable");
		box.css("border", "1px dashed #7b7b7b");
		
		$(".edit-text").keyup(function() {
			var textContent = $(".edit-text").html();
			//box.html(textContent.replace(/\n/g, '<br>'));
			$(".editable").html(textContent);
		});
	});

	$("#contentWrapper").click(function (e) {
		if (e.target.getAttribute("id") == "btn_textDelete") {
			$(e.target).parent(".textBox").remove();
			$(".edit-text").html("");
		}
		else if ($(e.target).is(".contentPane") || $(e.target).siblings(".textBox")) {
			$(".editable").removeClass("editable").addClass("movable");
			$(".textBox").children("#btn_textDelete").remove();
			$(".textBox").css("border-style", "none");
			$(".edit-text").html("");
		}
	});


	/*폰트 및 크기 셀렉트*/
	/*$(document).on('click', '.selected-item', function () {
		$(this).toggleClass("select_onclick");
		$(this).siblings(".option-wrap").toggleClass("active");
	});
*/
	$(document).on('click', 'input[type="radio"]', function () {
		var selectedOption = $(this).parents('.option').clone();
		$(this).parents().siblings('.selected-item').html(selectedOption);
		$(this).parents().removeClass("active");
		$(this).parents().siblings('.selected-item').removeClass("select_onclick");
	});
	$("html").click(function (e) {
		if (e.target.getAttribute("tagName") != "input[type='radio']") {
			$(".option-wrap").removeClass("active");
			$(".selected-item").removeClass("select_onclick");
		}
	});
	
	/*확대, 축소 버튼*/
	$(document).on('click', '.zoombtn', function () {
		var check = $(this).data("zoom");
		var num = $(".contentPane").css("zoom");
		num *= 1;
		if(check == "in") {
			num += 0.05;
			$(".contentPane").css("zoom", num);
		}
		else {
			num -= 0.05;
			$(".contentPane").css("zoom", num);
		}
	});
});
