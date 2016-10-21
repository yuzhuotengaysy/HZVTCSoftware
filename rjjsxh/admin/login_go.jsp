<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>杭职软协后台管理系统</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    <link href="css/bootstrap.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css-v=4.4.0.css" tppabs="http://www.zi-han.net/theme/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" tppabs="http://www.zi-han.net/theme/hplus/css/login.min.css" rel="stylesheet">
    <script>
        if(window.top!==window.self){window.top.location=window.location};
        var count = 5;
        function countdown(){            
            document.getElementById("count").innerHTML=count;
            count--;
            setTimeout(countdown, 1000);
            if(count == -1){
                window.location.href='login.jsp';
            }
        }
    </script>

</head>

<body class="signin" onload="countdown()">
    <div class="signinpanel">
        <div class="row">        
            <div class="col-sm-12">
                <form style="text-align:center">
                    <h3>对不起，您还没有登录！</h3>
                    <h3><span id="count"></span>秒后将跳转到登陆界面</h3>
                    <h4><a href="login.jsp">如果未跳转，请点击此链接</a></h4>
                </form>
            </div>
        </div>

    </div>
</body>

</html>