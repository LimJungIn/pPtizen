<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var Accordion = function(el, multiple) {
                this.el = el || {};
                this.multiple = multiple || false;

                var links = this.el.find('.article-title');
                links.on('click', {
                    el: this.el,
                    multiple: this.multiple
                }, this.dropdown)
            }

            Accordion.prototype.dropdown = function(e) {
                var $el = e.data.el;
                $this = $(this),
                    $next = $this.next();

                $next.slideToggle();
                $this.parent().toggleClass('open');

                if (!e.data.multiple) {
                    $el.find('.accordion-content').not($next).slideUp().parent().removeClass('open');
                };
            }
            var accordion = new Accordion($('.accordion-container'), false);
        });

    </script>
    <style>
        @import url("resources/css/common.css");
        @import url("resources/css/faq.css");

    </style>
</head>

<body class="fap">

    <section id="content">
        <section class="faq-section">
            <nav class="faq-links">
                <div class="select"><a href="#">TEMPLATE</a></div>
                <div><a href="#">DIY Z</a></div>
                <div><a href="#">COMMUNITY</a></div>
                <div><a href="#">MAGAZINE</a></div>
            </nav>
        </section>
        <div id="accordion" class="accordion-container">
            <article class="content-entry">
                <h4 class="article-title"><i></i>Accordion Title 1</h4>
                <div class="accordion-content">
                    Accordion content 1
                </div>
                <!--/.accordion-content-->
            </article>

            <article class="content-entry">
                <h4 class="article-title"><i></i>Accordion Title 2</h4>
                <div class="accordion-content">
                    Accordion content 2
                </div>
                <!--/.accordion-content-->
            </article>

            <article class="content-entry">
                <h4 class="article-title"><i></i>Accordion Title 3</h4>
                <div class="accordion-content">
                    Accordion content 3
                </div>
                <!--/.accordion-content-->
            </article>

            <article class="content-entry">
                <h4 class="article-title"><i></i>Accordion Title 4</h4>
                <div class="accordion-content">
                    Accordion content 4
                </div>
                <!--/.accordion-content-->
            </article>
        </div>
    </section>

</body>

</html>
