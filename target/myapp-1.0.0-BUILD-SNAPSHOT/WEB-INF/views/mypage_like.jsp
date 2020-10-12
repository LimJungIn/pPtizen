<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        @import url("resources/css/common.css");
        @import url("resources/css/mypage_post.css");
        @import url("resources/css/bttn.css");

        .bttn-bordered.bttn-xs {
            padding: 12px 5px 3px 5px;
        }

    </style>
</head>

<body class="mypage-post">
    <section class="post-top-section">
        <div class="profile">
            <img src="resources/img/default/default_profile.png" />
        </div>
        <div class="nickname">
            hello
        </div>
        <div class="sub-nav">
            <a id="writing-list" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="resources/img/default/writing_icon.png" />&nbsp;</a>
            <a id="like-list" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="resources/img/default/like_icon.png" />&nbsp;</a>
            <a id="setup" class="bttn-bordered bttn-xs bttn-primary" href="#">&nbsp;<img src="resources/img/default/setup_icon.png" />&nbsp;</a>
        </div>
    </section>
    <nav>
        <ul>
            <li><a href="#" title="post-tempalte" class="select-test"><span>28</span><br>LIKE 템플릿</a></li>
            <li><a href="#" title="post-writing"><span>28</span><br>LIKE 글</a></li>
            <li><a href="#" title="post-comment"><span>28</span><br>LIKE 글</a></li>
        </ul>
    </nav>
    <section class="post-content-section">
        content
    </section>
</body>

</html>
