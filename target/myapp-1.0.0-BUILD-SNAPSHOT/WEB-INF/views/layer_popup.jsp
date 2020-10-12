<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        @import url("resources/css/common.css");
        @import url("resources/css/popup.css");
        @import url("resources/css/bttn.css");

        @media only screen and (max-width: 959px) {
            .bttn-jelly.bttn-lg {
                padding: 5px 10px;
            }
        }

    </style>
</head>

<body>
    <div class="layer-popup">
        <header class="layer-header">
            <img src="resources/img/diyz_select/color_gradient.jpg" />
            <div>
                <div class="lpopup-left">
                    <div class="lpopup-title">
                        Rhoncus est pellentesque
                    </div>
                    <div class="nickname">
                        nickname
                    </div>
                </div>
                <a class="bttn-jelly bttn-lg bttn-default">
                    <div class="lpopup-like-icon"><img src="resources/img/default/unlike_icon.png" /></div>
                    Like
                </a>
            </div>
        </header>
        <section class="lpopup-bodyWindow">
            <!--본문-->
            <article class="lpopup-body">
                proin libero nunc consequat interdum varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus

                enim blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque in dictum non consectetur a erat nam at lectus urna duis convallis convallis tellus id interdum velit laoreet id donec ultrices tincidunt arcu non sodales neque sodales ut etiam sit amet

                turpis massa tincidunt dui ut ornare lectus sit amet est placerat in egestas erat imperdiet sed euismod nisi porta lorem mollis aliquam ut porttitor leo a diam sollicitudin
            </article>
            <!--템플릿 첨부-->
            <article class="lpopup-attachment">
                <div class="name">Shared Templates</div>
                <div class="templateList">
                    <div class="template">
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                        <img src="resources/img/layerpopup/test1.png" />
                    </div>
                </div>
            </article>
        </section>
        <section class="lpopup-commentWindow">
            <div class="lpopup-commentHeader">
                2 Comments
                <div class="comment-sort">
                    <a>oldest</a>
                    <a>newest</a>
                    <a>liked</a>
                </div>
            </div>
            <ul class="comment-list">
                <li>
                    <!--댓글-->
                    <article class="lpopup-comment">
                        <div class="left">
                            <img class="profile" src="resources/img/default/default_profile.png" />
                            <div><a class="nickname">NAME</a></div>
                        </div>
                        <div class="right">
                            <div class="body">
                                Text - Double click to edit
                            </div>
                            <div class="bottom">
                                May 13,2019
                                <span class="sep">|</span>
                                <a class="reply">reply</a>
                                <a class="modify">modify</a>
                                <a class="delete">delete</a>
                                <input type="image" src="resources/img/default/unlike_icon.png" value="" onclick="" />
                            </div>
                        </div>
                    </article>
                    <ul class="reply-list">
                        <span></span>
                        <li>
                            <!--답글-->
                            <article class="lpopup-reply">
                                <div class="left">
                                    <img class="profile" src="resources/img/default/default_profile.png" />
                                    <div><a class="nickname">NAME</a></div>
                                </div>
                                <div class="right">
                                    <div class="body">
                                        Text - Double click to edit
                                    </div>
                                    <div class="bottom">
                                        May 13,2019
                                        <span class="sep">|</span>
                                        <a class="modify">modify</a>
                                        <a class="delete">delete</a>
                                        <input type="image" src="resources/img/default/unlike_icon.png" value="" onclick="#" />
                                    </div>
                                </div>
                            </article>
                        </li>
                    </ul>
                </li>
            </ul>
        </section>
        <section class="lpopup-bottomside">
            <div class="lpopup-stats">
                <div class="share">
                    <a id="facebook" class="bttn-bordered bttn-xs bttn-primary">
                        <div><img src="resources/img/default/facebook.png" /></div>Feed
                    </a>
                    <a id="tweet" class="bttn-bordered bttn-xs bttn-primary">
                        <div><img src="resources/img/default/twitter.png" /></div>Tweet
                    </a>
                    <a id="linkcopy" class="bttn-bordered bttn-xs bttn-primary">
                        <div><img src="resources/img/default/link.png" /></div>Copy
                    </a>
                </div>
                <div class="stats">
                    <div class="view">
                        <div><img src="resources/img/default/view_icon_gray.png" /></div>1,1617 views
                    </div>
                    <div class="like">
                        <div><img src="resources/img/default/unlike_icon.png" /></div>182 likes
                    </div>
                    <div class="date">
                        <div><img src="resources/img/default/calendar_icon.png" /></div>May 13,2019
                    </div>
                </div>
            </div>
            <div class="lpopup-player-shots">
                Content you will be interested in
                <ol>
                    <li><a><img src="resources/img/diyz_select/layout_cover.jpg" /></a></li>
                    <li><a><img src="resources/img/diyz_select/layout_1title_1content.jpg" /></a></li>
                    <li><a><img src="resources/img/diyz_select/layout_1title_1content_1caption.jpg" /></a></li>
                    <li><a><img src="resources/img/diyz_select/layout_1title_2content.jpg" /></a></li>
                </ol>
            </div>
            <div class="ad">
                <img src="resources/img/ad/ad1_mobile.jpg" /><br>
                See how users are interacting with your designs - for free.
            </div>
        </section>
    </div>
</body>

</html>
