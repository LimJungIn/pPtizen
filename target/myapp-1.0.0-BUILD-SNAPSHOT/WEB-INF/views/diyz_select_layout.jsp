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
            background-color: #a89c8e;
        }

        .diyz-select article {
            float: left;
            width: 46%;
        }

        @media screen and (max-width:820px) {
            .select-comment {
                font-size: 1.2em;
            }

            .select-comment p {
                font-size: 14px;
            }
        }

        @media screen and (max-width:650px) {
            .diyz-select article {
                width: 100%;
            }
        }

    </style>
</head>

<body class="diyz-select-body">
    <form method="post" action="#">
        <section class="diyz-select">
            <div class="select-comment">
                Select all the layouts you want to be recommended<br>
                <p>추천받고 싶은 레이아웃을 모두 선택해주세요</p>
            </div>
            <div class="select-body">
                <article>
                    <input type="checkbox" id="Cover" name="layout" value="HealthBeauty" />
                    <label class="select-button" for="Cover">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/layout_cover.jpg">
                        </div>
                        <div class="select-txt">
                            Cover<br>
                            <span>표지</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="title1_content1" name="layout" value="title1_content1" />
                    <label class="select-button" for="FoodDrink">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/layout_1title_1content.jpg" />
                        </div>
                        <div class="select-txt">
                            Title and Content<br>
                            <span>제목 및 내용</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="title1_caption1" name="layout" value="title1_caption1" />
                    <label class="select-button" for="title1_caption1">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/layout_1title_1content_1caption.jpg" />
                        </div>
                        <div class="select-txt">
                            Content with Caption<br>
                            <span>캡션 있는 콘텐츠</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="title1_content2" name="layout" value="title1_content2" />
                    <label class="select-button" for="title1_content2">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/layout_1title_2content.jpg" />
                        </div>
                        <div class="select-txt">
                            Title and Detail<br>
                            <span>제목 및 세부 텍스트</span>
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
