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
                Select all the areas you want to be recommended<br>
                <p>추천받고 싶은 분야를 모두 선택해주세요</p>
            </div>
            <div class="select-body">
                <article>
                    <input type="checkbox" id="HealthBeauty" name="thema" value="HealthBeauty" />
                    <label class="select-button" for="HealthBeauty">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_HealthBeauty.png" />
                        </div>
                        <div class="select-txt">
                            Health and Beauty<br>
                            <span>건강과 미용</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="FoodDrink" name="thema" value="FoodDrink" />
                    <label class="select-button" for="FoodDrink">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_FoodDrink.png" />
                        </div>
                        <div class="select-txt">
                            Food and Drink<br>
                            <span>음식과 음료</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="ArtMedia" name="thema" value="ArtMedia" />
                    <label class="select-button" for="ArtMedia">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_ArtMedia.png" />
                        </div>
                        <div class="select-txt">
                            Art and media<br>
                            <span>예술과 미디어</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Sports" name="thema" value="Sports" />
                    <label class="select-button" for="Sports">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Sports.png" />
                        </div>
                        <div class="select-txt">
                            Sports<br>
                            <span>운동</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Tech" name="thema" value="Tech" />
                    <label class="select-button" for="Tech">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Tech.png" />
                        </div>
                        <div class="select-txt">
                            Tech<br>
                            <span>기술</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Job" name="thema" value="Job" />
                    <label class="select-button" for="Job">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Job.png" />
                        </div>
                        <div class="select-txt">
                            Job<br>
                            <span>직업</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Person" name="thema" value="Person" />
                    <label class="select-button" for="Person">
                        <div class="select-img">
                            <img src="img/diyz_select/thema_Person.png" />
                        </div>
                        <div class="select-txt">
                            Person<br>
                            <span>인물</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Children" name="thema" value="Children" />
                    <label class="select-button" for="Children">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Children.png" />
                        </div>
                        <div class="select-txt">
                            Children<br>
                            <span>어린이</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Leisure" name="thema" value="Leisure" />
                    <label class="select-button" for="Leisure">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Leisure.png" />
                        </div>
                        <div class="select-txt">
                            Leisure<br>
                            <span>여가</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Nature" name="thema" value="Nature" />
                    <label class="select-button" for="Nature">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Nature.png" />
                        </div>
                        <div class="select-txt">
                            Nature<br>
                            <span>자연</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Animal" name="thema" value="Animal" />
                    <label class="select-button" for="Animal">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Animal.png" />
                        </div>
                        <div class="select-txt">
                            Animal<br>
                            <span>동물</span>
                        </div>
                    </label>
                </article>
                <article>
                    <input type="checkbox" id="Weather" name="thema" value="Weather" />
                    <label class="select-button" for="Weather">
                        <div class="select-img">
                            <img src="resources/img/diyz_select/thema_Weather.png" />
                        </div>
                        <div class="select-txt">
                            Weather<br>
                            <span>날씨</span>
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
