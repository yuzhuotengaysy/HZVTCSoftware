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
                <li class="active">公告详情</li>
            </ol>
        </div>
        <div class="container mainsection">
            <div class="row">
                <div class="col-sm-8 col-sm-push-4">
                    <h3>大学生就业意向调查问卷</h3>
                    <div class="noticeDate">
                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"><span>发布时间:2016-08-25</span></span>
                    </div>
                    <div class="noticeContent">
                        <form action="../questionnaire.php" method="post" id="subQuestionnaire">
                            <h4 class="well">
                                同学:<br>您好!<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;也许您是刚踏入大学校门的大一新生，也许您是忙于各种活动和学习的二三年级，也许您是正四处奔波的大四学生，但有一天，我们都需要面对就业的问题。本次调查旨在进一步探寻文理学子们的就业意向,希望能够得到您的支持和配合。
此项研究只限于对调查结果进行统计分析，保证不会泄漏任何个人信息。非常抱歉打搅您，敬请您协助我们这次调查，谢谢合作。
                            </h4>
                            <p>1.您的性别是:</p>
                            <label class="radio-inline">
                                <input type="radio" name="no1" id="inlineRadio1" value="男"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no1" id="inlineRadio2" value="女"> 女
                            </label>
                            <p>2.您所属年级:</p>
                            <label class="radio-inline">
                                <input type="radio" name="no2" id="inlineRadio1" value="大一"> 大一
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no2" id="inlineRadio2" value="大二"> 大二
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no2" id="inlineRadio3" value="大三"> 大三
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no2" id="inlineRadio4" value="大四"> 大四
                            </label>
                            <p>3.你对将来的就业有信心吗？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no3" id="inlineRadio1" value="有"> 有
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no3" id="inlineRadio2" value="一般"> 一般
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no3" id="inlineRadio3" value="没有"> 没有
                            </label>
                            <p>4.你的就业观念是？</p>
                            <label class="radio-inline">
                            <input type="radio" name="no4" id="inlineRadio1" value="有固定收入"> 有固定收入
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no4" id="inlineRadio2" value="先就业后择业"> 先就业后择业
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no4" id="inlineRadio3" value="在校深造"> 在校深造
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no4" id="inlineRadio4" value="自主创业"> 自主创业
                            </label>
                            <p>5.毕业后你会以哪种方式就业？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no5" id="inlineRadio1" value="亲属的安排"> 亲属的安排
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no5" id="inlineRadio2" value="自己去人才招聘市场"> 自己去人才招聘市场
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no5" id="inlineRadio3" value="自主创业"> 自主创业
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no5" id="inlineRadio4" value="满足自身兴趣爱好"> 满足自身兴趣爱好
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no5" id="inlineRadio5" value="为社会发展做贡献"> 为社会发展做贡献
                            </label>
                            <p>6.你在择业时优先考虑的主观因素？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no6" id="inlineRadio1" value="社会地位"> 社会地位
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no6" id="inlineRadio2" value="发展机会"> 发展机会
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no6" id="inlineRadio3" value="实现个人理想"> 实现个人理想
                            </label>
                            <p>7.你将来就业目标是：</p>
                            <label class="radio-inline">
                                <input type="radio" name="no7" id="inlineRadio1" value="国有企业"> 国有企业
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no7" id="inlineRadio2" value="私有企业"> 私有企业
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no7" id="inlineRadio3" value="中外合资"> 中外合资(包括外企独资)
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no7" id="inlineRadio4" value="事业单位"> 事业单位
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no7" id="inlineRadio5" value="自主创业"> 自主创业
                            </label>
                            <p>8.你理想的工作初期的工资是多少？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no8" id="inlineRadio1" value="2000元以下"> 2000元以下
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no8" id="inlineRadio2" value="2000~2500元"> 2000~2500元
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no8" id="inlineRadio3" value="2500~3500元"> 2500~3500元
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no8" id="inlineRadio4" value="3500元以上"> 3500元以上
                            </label>
                            <p>9.你对目前的就业形势怎么看？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no9" id="inlineRadio1" value="非常困难"> 非常困难
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no9" id="inlineRadio2" value="一般困难"> 一般困难
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no9" id="inlineRadio3" value="正常"> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no9" id="inlineRadio4" value="比较乐观"> 比较乐观
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no9" id="inlineRadio5" value="非常乐观"> 非常乐观
                            </label>
                            <p>10.你认为大学生就业难的主要原因是？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no10" id="inlineRadio1" value="缺乏实践技能和经验"> 缺乏实践技能和经验
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no10" id="inlineRadio2" value="就业期望过高"> 就业期望过高
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no10" id="inlineRadio3" value="供求不匹配"> 供求不匹配
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no10" id="inlineRadio4" value="其他"> 其他
                            </label>
                            <p>11.你认为解决就业问题的最好办法是？</p>
                            <label class="radio-inline">
                                <input type="radio" name="no11" id="inlineRadio1" value="调整个人心态,降低就业标准"> 调整个人心态,降低就业标准
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no11" id="inlineRadio2" value="学校与社会提供更好的就业指导与服务"> 学校与社会提供更好的就业指导与服务
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no11" id="inlineRadio3" value="大学期间重视自身能力的全面培养"> 大学期间重视自身能力的全面培养
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="no11" id="inlineRadio4" value="政府相关政策的支持"> 政府相关政策的支持
                            </label>
                            <p>12.你认为自己目前欠缺的素质主要是？（多选）</p>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no12[]" id="inlineCheckbox1" value="与人沟通协作的能力"> 与人沟通协作的能力
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no12[]" id="inlineCheckbox2" value="专业知识与技能"> 专业知识与技能
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no12[]" id="inlineCheckbox3" value="解决与应对问题的能力"> 解决与应对问题的能力
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no12[]" id="inlineCheckbox4" value="工作经验与社会阅历"> 工作经验与社会阅历
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no12[]" id="inlineCheckbox5" value="其他"> 其他
                            </label>
                            <p>13.你觉得近期你会为就业做哪些准备？（多选）</p>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no13[]" id="inlineCheckbox1" value="考证"> 考证
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no13[]" id="inlineCheckbox2" value="了解招聘信息"> 了解招聘信息
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no13[]" id="inlineCheckbox3" value="社会实践学习"> 社会实践学习
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no13[]" id="inlineCheckbox4" value="参加学生组织,提高工作能力"> 参加学生组织,提高工作能力
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="no13[]" id="inlineCheckbox5" value="努力学习专业知识"> 努力学习专业知识
                            </label>
                            <p>14.你现在的就业心态是：</p>
                            <textarea class="form-control" name="no14" rows="3"></textarea>
                            <p>15.如果让你重选学校，你会选择哪所学校，哪个专业？</p>
                            <textarea class="form-control" name="no15" rows="3"></textarea>
                            <p>16.你想在什么地方就业？</p>
                            <textarea class="form-control" name="no16" rows="3"></textarea>
                            <span>谢谢您的合作！祝您生活愉快！</span>
                            <div class="queBtn">
                                <input type="submit" value="提 交" onclick="alert('感谢您的提交！')">
                                <input type="button" value="查看结果" onclick=' location.href = "06-1.php"'>
                            </div>
                        </form>
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