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
                            ctx.fillRect(posX-25, posY + 20 * i, width, height);
                            ctx.moveTo(posX-25, posY + 20 * i);
                            ctx.font = 'bold 12px 微软雅黑';    //斜体 30像素 微软雅黑字体
                            ctx.fillStyle = color_arr[i]; //"#000000";
                            var percent = text_arr[i] + "：" + 100 * data_arr[i] + "%";
                            ctx.fillText(percent, textX-25, textY + 20 * i);
                        }
                    }
                    function init() {
                        //比例数据和颜色
                        var color1 = '#FF6600';
                        var color2 = '#66CCFF';
                        var color3 = '#6600FF';
                        var color4 = '#CC33FF';
                        var color5 = '#CC0033';
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
                            $name = $no[1][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no1 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num11 = mysqli_fetch_array($result);
                            $res11 = round($num11[0] /  $maxNum[0],2);
                            $name = $no[1][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no1 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num12 = mysqli_fetch_array($result);
                            $res12 = round($num12[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res11; ?>, <?php echo $res12; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2]; //各选项颜色
                        var text_arr = ["男", "女"];  //各选项内容
                        drawCircle('pic1', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[2][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no2 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num21 = mysqli_fetch_array($result);
                            $res21 = round($num21[0] /  $maxNum[0],2);
                            $name = $no[2][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no2 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num22 = mysqli_fetch_array($result);
                            $res22 = round($num22[0] /  $maxNum[0],2);
                            $name = $no[2][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no2 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num23 = mysqli_fetch_array($result);
                            $res23 = round($num23[0] /  $maxNum[0],2);
                            $name = $no[2][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no2 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num24 = mysqli_fetch_array($result);
                            $res24 = round($num24[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res21; ?>, <?php echo $res22; ?>, <?php echo $res23; ?>, <?php echo $res24; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4]; //各选项颜色
                        var text_arr = ["大一", "大二", "大三", "大四"];  //各选项内容
                        drawCircle('pic2', data_arr, color_arr, text_arr);  //画图
                        <?php
                        $name = $no[3][0];
                        $sql = "SELECT count(*) FROM questionnaire WHERE no3 = '$name';";
                        $result = mysqli_query($conn, $sql);
                        $num31 = mysqli_fetch_array($result);
                        $res31 = round($num31[0] /  $maxNum[0],2);
                        $name = $no[3][1];
                        $sql = "SELECT count(*) FROM questionnaire WHERE no3 = '$name';";
                        $result = mysqli_query($conn, $sql);
                        $num32 = mysqli_fetch_array($result);
                        $res32 = round($num32[0] /  $maxNum[0],2);
                        $name = $no[3][2];
                        $sql = "SELECT count(*) FROM questionnaire WHERE no3 = '$name';";
                        $result = mysqli_query($conn, $sql);
                        $num33 = mysqli_fetch_array($result);
                        $res33 = round($num33[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res31; ?>, <?php echo $res32; ?>, <?php echo $res33; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3]; //各选项颜色
                        var text_arr = ["有", "一般", "没有"];  //各选项内容
                        drawCircle('pic3', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[4][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no4 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num41 = mysqli_fetch_array($result);
                            $res41 = round($num41[0] /  $maxNum[0],2);
                            $name = $no[4][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no4 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num42 = mysqli_fetch_array($result);
                            $res42 = round($num42[0] /  $maxNum[0],2);
                            $name = $no[4][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no4 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num43 = mysqli_fetch_array($result);
                            $res43 = round($num43[0] /  $maxNum[0],2);
                            $name = $no[4][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no4 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num44 = mysqli_fetch_array($result);
                            $res44 = round($num44[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res41; ?>, <?php echo $res42; ?>, <?php echo $res43; ?>, <?php echo $res44; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4]; //各选项颜色
                        var text_arr = ["有固定收入","先就业后择业","在校深造","自主创业"];  //各选项内容
                        drawCircle('pic4', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[5][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no5 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num51 = mysqli_fetch_array($result);
                            $res51 = round($num51[0] /  $maxNum[0],2);
                            $name = $no[5][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no5 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num52 = mysqli_fetch_array($result);
                            $res52 = round($num52[0] /  $maxNum[0],2);
                            $name = $no[5][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no5 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num53 = mysqli_fetch_array($result);
                            $res53 = round($num53[0] /  $maxNum[0],2);
                            $name = $no[5][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no5 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num54 = mysqli_fetch_array($result);
                            $res54 = round($num54[0] /  $maxNum[0],2);
                            $name = $no[5][4];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no5 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num55 = mysqli_fetch_array($result);
                            $res55 = round($num55[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res51; ?>, <?php echo $res52; ?>, <?php echo $res53; ?>, <?php echo $res54; ?>, <?php echo $res55; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4, color5]; //各选项颜色
                        var text_arr = ["亲属的安排","自己去人才招聘市场","自主创业","满足自身兴趣爱好","为社会发展做贡献"];  //各选项内容
                        drawCircle('pic5', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[6][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no6 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num61 = mysqli_fetch_array($result);
                            $res61 = round($num61[0] /  $maxNum[0],2);
                            $name = $no[6][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no6 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num62 = mysqli_fetch_array($result);
                            $res62 = round($num62[0] /  $maxNum[0],2);
                            $name = $no[6][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no6 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num63 = mysqli_fetch_array($result);
                            $res63 = round($num63[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res61; ?>, <?php echo $res62; ?>, <?php echo $res63; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3]; //各选项颜色
                        var text_arr = ["社会地位","发展机会","实现个人理想"];  //各选项内容
                        drawCircle('pic6', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[7][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no7 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num71 = mysqli_fetch_array($result);
                            $res71 = round($num71[0] /  $maxNum[0],2);
                            $name = $no[7][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no7 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num72 = mysqli_fetch_array($result);
                            $res72 = round($num72[0] /  $maxNum[0],2);
                            $name = $no[7][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no7 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num73 = mysqli_fetch_array($result);
                            $res73 = round($num73[0] /  $maxNum[0],2);
                            $name = $no[7][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no7 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num74 = mysqli_fetch_array($result);
                            $res74 = round($num74[0] /  $maxNum[0],2);
                            $name = $no[7][4];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no7 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num75 = mysqli_fetch_array($result);
                            $res75 = round($num75[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res71; ?>, <?php echo $res72; ?>, <?php echo $res73; ?>, <?php echo $res74; ?>, <?php echo $res75; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4, color5]; //各选项颜色
                        var text_arr = ["国有企业","私有企业","中外合资","事业单位","自主创业"];  //各选项内容
                        drawCircle('pic7', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[8][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no8 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num81 = mysqli_fetch_array($result);
                            $res81 = round($num81[0] /  $maxNum[0],2);
                            $name = $no[8][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no8 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num82 = mysqli_fetch_array($result);
                            $res82 = round($num82[0] /  $maxNum[0],2);
                            $name = $no[8][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no8 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num83 = mysqli_fetch_array($result);
                            $res83 = round($num83[0] /  $maxNum[0],2);
                            $name = $no[8][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no8 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num84 = mysqli_fetch_array($result);
                            $res84 = round($num84[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res81; ?>, <?php echo $res82; ?>, <?php echo $res83; ?>, <?php echo $res84; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4]; //各选项颜色
                        var text_arr = ["2000元以下","2000~2500元","2500~3500元","3500元以上"];  //各选项内容
                        drawCircle('pic8', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[9][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no9 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num91 = mysqli_fetch_array($result);
                            $res91 = round($num91[0] /  $maxNum[0],2);
                            $name = $no[9][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no9 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num92 = mysqli_fetch_array($result);
                            $res92 = round($num92[0] /  $maxNum[0],2);
                            $name = $no[9][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no9 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num93 = mysqli_fetch_array($result);
                            $res93 = round($num93[0] /  $maxNum[0],2);
                            $name = $no[9][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no9 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num94 = mysqli_fetch_array($result);
                            $res94 = round($num94[0] /  $maxNum[0],2);
                            $name = $no[9][4];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no9 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num95 = mysqli_fetch_array($result);
                            $res95 = round($num95[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res91; ?>, <?php echo $res92; ?>, <?php echo $res93; ?>, <?php echo $res94; ?>, <?php echo $res95; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4, color5]; //各选项颜色
                        var text_arr = ["非常困难","一般困难","正常","比较乐观","非常乐观"];  //各选项内容
                        drawCircle('pic9', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[10][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no10 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num101 = mysqli_fetch_array($result);
                            $res101 = round($num101[0] /  $maxNum[0],2);
                            $name = $no[10][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no10 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num102 = mysqli_fetch_array($result);
                            $res102 = round($num102[0] /  $maxNum[0],2);
                            $name = $no[10][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no10 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num103 = mysqli_fetch_array($result);
                            $res103 = round($num103[0] /  $maxNum[0],2);
                            $name = $no[10][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no10 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num104 = mysqli_fetch_array($result);
                            $res104 =round($num104[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res101; ?>, <?php echo $res102; ?>, <?php echo $res103; ?>, <?php echo $res104; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4]; //各选项颜色
                        var text_arr = ["缺乏实践技能和经验","就业期望过高","供求不匹配","其他"];  //各选项内容
                        drawCircle('pic10', data_arr, color_arr, text_arr);  //画图
                        <?php
                            $name = $no[11][0];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no11 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num111 = mysqli_fetch_array($result);
                            $res111 = round($num111[0] /  $maxNum[0],2);
                            $name = $no[11][1];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no11 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num112 = mysqli_fetch_array($result);
                            $res112 = round($num112[0] /  $maxNum[0],2);
                            $name = $no[11][2];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no11 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num113 = mysqli_fetch_array($result);
                            $res113 = round($num103[0] /  $maxNum[0],2);
                            $name = $no[11][3];
                            $sql = "SELECT count(*) FROM questionnaire WHERE no11 = '$name';";
                            $result = mysqli_query($conn, $sql);
                            $num114 = mysqli_fetch_array($result);
                            $res114 = round($num114[0] /  $maxNum[0],2);
                        ?>
                        var data_arr = [<?php echo $res111; ?>, <?php echo $res112; ?>, <?php echo $res113; ?>, <?php echo $res114; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4]; //各选项颜色
                        var text_arr = ["调整个人心态,降低就业标准","学校与社会提供更好的就业指导与服务","大学期间重视自身能力的全面培养","政府相关政策的支持"];  //各选项内容
                        drawCircle('pic11', data_arr, color_arr, text_arr);  //画图
                        <?php
                        $res121 = 0;$res122 = 0;$res123 = 0;$res124 = 0;$res125 = 0;$sum = 0;
                        for($i = 1; $i <= $maxNum[0]; $i++){
                            $sql = "SELECT no12 FROM questionnaire WHERE id = $i;";
                            $result = mysqli_query($conn, $sql);
                            $num = mysqli_fetch_array($result);
                            $no12 = explode(' ',$num[0]);
                            for($j = 0; $j < sizeof($no12); $j++){
                                $name1 = $no[12][0];
                                $name2 = $no[12][1];
                                $name3 = $no[12][2];
                                $name4 = $no[12][3];
                                $name5 = $no[12][4];
                                if($no12[$j] == $name1){
                                    $res121++;
                                } else if($no12[$j] == $name2){
                                    $res122++;
                                } else if($no12[$j] == $name3){
                                    $res123++;
                                } else if($no12[$j] == $name4){
                                    $res124++;
                                } else if($no12[$j] == $name5){
                                    $res125++;
                                }
                            }
                            $sum = $res121 + $res122 + $res123 + $res124 + $res125;
                            $res121 = round($res121 / $sum,2);
                            $res122 = round($res122 / $sum,2);
                            $res123 = round($res123 / $sum,2);
                            $res124 = round($res124 / $sum,2);
                            $res125 = round($res125 / $sum,2);
                        }
                        ?>
                        var data_arr = [<?php echo $res121; ?>, <?php echo $res122; ?>, <?php echo $res123; ?>, <?php echo $res124; ?>, <?php echo $res125; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4, color5]; //各选项颜色
                        var text_arr = ["与人沟通协作的能力","专业知识与技能","解决与应对问题的能力","工作经验与社会阅历","其他"];  //各选项内容
                        drawCircle('pic12', data_arr, color_arr, text_arr);  //画图
                        <?php
                        $res131 = 0;$res132 = 0;$res133 = 0;$res134 = 0;$res135 = 0;$sum = 0;
                        for($i = 1; $i <= $maxNum[0]; $i++){
                            $sql = "SELECT no13 FROM questionnaire WHERE id = $i;";
                            $result = mysqli_query($conn, $sql);
                            $num = mysqli_fetch_array($result);
                            $no13 = explode(' ',$num[0]);
                            for($j = 0; $j < sizeof($no13); $j++){
                                $name1 = $no[13][0];
                                $name2 = $no[13][1];
                                $name3 = $no[13][2];
                                $name4 = $no[13][3];
                                $name5 = $no[13][4];
                                if($no13[$j] == $name1){
                                    $res131++;
                                } else if($no13[$j] == $name2){
                                    $res132++;
                                } else if($no13[$j] == $name3){
                                    $res133++;
                                } else if($no13[$j] == $name4){
                                    $res134++;
                                } else if($no13[$j] == $name5){
                                    $res135++;
                                }
                            }
                            $sum = $res131 + $res132 + $res133 + $res134 + $res135;
                            $res131 = round($res131 / $sum,2);
                            $res132 = round($res132 / $sum,2);
                            $res133 = round($res133 / $sum,2);
                            $res134 = round($res134 / $sum,2);
                            $res135 = round($res135 / $sum,2);
                        }
                        ?>
                        var data_arr = [<?php echo $res131; ?>, <?php echo $res132; ?>, <?php echo $res133; ?>, <?php echo $res134; ?>, <?php echo $res135; ?>]; //各选项所占百分比
                        var color_arr = [color1, color2, color3, color4, color5]; //各选项颜色
                        var text_arr = ["考证","了解招聘信息","社会实践学习","参加学生组织,提高工作能力","努力学习专业知识"];  //各选项内容
                        drawCircle('pic13', data_arr, color_arr, text_arr);  //画图
                    }
                    //页面加载时执行init()函数
                    window.onload = init;
                </script>
                <canvas id="pic1" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic2" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic3" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic4" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic5" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic6" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic7" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic8" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic9" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic10" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic11" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic12" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
                <canvas id="pic13" width="382" height="200" style="border:2px solid #ccc;" ></canvas>
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