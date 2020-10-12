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
        @import url("resources/css/mypage_profile.css");
        @import url("resources/css/mypage_modify_contacts.css");
        @import url("resources/css/bttn.css");

        .bttn-bordered.bttn-xs {
            padding: 4px 5px 4px 5px;
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

        #content1 {
            min-height: 56px;
        }

        #content1 .left,
        #content1 .right {
            min-height: 25px;
        }

        #content2 .left,
        #content2.right {
            margin-top: 0px;
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
    <section class="post-content-section">
        <div class="column">
            <div class="column-group group1">
                <div class="column-header">
                    <h2>비밀번호 수정</h2>
                    <p class="contxt">비밀번호를 수정 하실 수 있습니다.</p>
                </div>
                <table>
                    <tbody>
                        <tr>
                            <th scope="row">아이디</th>
                            <td>
                                <input type="text" /> <a id="searchpw" class="bttn-bordered bttn-xs bttn-primary">조회</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">이메일</th>
                            <td style="padding-bottom: 25px;">
                                <input type="text"  style="margin-bottom: 0;"/><br><span style="color:red; font-size: 12px; margin-top: 5px; margin-bottom: 15px;">비밀번호를 정확하게 입력해 주세요.</span><br>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p><a class="bttn-jelly bttn-md bttn-primary">수정</a><a class="bttn-jelly bttn-md bttn-primary">취소</a></p>
            </div>
        </div>
    </section>
</body></html>
