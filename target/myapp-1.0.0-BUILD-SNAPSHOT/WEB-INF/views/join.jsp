<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/mypage_post.css" rel="stylesheet">
    <link href="/css/mypage_setup.css" rel="stylesheet">
    <link href="/css/mypage_profile.css" rel="stylesheet">
    <link href="/css/mypage_modify_contacts.css" rel="stylesheet">
    <link href="/css/bttn.css"rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        @import url("css/common.css");
        @import url("css/mypage_post.css");
        @import url("css/mypage_setup.css");
        @import url("css/mypage_profile.css");
        @import url("css/mypage_modify_contacts.css");
        @import url("css/bttn.css");

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
                    <h2>회원가입</h2>
                </div>
                <table>
                    <tbody>
                        <tr>
                            <th scope="row">이름</th>
                            <td>
                                <input type="text" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">생년월일</th>
                            <td>
                                <input type="text" placeholder="주민번호앞자리" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">닉네임</th>
                            <td>
                                <input type="text" placeholder="8자리 이내로 입력" /> <a id="searchpw" class="bttn-bordered bttn-xs bttn-primary">조회</a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">생년월일</th>
                            <td>
                                <input type="text" placeholder="주민번호앞자리" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">직업</th>
                            <td>
                                <select name="joblist" style="width:22%;">
                                    <option value="0">직업을 선택해주세요.</option>
                                    <option value="1">초등학생</option>
                                    <option value="2">중고등학생</option>
                                    <option value="3">대학생</option>
                                    <option value="4">직장인</option>
                                    <option value="5">교직원</option>
                                    <option value="6">기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">이메일</th>
                            <td>
                                <input type="text" placeholder="account@pptizen.com"/> <a class="bttn-bordered bttn-xs bttn-primary">조회</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p><a class="bttn-jelly bttn-md bttn-primary">가입</a><a class="bttn-jelly bttn-md bttn-primary">취소</a></p>
            </div>
        </div>
    </section>
</body></html>