$(document).ready(function() {
  $(".top").hide();
});

$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $(".top").fadeIn();
        } else {
            $(".top").fadeOut();
        }
    });

    $(".top a").click(function () {
        $("body,html").animate({
            scrollTop: 0
        }, 800);
        return false;
    });
});
