<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="utf-8"%>
<%@ include file="../main/connect.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>杭职软协后台管理系统</title>
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
    <link href="css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css-v=4.0.0.css" rel="stylesheet">
    <base target="_blank">
    <script language="javascript">
        /* 动态时间 */
        function disptime(){
            var time = new Date();
            var year = time.getFullYear();
            var month = time.getMonth() + 1;
            var day = time.getDate();
            var hour = time.getHours();
            var hour = time.getHours();
            var minute = time.getMinutes();
            var second = time.getSeconds();
            if(minute<10) minute = "0" + minute;
            if(second<10) second = "0" + second;
            document.getElementById("BJTime").innerHTML =year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
            setTimeout("disptime()", 1000);
        }
    </script>
</head>

<body class="gray-bg" onload="disptime()">
    <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-warning" style="font-size:16px;color:#333">
                欢迎来到杭职软协后台管理系统......
            </blockquote>
            <hr>
        </div>
        <div class="col-sm-3">
            <h2>你好，管理员</h2>
            <small>若想赞助请扫描以下二维码：</small>
            <br>
            <br>
            <img src="img/yzt.png" width="100%" style="max-width:264px;">
            <br>
        </div>
        <div class="col-sm-5">
            <h2>
                本系统基于H+框架
            </h2>
            <p>H+是一个完全响应式，基于Bootstrap3.3.5最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.4)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如<b>网站管理后台</b>，<b>网站会员中心</b>，<b>CMS</b>，<b>CRM</b>，<b>OA</b>等等，当然，您也可以对她进行深度定制，以做出更强系统。</p>
            <p>
                <b>当前H+版本：</b>v4.0.0
            </p>
            <br>
            <p>
                <a class="btn btn-success btn-outline" href="http://shang.qq.com/wpa/qunwpa?idkey=5cb9653e5c0aad4e81a8a5bb57459d37060b2d96a985f0f0e19b242dbb1afacd" target="_blank">
                    <i class="fa fa-qq"> </i> 联系我们
                </a>
            </p>
        </div>
        <div class="col-sm-4">
            <h4>本系统的主要信息：</h4>
            <ul>
                <li>操作系统：Windows Server 2012 R2</li>
                <li>运行环境：Tomcat/6.0 (Win64) JSP</li>
                <li>JSP运行方式：apacheTomcat6.0</li>
                <li>上传附件限制：5M</li>
                <li>北京时间：<span id="BJTime"></span></li>
                <li>服务器域名/IP：www.thomasyzt.cn:888</li>
                <li>当前IP：<%=request.getRemoteAddr()%></li>
                <li>更多……</li>
            </ul>
        </div>
    </div>

    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>关于开发</h5>
                    </div>
                    <div class="ibox-content">
                        <p>软协站点由Thomas单独开发</p>
                        <p>开发该站点所用到的东东：</p>
                        <ol>
                            <li>HTML、CSS、Javascript、JQuery前端语言</li>
                            <li>JavaServerPage后台语言</li>
                            <li>Bootstrap、H+框架</li>
                            <li>Tencent Cloud服务器</li>
                        </ol>
                    </div>
                </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>联系信息</h5>

                    </div>
                    <div class="ibox-content">
                        <p><i class="fa fa-send-o"></i> 微博：<a href="http://weibo.com/yuzhuoteng">Thomas</a>
                        </p>
                        <p><i class="fa fa-qq"></i> QQ：<a href="javascript:0">402890539</a>
                        </p>
                        <p><i class="fa fa-weixin"></i> 微信：<a href="javascript:0">yuzhuotengaysy</a>
                        </p>
                        <p><i class="fa fa-credit-card"></i> 支付宝：<a href="javascript:0" class="支付宝信息">15967772136 / *卓腾</a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>更新日志</h5>
                    </div>
                    <div class="ibox-content no-padding">
                        <div class="panel-body">
                            <div class="panel-group" id="version">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v11">v2.0.0</a><code class="pull-right">2016.10.01</code>
                                            </h4>
                                    </div>
                                    <div id="v11" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <ol>
                                                <li>替换了后台系统的模板</li>
                                                <li>修复了选中其他复选框后点单个删除会将其删除的BUG</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v10">v1.0.0</a><code class="pull-right">2016.09.23</code>
                                            </h4>
                                    </div>
                                    <div id="v10" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ol>
                                                <li>正式发布杭职软协后台管理系统</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>其他</h5>
                    </div>
                    <div class="ibox-content">
                        <p>该系统可以做什么？</p>
                        <ol>
                            <li>用户管理</li>
                            <li>公告管理</li>
                            <li>资源管理</li>
                            <li>留言管理</li>
                            <li>网站设置</li>
                            <li>……</li>
                        </ol>
                        <hr>
                      

                    </div>
                </div>
            </div>
        </div>
    </div>
 
    <script src="js/jquery.min.js-v=2.1.4.js"></script>
    <script src="js/bootstrap.min.js-v=3.3.5.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>
    <script src="js/content.min.js"></script>
    <script src="js/welcome.min.js"></script>
</body>

</html>