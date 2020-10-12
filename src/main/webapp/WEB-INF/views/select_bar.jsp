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
    <style>
        @import url("resources/css/common.css");

        .container,
        .navbar,
        .navbar-header,
        .navbar-nav {
            float: left;
            width: 100%;
            height: auto;
        }

        .container>.navbar-header,
        .navbar {
            margin: 0;
        }

        .navbar-nav {
            text-align: center;
            margin: 0 auto;
            font-family: 'Francois One', sans-serif;
            font-size: 14px;
        }

        body {
            font-family: none;
            color: black;
        }

        .navbar-default {
            background-color: white;
        }

        .navbar-default .navbar-brand {
            color: black;
        }

        background-color: white;

        }

        .navbar-default .navbar-nav>.open>a,
        .navbar-default .navbar-nav>.open>a:focus,
        .navbar-default .navbar-nav>.open>a:hover {
            background-color: white;
        }

        .dropdown-menu>li>a {
            font-family: 'Francois One', sans-serif;
        }

        #navbar>ul>li>a,
        .dropdown-menu>li>a:hover {
            color: black;
        }

        .nav>li {
            float: none;
            position: relative;
            display: inline-block;
        }

        @media screen and (max-width:768px) {
            .nav>li {
                display: block;
            }
        }

        .navbar-fixed-top {
            position: static;
            /*없으면 fixed 적용되는데 다른 컨텐츠 위로 위치해 가릴 수 있음*/
        }

    </style>
</head>

<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">TEMPLATE<span class="caret"></span></a>
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
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">COMMUNITY<span class="caret"></span></a>
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
            </div>
        </div>
    </nav>
</body>

</html>
