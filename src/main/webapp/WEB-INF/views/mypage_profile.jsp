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
        @import url("resources/css/mypage_modify_contacts.css");
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

        .bttn-bordered.bttn-sm {
            padding: 4px 10px;
            font-size: 13px;
            font-family: inherit;
        }

        .post-content-section {
            margin-top: 0;
        }

        .column-group {
            border: none;
        }

        .group1 {
            margin: 0;
        }

        .column-content .right span {
            margin: 0;
        }

        .post-content-section {
            background-color: white;
        }

        .post-content-section .column {
            width: 70%;
            margin: 0 15%;
        }

        .column-group table td {
            padding-bottom: 15px;
        }

        .column-group table td a {
            float: left;
            margin: 10px 10px 0 0;
        }

        .column-group table td input {
            margin-bottom: 15px;
        }

        @media only screen and (max-width: 629px) {
            .post-content-section .column {
                float: none;
                width: 100%;
                margin: 0;
            }
        }

    </style>
</head>

<body class="mypage-post mypage-profile">
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
                    <h2>프로필 수정</h2>
                    <p class="contxt">pPtizen의 대표 프로필과 별명을 수정 하실 수 있습니다.</p>
                </div>
                <form>
                    <table border="0">
                        <tbody>
                            <tr>
                                <th scope="row">프로필 사진</th>
                                <td>
                                    <span>파일명 및 경로.jpg</span><br>
                                    <a class="bttn-bordered bttn-sm bttn-primary">사진 변경</a>
                                    <a class="bttn-bordered bttn-sm bttn-primary">삭제</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">닉네임</th>
                                <td>
                                    <input type="text" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <p><a class="bttn-jelly bttn-md bttn-primary">수정</a><a class="bttn-jelly bttn-md bttn-primary">취소</a></p>
            </div>
        </div>
    </section>
</body>

</html>
