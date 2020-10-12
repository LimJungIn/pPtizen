<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!--무한스크롤 CSS -->
    <link rel="stylesheet" type="text/css" href="resources/css/community.css">
    <link rel="stylesheet" type="text/css" href="resources/community2.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/community.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
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
        @import url("resources/css/common.css");
        @import url('https://fonts.googleapis.com/css?family=Arbutus+Slab|Cantata+One|Lusitana');
    </style>
</head>
<body>
	    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="resources/img/default/logo.png" width="100px" height="45px" /></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">TEMPLATE</a></li>
                    <li><a href="#about">DIY Z</a></li>
                    <li><a href="#contact">COMMUNITY</a></li>
                    <li><a href="#contact">MAGAZINE</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">FAQ<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">LIKE</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">CATEGORY</li>
                            <li><a href="#">TEMPLATE</a></li>
                            <li><a href="#">DIY Z</a></li>
                            <li><a href="#">COMMUNITY</a></li>
                            <li><a href="#">MAGAZINE</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="nickname">nickname</a></li>
                    <!--
                    <li><a href="navbar-static-top/"><img src="img/default/default_profile.png" width="28px" height="28px"/></a></li>
                    -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="resources/img/default/default_profile.png" width="28px" height="28px" /><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">MYPAGE</a></li>
                            <li><a href="#">LOGOUT</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="sort">
        정렬 부분
    </div>
    <section class="s1">
        <div class="article-list">
            <div class="article-list__page">
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/34/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/35/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/43/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/36/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/37/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/38/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/39/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/40/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/41/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/42/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/45/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/44/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
                <div class="article-loop">
                    <div class="article-list__user"><img class="article-list__user__image" src="http://api.adorable.io/avatars/250/3597900501944045"><a href="#">djPark12</a></div>
                    <div class="article-list__template">
                        <img class="article-list__template__image" src="https://picsum.photos/id/44/600">
                        <p>view 200 like 9</p>
                        <div class="title">동력은 투명하되 무엇이 모래뿐일 목숨이</div>
                        <div class="content">
                            <p>아니더면, 충분히 청춘을 가치를 온갖 오직 창공에 끝까지.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="paging"></div>
    <!--footer-->
    <footer class="pptizen-footer">
        <div class="footer-content">
            <img src="resources/img/default/logo.png" />
            <p>Show and talk about template<br>
                What are you working on?<br>pPtyzen is a community that sharing template, design.</p>
        </div>
    </footer>
</body>
</html>