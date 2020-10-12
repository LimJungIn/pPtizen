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
        @import url("resources/css/diyz_select.css");
        @import url("resources/css/bttn.css");

        .select-img {
            padding: 0;
            background-color: white;
        }

        .diyz-select article {
            float: left;
            width: 29%;
            margin: 2%;
        }

        @media screen and (min-width:551px) and (max-width:950px) {
            .diyz-select article {
                float: left;
                width: 45%;
                margin: 2%;
            }

            .select-txt {
                font-size: 0.75em;
            }

            .select-txt span {
                font-size: 12px;
            }
        }

        @media screen and (max-width:820px) {
            .select-comment {
                font-size: 1.2em;
            }

            .select-comment p {
                font-size: 14px;
            }
        }

        @media screen and (max-width:550px) {
            .diyz-select article {
                float: left;
                width: 100%;
                margin: 0;
            }
        }

    </style>
</head>

<body class="diyz-select-body">
    <form method="post" action="#">
        <section class="diyz-select">
            <div class="select-comment">
                Select all the colors you want to be recommended<br>
                <p>추천받고 싶은 색상을 모두 선택해주세요</p>
            </div>
            <div class="select-body">
                <article>
                    <input type="checkbox" id="Vivid" name="color" value="Vivid" />
                    <label class="select-button" for="Vivid">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/color_vivid.jpg" />
                        </div>
                        <div class="select-txt">
                            VIVID<br>
                            <span>비비드</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Pastel" name="color" value="Pastel" />
                    <label class="select-button" for="Pastel">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/color_pastel.jpg" />
                        </div>
                        <div class="select-txt">
                            PASTEL<br>
                            <span>파스텔</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Gradient" name="color" value="Gradient" />
                    <label class="select-button" for="Gradient">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/color_gradient.jpg" />
                        </div>
                        <div class="select-txt">
                            Gradient<br>
                            <span>그라디언트</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Vintage" name="color" value="Vintage" />
                    <label class="select-button" for="Vintage">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/color_vintage.jpg" />
                        </div>
                        <div class="select-txt">
                            Vintage<br>
                            <span>빈티지</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Nature" name="color" value="Nature" />
                    <label class="select-button" for="Nature">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/color_nature.jpg" />
                        </div>
                        <div class="select-txt">
                            Nature<br>
                            <span>내추럴</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="BlackWhite" name="color" value="BlackWhite" />
                    <label class="select-button" for="BlackWhite">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/color_blackwhite.jpg" />
                        </div>
                        <div class="select-txt">
                            Black&amp;White<br>
                            <span>블랙&amp;화이트</span>
                        </div>
                    </label>
                </article>
            </div>
        </section>
        <div class="diyz-select-nextbar">
            <input type="submit" id="nextbar-sumbit" class="bttn-jelly bttn-md bttn-primary" value="Next" />
        </div>
    </form>
</body>

</html>
