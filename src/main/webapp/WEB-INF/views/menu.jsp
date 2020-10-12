<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
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
            
            $(document).ready(function(){
            	var check_writer = "${sessionScope.user_nickname}";
		        if(!check_writer){
		        	$(".dropdown-content li a").removeAttr('href');
		        	$(".dropdown-content").css('display','none'); 
		        } else{
		        	//$(".nickname").html("${sessionScope.user_nickname}");
		        	$(".menu-nickname").html("${sessionScope.user_nickname}");
		        	$(".menu-nickname").prop("href","/user/view/loading?user_id=${sessionScope.user_id}");
		        }
            });
        </script>
        <style>
            @import url("/css/common.css");
            body {
                font-family: none;
                width: 100%;
                background: rgb(241, 241, 241);
            }
            .navbar-default .navbar-brand,
            .dropdown-content a:hover,
            #navbar>ul>li>a {
                color: black;
            }
            .navbar-default,
            .dropdown-content,
            .navbar-default .navbar-nav>.open>a,
            .navbar-default .navbar-nav>.open>a:focus,
            .navbar-default .navbar-nav>.open>a:hover {
                background-color: white;
            }
            .dropdown-content>li>a,
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
			.dropdown-content {
			  display: none;
			  padding: 0;
			  position: absolute;
			  background-color: #f9f9f9;
			  min-width: 135px;
			  border-radius: 8px;
			  box-shadow: 0px 5px 16px 0px rgba(0,0,0,0.2);
			  z-index: 1;
			}
			.dropdown-content a {
			  float: none;
			  color: black;
			  font-size: 14px;
			  padding: 11px 18px;
			  text-decoration: none;
			  display: block;
			  text-align: center;
			}
			.dropdown-content li{
			  list-style: none;
			}
			.dropdown:hover .dropdown-content {
			  display: block;
			}
			.navbar-brand>img{
				margin-top: 4px;
			}
			.menu-nickname{
				padding: 4.5px;
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
                    <a class="navbar-brand" href="/"><img src="/img/default/logo.png" width="80px" height="36px" /></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/template/list">Template</a></li>
                        <li><a href="#about">Diy Z</a></li>
                        <li><a href="/board/list">Community</a></li>
                        <li><a href="#">Magazine</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropbtn" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img src="/img/default/default_profile.png" width="28px" height="28px" /></a>
                            <ul class="dropdown-content">
                           		<li><a href="/user/view/loading?user_id=${sessionScope.user_id}">Profile</a></li>
                            	<li><a href="#">Like</a></li>
                                <li><a href="/user/follow?following_id=${sessionScope.user_id}">Follow</a></li>
                                <li><a href="/logout">Sing Out</a></li>
                            </ul>
                        </li>
                        <li><a class="menu-nickname" href="/login">login</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
    <footer>
    	
    </footer>
    
</html>