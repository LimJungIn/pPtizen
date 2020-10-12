function getPageId(n) {
    return 'article-page-' + n;
}

//------------문서(페이지)의 높이 구하는 함수------------//
function getDocumentHeight() {
    var body = document.body;
    var html = document.documentElement;

    return Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight);
}

//------------스크롤의 top 좌표 구하는 함수------------//
function getScrollTop() {
    //스크롤 y좌표의 위치가 undefined가 아니면(true이면), 스크롤의 y좌표를 리턴
    return window.pageYOffset !== undefined ? window.pageYOffset : (document.documentElement || document.body.parentNode || document.body).scrollTop;
}

//------------템플릿 <img>생성 함수------------//
function getArticleImage() {
    var hash = Math.floor(Math.random() * 80);
    var image = new Image();
    image.className = 'article-list__template__image article-list__template__image--loading';
    image.src = 'https://picsum.photos/id/' + hash + '/500';

    //이미지 src를 불러오면 loading 클래스 지우기
    image.onload = function () {
        image.classList.remove('article-list__template__image--loading');
    };

    return image;
}

//------------유저 프로필 <img> 생성 함수------------//
function getUserImage() {
    var hash = Math.floor(Math.random() * Number.MAX_SAFE_INTEGER);
    var profile = new Image();
    profile.className = 'article-list__user__image';
    profile.src = 'http://api.adorable.io/avatars/250/' + hash;

    return profile;
}

//------------유저 닉네임 생성 함수------------//
function getUserNickname() {
    var nickname = document.createElement('a');
    nickname.href = '#';
    nickname.innerHTML = 'djPark12';

    return nickname;
}

//------------userBox 생성 함수------------//
function getArticleUser() {
    var profileImage = getUserImage();
    var userNickname = getUserNickname();
    var userBox = document.createElement('div');
    userBox.className = 'article-list__user';
    userBox.appendChild(profileImage);
    userBox.appendChild(userNickname);

    return userBox;
}

//------------템플릿 정보(view, like) 생성 함수------------//
function getTemplateInfo() {
    var templateInfo = document.createElement('p');
    templateInfo.innerHTML = 'view 200 like 9';

    return templateInfo;
}

//------------templateBox 생성 함수------------//
function getArticleTemplate() {
    var articleImage = getArticleImage();
    var temInfo = getTemplateInfo();
    var templateBox = document.createElement('div');
    templateBox.className = 'article-list__template';
    templateBox.appendChild(articleImage);
    templateBox.appendChild(temInfo);

    return templateBox;
}

//------------article 생성 함수------------//
function getArticle() {
    var temWrapper = getArticleTemplate();
    var userWrapper = getArticleUser();
    var article = document.createElement('article');
    article.className = 'article-list__item';
    article.appendChild(temWrapper);
    article.appendChild(userWrapper);

    return article;
}

//------------페이지 div 생성 및 생성된 div안에 <article>을 추가하는 함수------------//
function getArticlePage(page) {
    //인자값이 1개 이하거나, arguments[1]이 undefined이면 16 저장
    var articlesPerPage = arguments.length <= 1 || arguments[1] === undefined ? 16 : arguments[1];

    //위에 ----(페이지번호)--- 부터의 div 생성(=>article-list__page)
    var pageElement = document.createElement('div');
    pageElement.id = getPageId(page);
    pageElement.className = 'article-list__page';

    //위에서 저장된 값(16)만큼 'article-list__page' div에 article을 자식으로 생성
    while (articlesPerPage--) {
        pageElement.appendChild(getArticle());
    }
    //article까지 추가가 완료된 'article-list__page' div를 return
    return pageElement;
}

//------------하단의 페이지창 만드는 함수------------//
function addPaginationPage(page) {
    var pageLink = document.createElement('a');
    //<a>의 하이퍼링크를 'article-page-' + n 로 설정
    pageLink.href = '#' + getPageId(page);
    //몇 페이지인지 보여주기
    pageLink.innerHTML = page;

    var listItem = document.createElement('li');
    listItem.className = 'article-list__pagination__item';
    //위에서 만든 <a>를 <li>에 자식으로 추가
    listItem.appendChild(pageLink);

    //페이지 목록 <ul>에 위에서 만든 <li> 자식으로 추가
    articleListPagination.appendChild(listItem);

    //페이지 수가 2이면
    if (page === 2) {
        //하단의 클래스 이름 삭제
        articleListPagination.classList.remove('article-list__pagination--inactive');
    }
}

//------------'.article-list'에 리턴받은 'article-list__page' div를 추가하는 함수------------//
function fetchPage(page) {
    articleList.appendChild(getArticlePage(page));
}

//------------페이지 추가 함수------------//
function addPage(page) {
    fetchPage(page);
    addPaginationPage(page);
}

var articleList = document.getElementById('article-list');
var articleListPagination = document.getElementById('article-list-pagination');
var page = 0;

//페이지 수 +1된 값 addPage()에 넘기기
addPage(++page);

//스크롤하면 실행되는 함수
window.onscroll = function () {
    if (getScrollTop() + 50 < getDocumentHeight() - window.innerHeight) {
        return;
    }
    //페이지 수 +1된 값 addPage()에 넘기기
    addPage(++page);
};
