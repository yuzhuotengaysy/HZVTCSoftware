<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>杭职软件技术协会</title>
<link rel="shortcut icon" href="huaji.ico"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/style.js"></script>
</head>
<body>
<audio autoplay src="bgm/千本樱.mp3" ></audio>
<!-- 导航条 -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand logo" href="#">杭州职业技术学院软件技术协会</a> </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav nav-left">
        <li><a href="index.php">首页</a></li>
        <li><a href="noticelist.php">公告</a></li>
        <li><a href="data.php">资源</a></li>
        <li><a href="board/board.php">留言</a></li>
        <li class="active"><a href="#">关于</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
            <?php
                header("Content-Type: text/html;charset=utf-8"); 
                error_reporting(E_ALL^E_NOTICE);
                $conn = mysqli_connect('localhost', 'root', '123456','rjjs');//连接数据库
                session_start(); //开启session
                if(!$_SESSION['islogin']){   
                    echo "<button class='btn-primary' id='sign'>登 录</button>";
                }
                else {                
                    $name = $_SESSION['username'];
                    $sql = "select nickname from userinfo where username = '$name'";  
                    $result = mysqli_query($conn, $sql);  
                    $nickname = mysqli_fetch_array($result);
                    echo $nickname[0];
                    echo "<button class='btn-primary' id='modifyPsw''>修改密码</button>";
                    echo "<button class='btn-primary' id='logout' onclick=' location.href = \"logout.php\"'>注 销</button>";
                }
            ?>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- 主体内容 -->
<div id="main">
    <div class="banner">
      <div class="container"> <span>Hello！ 同学，多敲代码少打撸！</span> </div>
    </div>
    <section id="about">
      <div class="container bc">
        <ol class="breadcrumb">
          <li> <a href="index.php">首页</a> </li>
          <li class="active">关于</li>
        </ol>
      </div>
      <div class="container mainsection">
        <div class="col-sm-12">
          <div class="jumbotron">
            <h1 style="text-align: center">注意！本页面自带高能BGM~~~</h1>
            <p>该站点主要用了HTML、CSS、JS、PHP并结合Bootstrap框架来编写，服务器是腾讯云的65元/月服务器，部分功能在手机屏下有浏览器兼容性问题，懒惰的管理员正在龟速优化中......关于留言帐号，请附上学号向管理员索取（管理员QQ：402890539），如果想要赞助服务器运营的，欢迎扫描下方二维码~~~QAQ</p>
            <img src="images/yzt.jpg" alt="">
          </div>
        </div>
      </div>
    </section>
</div>

<!-- 尾部 -->
<div id="footer">
    <span><a href="http://www.hzvtc.edu.cn/" target="_blank">©HZVTC</a> <a href="http://weibo.com/yuzhuoteng" target="_blank">@余卓腾</a></span>
    <span>2016 杭职软件技术协会</span>
</div>

<!-- 模态框 -->
<div class="modal fade" id="signModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
        <form action="logincheck.php" method="post" id="subCheck">
          <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
            <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名...">
          </div>
          <div class="input-group" style="margin-bottom:40px">
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码...">
          </div>
          <input id="signIn" type="submit" name="submit" value="登录" /> 
        </form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modifyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
        <form action="modifypsw.php" method="post" id="subCheck">
          <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input type="password" id="password1" name="password1" class="form-control" placeholder="请输入新密码...">
          </div>
          <div class="input-group" style="margin-bottom:40px">
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input type="password" id="password2" name="password2" class="form-control" placeholder="请再输入新密码...">
          </div>
          <input id="modify" type="submit" name="submit" value="修改" /> 
        </form>
      </div>
    </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script>
</body>
</html>