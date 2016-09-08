<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>杭职软件技术协会</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/questionnaire.css">
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
                <li>
                    <a href="06.php">公告详情</a>
                </li>
                <li class="active">查看结果</li>
            </ol>
        </div>
        <div class="container mainsection">
            <div class="row">
                <script>
                    //绘制饼图
                    function drawCircle(canvasId, data_arr, color_arr, text_arr)
                    {
                        var c = document.getElementById(canvasId);
                        var ctx = c.getContext("2d");
                        var radius = c.height / 2 - 20; //半径
                        var ox = radius + 20, oy = radius + 20; //圆心
                        var width = 30, height = 10; //图例宽和高
                        var posX = ox * 2 + 20, posY = 30;   //
                        var textX = posX + width + 5, textY = posY + 10;
                        var startAngle = 0; //起始弧度
                        var endAngle = 0;   //结束弧度
                        for (var i = 0; i < data_arr.length; i++) {
                            //绘制饼图
                            endAngle = endAngle + data_arr[i] * Math.PI * 2; //结束弧度
                            ctx.fillStyle = color_arr[i];
                            ctx.beginPath();
                            ctx.moveTo(ox, oy); //移动到到圆心
                            ctx.arc(ox, oy, radius, startAngle, endAngle, false);
                            ctx.closePath();
                            ctx.fill();
                            startAngle = endAngle; //设置起始弧度

                            //绘制比例图及文字
                            ctx.fillStyle = color_arr[i];
                            ctx.fillRect(posX, posY + 20 * i, width, height);
                            ctx.moveTo(posX, posY + 20 * i);
                            ctx.font = 'bold 12px 微软雅黑';    //斜体 30像素 微软雅黑字体
                            ctx.fillStyle = color_arr[i]; //"#000000";
                            var percent = text_arr[i] + "：" + 100 * data_arr[i] + "%";
                            ctx.fillText(percent, textX, textY + 20 * i);
                        }
                    }
                    function init() {
                        //比例数据和颜色
                        <?php
                            $conn = mysqli_connect('localhost', 'root', '123456','rjjs');//连接数据库
                            mysqli_query($conn,"set character set 'utf8'");
                            //总记录数
                            $sql = "SELECT count(*) FROM questionnaire";
                            $result = mysqli_query($conn, $sql);
                            $maxNum = mysqli_fetch_array($result);
                            //题库
                            $no = array
                            (
                                array("",""),
                                array("男","女"),
                                array("大一","大二","大三","大四"),
                                array("有","一般","没有"),
                                array("有固定收入","先就业后择业","在校深造","自主创业"),
                                array("亲属的安排","自己去人才招聘市场","自主创业","满足自身兴趣爱好","为社会发展做贡献"),
                                array("社会地位","发展机会","实现个人理想"),
                                array("国有企业","私有企业","中外合资","事业单位","自主创业"),
                                array("2000元以下","2000~2500元","2500~3500元","3500元以上"),
                                array("非常困难","一般困难","正常","比较乐观","非常乐观"),
                                array("缺乏实践技能和经验","就业期望过高","供求不匹配","其他"),
                                array("调整个人心态,降低就业标准","学校与社会提供更好的就业指导与服务","大学期间重视自身能力的全面培养","政府相关政策的支持"),
                                array("与人沟通协作的能力","专业知识与技能","解决与应对问题的能力","工作经验与社会阅历","其他"),
                                array("考证","了解招聘信息","社会实践学习","参加学生组织,提高工作能力","努力学习专业知识"),
                            );
                            for($i = 1; $i <= 2; $i++){ //总题目数量
                                for($j = 0; $j < sizeof($no[$i]); $j++){ //选项数量
                                    $name = $no[$i][$j];
                                    $sql = "SELECT count(*) FROM questionnaire WHERE no$i = '$name';";
                                    $result = mysqli_query($conn, $sql);
                                    $num = mysqli_fetch_array($result);
                                    //选项所占百分比
                                    if($j == 0){
                                        $a = $num[0] / $maxNum[0];
                                    } else if($j == 1){
                                        $b = $num[0] / $maxNum[0];
                                    } else if($j == 2){
                                        $c = $num[0] / $maxNum[0];
                                    } else if($j == 3){
                                        $d = $num[0] / $maxNum[0];
                                    } else if($j == 4){
                                        $e = $num[0] / $maxNum[0];
                                    }
                                    //echo $sql.' ';
                                }
                            }
                        ?>
                        for (var i = 1; i <= 3; i++){
                            if(i == 1){
                                var data_arr = [<?php echo $a; ?>, <?php echo $b; ?>]; //各选项所占百分比
                                var color_arr = ["#765564", "#FFAA00"]; //各选项颜色
                                var text_arr = ["男", "女"];  //各选项内容
                                drawCircle('pic1', data_arr, color_arr, text_arr);  //画图
                            }
                            if(i == 2){
                                var data_arr = [<?php echo $a; ?>, <?php echo $b; ?>, <?php echo $c; ?>, <?php echo $d; ?>]; //各选项所占百分比
                                var color_arr = ["#765564", "#FFAA00", "#534544", "#535797"]; //各选项颜色
                                var text_arr = ["大一", "大二", "大三", "大四"];  //各选项内容
                                drawCircle('pic2', data_arr, color_arr, text_arr);  //画图
                            }
                        }
                    }
                    //页面加载时执行init()函数
                    window.onload = init;
                </script>
                <canvas id="pic1" width="350" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic2" width="350" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic3" width="350" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic4" width="350" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic5" width="350" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic6" width="350" height="200" style="border:2px solid #ccc;" ></canvas>
            </div>
        </div>
    </section>
</div>


<!-- 尾部 -->
<div id="footer">
    <span>版权所有:余卓腾 </span>
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