<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
                if($(document).scrollTop() <= $(".navbar-fixed-top").outerHeight()){
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
            body {
                font-family: none;
            }
            .navbar-default .navbar-brand,
            .dropdown-menu>li>a:hover,
            #navbar>ul>li>a {
                color: black;
            }
            .navbar-default,
            .dropdown-menu,
            .navbar-default .navbar-nav>.open>a,
            .navbar-default .navbar-nav>.open>a:focus,
            .navbar-default .navbar-nav>.open>a:hover {
                background-color: white;
            }
            .dropdown-menu>li>a,
            .navbar-nav {
                font-family: 'Francois One', sans-serif;
            }
            #navbar {
                overflow-x: hidden;
            }
            .navbar {
                float: left;
                width: 100%;
                display: block;
                margin: 0;
            }
            .navbar-brand {
                padding: 4px 0 0 0;
                margin: 0 7px 0 7px;
            }
            .navbar-nav>li>a {
                padding-top: 0;
                padding-bottom: 0;
            }
            .navbar-nav {
                padding: 14px 0 8px 0;
                font-size: 14px;
            }
            .navbar-right {
                padding-top: 10px;
                font-family: 'Gothic A1', sans-serif;
                font-size: 12px;
            }
            .nickname {
                margin-top: 4px;
                margin-right: -10px;
                text-align: left;
            }
            .navbar-fixed-top {
                position: static; /*없으면 fixed 적용되는데 다른 컨텐츠 위로 위치해 가릴 수 있음*/
            }
            .nav>li>a>img{
                border-radius: 50%;
            }
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
    </body>
</html>