<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="<%=request.getContextPath()%>/js/scroll_top.js"></script>
    <style>
        .top {
            display: scroll;
            position: fixed;
            right: 10px;
            bottom: 70px;
            cursor: pointer;
            z-index: 1;
        }

        .top img {
            width: 45px;
            height: 45px;
        }

    </style>
</head>

<body>
    <div class="top">
        <a><img src="resources/img/default/top_button.png"></a>
    </div>
</body>

</html>
