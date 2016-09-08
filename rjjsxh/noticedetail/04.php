<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>杭职软件技术协会</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script src="../js/jquery-1.8.3.js"></script>
    <script src="../js/jquery-ui-1.9.2.custom.js"></script>
    <script src="../js/style.js"></script>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="navbar-brand logo" href="#">杭州职业技术学院软件技术协会</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav nav-left">
                <li><a href="../index.php">首页</a></li>
                <li class="active"><a href="../noticelist.php">公告</a></li>
                <li><a href="../data.php">资源</a></li>
                <li><a href="../board/board.php">留言</a></li>
                <li><a href="../about.php">关于</a></li>
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
                        echo "<button class='btn-primary' id='logout' onclick=' location.href = \"../logout.php\"'>注 销</button>";
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
        <div class="container">
            <span>Hello！ 同学，多敲代码少打撸！</span>
        </div>
    </div>
    <section  id="noticeDetail">
        <div class="container">
            <ol class="breadcrumb">
                <li>
                    <a href="../index.php">首页</a>
                </li>
                <li>
                    <a href="../noticelist.php">系统公告</a>
                </li>
                <li class="active">公告详情</li>
            </ol>
        </div>
        <div class="container mainsection">
            <div class="row">
                <div class="col-sm-8 col-sm-push-4">
                    <h3>关于编程软件</h3>
                    <div class="noticeDate">
                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"><span>发布时间:2016-08-18</span></span>
                    </div>
                    <div class="noticeContent">
                        <h3>这是关于各类语言使用编程软件的一个推荐</h3>
                        <h4>Java</h4>
                        <p>Eclipse<img src="../images/notice/04-1.jpg" alt="" width="50px"></p>
                        <h4>Html、CSS、JS</h4>
                        <p>DreamWeaver<img src="../images/notice/04-2.jpg" alt="" width="50px">、WebStorm<img src="../images/notice/04-3.jpg" alt="" width="50px"></p>
                        <h4>C、C++</h4>
                        <p>C-Free<img src="../images/notice/04-4.jpg" alt="" width="50px">、Visual Studio<img src="../images/notice/04-5.jpg" alt="" width="50px"></p>
                        <h4>PHP</h4>
                        <p>NetBeans<img src="../images/notice/04-6.jpg" alt="" width="50px">、PhpStorm<img src="../images/notice/04-7.jpg" alt="" width="50px"></p>
                    </div>
                </div>
                <div class="well col-sm-4 col-sm-pull-8 ">
                    <table class="table table-hover table-condensed">
                        <thead>
                        <tr>
                            <th>
                                <span class="glyphicon glyphicon-list" aria-hidden="true"><span>最新公告</span></span>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><a href="07.php">软件协会报名</a></td>
                        </tr>
                        <tr>
                            <td><a href="06.php">大学生就业意向调查问卷</a></td>
                        </tr>
                        <tr>
                            <td><a href="05.php">自制五子棋测试版</a></td>
                        </tr>
                        <tr>
                            <td><a href="04.php">关于编程软件</a></td>
                        </tr>
                        <tr>
                            <td><a href="03.php">致新生——寝室总览</a></td>
                        </tr>
                        <tr>
                            <td><a href="02.php">第七届东忠杯程序设计大赛结果</a></td>
                        </tr>
                        <tr>
                            <td><a href="01.php">第七届东忠杯程序设计大赛</a></td>
                        </tr>
                        <tr>
                            <td><a href="../noticelist.php" style="float: right">更多公告...</a></td>
                        </tr>
                        </tbody>
                    </table>
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
                <form action="../logincheck.php" method="post" id="subCheck">
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
                <form action="../modifypsw.php" method="post" id="subCheck">
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
<script src="../js/bootstrap.min.js"></script>
</body>
</html>