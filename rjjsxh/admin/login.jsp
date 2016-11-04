<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>杭职软协后台管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/login.min.css" rel="stylesheet">
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