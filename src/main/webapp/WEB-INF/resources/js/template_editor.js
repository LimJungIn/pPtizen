$(document).ready(function () {
	
	function readFiles(files,callback,index=0) {
	  if (files && files[0]) {
	    let file = files[index++],
	        reader = new FileReader();
	    reader.onload = function(e){
	      callback(e);
	      if(index<files.length) readFiles(files,callback,index);
	    }
	    reader.readAsDataURL(file);
	  }
	}

	$("body").on("change",".imagepicker-replace input",function() {
	  var imagepicker = this;
	  readFiles(this.files,function(e) {
	    $(imagepicker).parent()
	      .addClass("picked")
	      .css({"background-image":"url("+e.target.result+")"});
	  });
	})
});
