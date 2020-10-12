<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        @import url("resources/css/common.css");
        @import url("resources/css/mypage_post.css");
        @import url("resources/css/mypage_setup.css");
        @import url("resources/css/bttn.css");

        .post-top-section {
            margin-top: 25px;
        }

        .bttn-bordered.bttn-xs {
            padding: 12px 5px 3px 5px;
        }

        .bttn-jelly.bttn-md {
            font-size: 14px;
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
    <section class="post-content-section">
        <div class="column">
            <div class="column-group group1">
                <div class="column-header">
                    <h2>사용자 프로필</h2>
                    <p class="contxt">pPtizen에서 <span>'나'를 표현하는 프로필</span> 정보입니다.<br>수정 화면에서 프로필 사진과 별명을 변경하세요.</p>
                </div>
                <div class="column-content setup-only">

                </div>
                <p class=""><a class="bttn-jelly bttn-md bttn-primary">수정</a></p>
            </div>
            <div class="column-group group1">
                <div class="column-header">
                    <h2>비밀번호</h2>
                    <p class="contxt">오랜 기간 변경하지 않은 비밀번호는 안전하지 않습니다.<br><span>주기적인 비밀번호 변경</span>을 통해 개인정보를 안전하게 보호하세요.</p>
                    <div class="column-content setup-only">

                    </div>
                </div>
                <p class=""><a class="bttn-jelly bttn-md bttn-primary">변경</a></p>
            </div>
        </div>
        <div class="column">
            <div class="column-group group2">
                <div class="column-header">
                    <h2>연락처 수정</h2>
                    <p class="contxt">보다 안전한 정보 보호를 위해 등록된 연락처의 일부만 보여드립니다.<br>이름 및 정확한 연락처 정보는 <span>수정 화면에서 확인 가능</span>합니다.</p>
                </div>
                <div class="column-content setup-only">

                </div>
                <p class=""><a class="bttn-jelly bttn-md bttn-primary">수정</a></p>
            </div>
            <div class="column-group group2">
                <div class="column-header">
                    <h2>템플릿 평가</h2>
                    <p class="contxt">관심가는 템플릿을 선택하세요.<br>선택을 많이 할수록 추천이 정확해집니다.</p>
                </div>
                <div class="column-content setup-only">

                </div>
                <p class=""><a class="bttn-jelly bttn-md bttn-primary">평가</a></p>
            </div>
        </div>
    </section>
</body>

</html>
