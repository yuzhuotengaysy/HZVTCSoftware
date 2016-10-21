<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="utf-8"%>
<%@ include file="../main/connect.jsp" %>

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
    </script>

</head>

<body class="signin">
    <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>Hzvtc Software</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎来到 <strong>来到杭职软协会后台登录界面</strong></h4>
                </div>
            </div>
            <div class="col-sm-5">
                <form name="admin" method="post" action="main/logincheck.jsp">
                    <h4 class="no-margins">登录：</h4>
                    <p class="m-t-md">登录到杭职软协后台</p>
                    <input type="text" name="username" class="form-control uname" placeholder="用户名" />
                    <input type="password" name="password" class="form-control pword m-b" placeholder="密码" />
                    <div class="input-group" style="margin-top:-15px">  
                        <input type="text" name="code" class="form-control barcode" placeholder="验证码" maxLength="4" style="width:74%"/>
                        <img src="../main/image.jsp" name="rcode" id="barcode" style="margin-top:15px;cursor:pointer" onclick="recode()">
                    </div>
                    <button class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function recode(){
            var image = document.getElementById("barcode");
            var myDate = new Date();
            image.src = "../main/image.jsp?time="+myDate.getTime();
        }

    </script>
</body>

</html>