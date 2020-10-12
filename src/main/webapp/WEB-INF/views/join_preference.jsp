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
            .select-img{
                padding:0;
                background-color: #a89c8e;
            }
.diyz-select article{
                float: left;
                width: 29%;
                margin: 2%;
            }
            @media screen and (min-width:551px) and (max-width:950px){
                .diyz-select article{
                    float: left;
                    width: 45%;
                    margin: 2%;
                }
                .select-txt{
                    font-size: 0.75em;
                }
                .select-txt span{
                    font-size: 12px;
                }
            }
            @media screen and (max-width:820px){
                .select-comment{
                    font-size: 1.2em;
                }
                .select-comment p{
                    font-size: 14px;
                }
            }
            @media screen and (max-width:550px){
                .diyz-select article{
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
                    Select the templates you are interested in<br>
                    <p>관심가는 템플릿을 선택하세요..<br>선택을 많이 할수록 취향을 더 잘 알게 되고, 그만큼 추천이 정확해집니다.</p>
                    </div>
                <div class="select-body">
                <article>
                       <input type="checkbox" id="Cover" name="layout" value="HealthBeauty"/>
                        <label class="select-button" for="Cover">
                            <div class="select-img">
                                <img src="resources/img/diyz_select/layout_cover.jpg">
                            </div>
                        </label>
                    </article>
                    <article>
                       <input type="checkbox" id="title1_content1" name="layout" value="title1_content1"/>
                        <label class="select-button" for="FoodDrink">
                            <div class="select-img">
                                <img src="resources/img/diyz_select/layout_1title_1content.jpg"/>
                            </div>
                        </label>
                    </article>
                    <article>
                        <input type="checkbox" id="title1_caption1" name="layout" value="title1_caption1"/>
                        <label class="select-button" for="title1_caption1">
                            <div class="select-img">
                            <img src="resources/img/diyz_select/layout_1title_1content_1caption.jpg"/>
                            </div>
                        </label>
                    </article>
                    <article>
                        <input type="checkbox" id="title1_content2" name="layout" value="title1_content2"/>
                        <label class="select-button" for="title1_content2">
                            <div class="select-img">
                                <img src="resources/img/diyz_select/layout_1title_2content.jpg"/>
                            </div>
                        </label>
                    </article> 
                </div>
        </section>
        <div class="diyz-select-nextbar">
               <input type="submit" id="nextbar-sumbit" class="bttn-jelly bttn-md bttn-primary" value="Complete"/>
               <input type="submit" id="nextbar-sumbit-plus" class="bttn-jelly bttn-md bttn-primary" value="Next"/>
        </div>
        </form>
    </body>
</html>