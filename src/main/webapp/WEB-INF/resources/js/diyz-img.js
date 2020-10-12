$(document).ready(function () {
	
	/* 이미지 복제 */
	$(document).on('click', '.diagram', function () {
		var imgDiv = $(this).children(".imgWrapper").clone();
		imgDiv.attr('class', 'imgBox');
		imgDiv.appendTo(".contentPane");
		imgDiv.offset({
			top: 360,
			left: 680
		});
		//드래그
		imgDiv.draggable({
			containment: ".contentPane"
		});
	});

	$(document).on('click', '.imgBox', function () {
		var delImg = new Image();
		delImg.className = "btn_delete";
		delImg.src = "img/diyz/delete.png";
		$(this).append(delImg);
		//크기 조정 핸들 생성
		var classArray = [
			"ui-resizable-handle ui-resizable-ne",
			"ui-resizable-handle ui-resizable-se",
			"ui-resizable-handle ui-resizable-sw",
			"ui-resizable-handle ui-resizable-nw",
		];
		for (var i = 0; i < classArray.length; i++) {
			$("<div/>", {
				class: classArray[i]
			}).appendTo($(this));
		};

		/* 이미지 크기 조정 */
		function inspect(e, options) {
			if (options == null) {
				options = {};
			}
			var onlykey = options['onlykey'] == null ? false : options['onlykey']
			var prefix = options['prefix'] == null ? '' : options['prefix']
			var msg = new Array();
			for (prop in e) {
				if (prop.start_with(prefix)) {
					if (onlykey == true) {
						msg.push(prop);
					} else {
						msg.push(prop + ": " + e[prop]);
					}
				}

			};
		}
		$(this).resizable({
			handles: {
				'ne': '.ui-resizable-ne',
				'se': '.ui-resizable-se',
				'sw': '.ui-resizable-sw',
				'nw': '.ui-resizable-nw'
			},
			grid: [10, 10],
			//helper: "ui-resizable-helper",
			alsoResize: "#rect1",
			containment: ".contentPane"
		});

		$('html').click(function (e) {
			//삭제
			if ($(e.target).hasClass("btn_delete")) {
				$(e.target).parent(".imgBox").remove();
			}
			//다른 곳 클릭하면 핸들 사라지게
			else if (!$(e.target).hasClass("imgBox")) {
				$(".imgBox").children(".ui-resizable-handle").remove();
				$(".imgBox").children(".btn_delete").remove();
			}
		});
	});
	
	/* 백그라운드 이미지 업로드 */
	var $fileBox = null;
	$(function () {
		init();
	});

	function init() {
		$fileBox = $('.input-file');
		fileLoad();
	}

	function fileLoad() {
		$.each($fileBox, function (idx) {
			var $this = $fileBox.eq(idx),
				$btnUpload = $this.find('[type="file"]'),
				$label = $this.find('.file-label');

			$btnUpload.on('change', function () {
				var $target = $(this),
					fileName = $target.val(),
					$fileText = $target.siblings('.file-name');
				$fileText.val(fileName);
			});
			$btnUpload.on('focusin focusout', function (e) {
				e.type == 'focusin' ?
					$label.addClass('file-focus') : $label.removeClass('file-focus');
			});
		});
	}
});
