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
                    <h2>연락처 수정</h2>
                    <p class="contxt">pPtizen의 대표 프로필과 별명을 수정 하실 수 있습니다.</p>
                </div>
                <form>
                    <table border="0">
                        <tbody>
                            <tr>
                                <th scope="row">이메일</th>
                                <td>
                                    <p>
                                        ar******@n*******.com<br>
                                        <span style="color:#555555; font-size: 12px; margin-top: 5px;">현재 pPtizen 계정의 이메일 주소입니다.</span>
                                    </p>
                                    현재 이메일<br>
                                    <span style="color:red; font-size: 12px; margin-top: 5px;">연락처 이메일을 정확하게 입력해 주세요.</span><br>
                                    <input type="text" />
                                    <a class="bttn-bordered bttn-sm bttn-primary">확인</a><br>
                                    변경할 이메일<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 이메일 주소를 입력하세요.(예 : abc@naver.com)</span><br>
                                    <input type="text" />
                                    <a class="bttn-bordered bttn-sm bttn-primary">확인</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">휴대전화</th>
                                <td>
                                    <p>
                                        010-5***-7***<br>
                                        <span style="color:#555555; font-size: 12px; margin-top: 5px;">아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료 결제 등 네이버로부터 알림을 받을 때 사용할 휴대전화입니다.</span>
                                    </p>
                                    현재 이메일<br>
                                    <span style="color:red; font-size: 12px; margin-top: 5px;">연락처 이메일을 정확하게 입력해 주세요.</span><br>
                                    <input type="text" />
                                    <a class="bttn-bordered bttn-sm bttn-primary">확인</a><br>
                                    변경할 이메일<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 이메일 주소를 입력하세요.(예 : abc@naver.com)</span><br>
                                    <input type="text" />
                                    <a class="bttn-bordered bttn-sm bttn-primary">확인</a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">직업</th>
                                <td>
                                    <p>
                                        현재 직업은 학생입니다.<br>
                                    </p>
                                    변경할 직업<br>
                                    <span style="color:#555555; font-size: 12px; margin-top: 5px;">변경할 직업을 선택하세요.</span><br>
                                    <select name="joblist" style="width:22%;">
                                        <option value="0">직업을 선택해주세요.</option>
                                        <option value="1">초등학생</option>
                                        <option value="2">중고등학생</option>
                                        <option value="3">대학생</option>
                                        <option value="4">직장인</option>
                                        <option value="5">교직원</option>
                                        <option value="6">기타</option>
                                    </select> 
                                    <a class="bttn-bordered bttn-sm bttn-primary">확인</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <p><a class="bttn-jelly bttn-md bttn-primary">완료</a><a class="bttn-jelly bttn-md bttn-primary">취소</a></p>
            </div>
        </div>
    </section>
</body></html>
