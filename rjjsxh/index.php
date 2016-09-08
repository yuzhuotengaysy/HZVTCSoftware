<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="qc:admins" content="44603724676407513124636" />
<title>杭职软件技术协会</title>
<link rel="shortcut icon" href="huaji.ico"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/style.js"></script>
<?php
    header("Content-Type: text/html;charset=utf-8"); 
    error_reporting(E_ALL^E_NOTICE);
    $conn = mysqli_connect('localhost', 'root', '123456','rjjs');//连接数据库
    if (!$conn)
    {
        die('Could not connect: ' . mysql_error());
    }    
    mysqli_query($conn,'set name utf8');
    $sql = "SELECT count FROM  `visitor` WHERE ID = 1"; //查询sql语句
    $sql2 = "UPDATE `visitor` SET count = count +1 WHERE ID = 1"; //访问数加1sql语句
    mysqli_query($conn, $sql2);
    $res = mysqli_query($conn,$sql);
    $count = mysqli_fetch_array($res);
?>

</head>
<body>
<!-- 导航条 -->
<!-- <audio autoplay src="bgm/千本樱.mp3" ></audio> -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand logo" href="#">杭州职业技术学院软件技术协会</a> </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav nav-left">
        <li class="active"><a href="#">首页</a></li>
        <li><a href="noticelist.php">公告</a></li>
        <li><a href="data.php">资源</a></li>
        <li><a href="board/board.php">留言</a></li>
        <li><a href="about.php">关于</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
            <?php
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

<!-- 轮播组件 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="images/hzvtc00.jpg" alt="..." he>
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="images/hzvtc01.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="images/hzvtc02.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="editor-style-content">
    <p>
        <svg width="100%" height="50">
            <text font-family="microsoft yahei" font-size="20" y="40" x="600" fill="#33A4D5">
                <tspan>欢迎来到杭职软件技术协会站点~~~您是第 <?php echo $count[0] ?> 位访客QAQ</tspan>
                <animate attributename="x" values="100%;-800" begin="0s" dur="11s" repeatcount="indefinite">
                </animate>
             </text>
        </svg>
    </p>
</div>
<!-- 主体内容 -->
<div id="main">
	<div class="container">
        <div class="row">
            <div class="notice col-sm-6">
                <h3 class="title">
                    <span class="glyphicon glyphicon-bullhorn"></span>
                    新闻公告
                </h3>
                <div class="col-sm-12">
                    <table class="table table-hover table-striped table-condensed">
                        <tr>
                            <td><a href="noticedetail/07.php">软件协会报名</a> <span class="date">2016年8月29日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticedetail/06.php">大学生就业意向调查问卷</a> <span class="date">2016年8月25日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticedetail/05.php">自制五子棋测试版</a> <span class="date">2016年8月25日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticedetail/04.php">关于编程软件</a> <span class="date">2016年8月18日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticedetail/03.php">致新生——寝室总览</a> <span class="date">2016年8月11日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticedetail/02.php">第七届东忠杯程序设计大赛结果</a> <span class="date">2016年5月19日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticedetail/01.php">第七届东忠杯程序设计大赛</a> <span class="date">2016年5月18日</span></td>
                        </tr>
                        <tr>
                            <td><a href="noticelist.php" style="float: right">更多公告...</a></td>
                        </tr>
                    </table>
                </div>
                <h3 class="title">
                    <span class="glyphicon glyphicon-link"></span>
                    友情链接                   
                </h3>
                <div class="col-sm-12">
                	<table class="table table-condensed">
                        <tr>
                            <td><a href="http://www.hzvtc.edu.cn/">杭州职业技术学院官网</a> </td>
                        </tr>
                        <tr>
                            <td><a href="http://hzvtcoj.sinaapp.com/">杭州职业技术学院OJ</a> </td>
                        </tr>
                        <tr>
                            <td><a href="hoj/page.html">杭州职业技术学院OJ答案</a> </td>
                        </tr>
                        <tr>
                            <td><a href="hhttp://www.bootcss.com/">Bootstrap</a> </td>
                        </tr>
                        <tr>
                            <td><a href="http://w3school.com.cn/">W3School</a> </td>
                        </tr>
                        <tr>
                            <td><a href="http://amazeui.org/">Amaze UI</a> </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-sm-6">
                <h3 class="title">
                    <span class="glyphicon glyphicon-star"></span>
                    协会介绍
                </h3>
                <div class="well">
                	<p>这是一个基于软件技术专业的协会，旨在于帮助软件技术专业的同学们解决学习上的问题。</p>
                    <p>好了，我已经编不下去了，为了凑字数，只能瞎扯淡了。</p>
                    <p>软件技术是一个发展变化非常快的行业，软件人才要按照企业和领域需求来确定培养的方向。高校一方面保证课程设置与软件技术的发展基本同步；另一方面坚持利用转、合、撤、拆的原则，降低专业课程中理论教学的比例，加强针对性和实用性，优化课程结构，形成合理的、科学的课程体系；针对高职学生，学校坚持以就业为导向的指导思想，强调其技能培养，注重课程安排的合理性。
                    </p>
                    <p>字数差不多了，就这样了，下面附上总群。</p>
                    <span>16届软协QQ群:277761060</span>
                </div>
                <h3 class="title">
                    <span class="glyphicon glyphicon-file"></span>
                    资源链接
                </h3>
                <div class="col-sm-12" >
                    <table class="table table-hover table-striped table-condensed">
                        <tr>
                            <td><a href="http://www.cgown.com/cg/adobe">Adobe</a> <span class="date">2016年8月11日</span></td>
                        </tr>
                        <tr>
                            <td><a href="https://www.visualstudio.com/zh-cn/downloads/download-visual-studio-vs.aspx">Visual Studio</a> <span class="date">2016年8月11日</span></td>
                        </tr>
                        <tr>
                            <td><a href="https://www.jetbrains.com/">JetBrains</a> <span class="date">2016年8月11日</span></td>
                        </tr>
                        <tr>
                            <td><a href="https://www.teamviewer.com/zhCN/">TeamViewer</a> <span class="date">2016年8月11日</span></td>
                        </tr>
                        <tr>
                            <td><a href="data.php" style="float: right">更多资源...</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 尾部 -->
<div id="footer">
    <span><a href="http://www.hzvtc.edu.cn/" target="_blank">©HZVTC</a> <a href="http://weibo.com/yuzhuoteng" target="_blank">@余卓腾</a></span>
    <span>2016 杭职软件技术协会<span>——您是第<span style="color:#eb9316"> <?php echo $count[0] ?> </span>位访客</span></span>
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
<?php
    mysqli_close($conn);
?>
</html>