<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="main/connect.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><%@ include file="main/getTitle.jsp" %></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="huaji.ico"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/login.js"></script>

</head>
  
<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand logo" href="#">杭职软件技术协会</a> </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav nav-left">
        <li class="active"><a href="#">首页</a></li>
        <li><a href="noticelist.jsp">公告</a></li>
        <li><a href="data.jsp">资源</a></li>
        <li><a href="board.jsp">留言</a></li>
        <li><a href="about.jsp">关于</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
		      <%@ include file="main/sign.jsp" %>
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
                <tspan>
                  欢迎来到杭职软件技术协会站点~~~您是第
                    <%
                      stmt.executeUpdate("update `visitors` set visnum = visnum + 1 where visid = 1");
                      ResultSet res = stmt.executeQuery("select visnum from `visitors` where visid = 1");
                      res.next();
                      out.print(res.getString("visnum"));
                    %>
                  位访客QAQ
                </tspan>
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
                        <%                            
                            int count = 8;
                            String sql = "select * from notice order by nottime desc";
                            res = stmt.executeQuery(sql);
                            while(count>0 && res.next()){
                                String noticetime = res.getString(5);      
                                noticetime = noticetime.substring(0, 11);                      
                        %>
                            <tr>
                                <td><a href="noticedetail.jsp?id=<%=res.getString(1)%>"><%=res.getString(2)%></a><span class="date"><%=noticetime%></span></td>
                            </tr>
                        <%
                            count--;}
                        %>
                        <tr>
                            <td><a href="noticelist.jsp" style="float: right">更多公告...</a></td>
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
                            <td><a href="http://hzvtcoj.sinaapp.com/" target="_blank">杭州职业技术学院OJ</a> </td>
                        </tr>
                        <tr>
                            <td><a href="hoj/page.html" target="_blank">杭州职业技术学院OJ答案</a> </td>
                        </tr>
                        <tr>
                            <td><a href="http://www.bootcss.com/" target="_blank">Bootstrap</a> </td>
                        </tr>
                        <tr>
                            <td><a href="http://w3school.com.cn/" target="_blank">W3School</a> </td>
                        </tr>
                        <tr>
                            <td><a href="https://github.com/" target="_blank">GitHub</a> </td>
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
                    <span>16届软协QQ群:277761060<a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=5cb9653e5c0aad4e81a8a5bb57459d37060b2d96a985f0f0e19b242dbb1afacd"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="2016软协搞事情分部" title="2016软协搞事情分部"></a></span>
                </div>
                <h3 class="title">
                    <span class="glyphicon glyphicon-file"></span>
                    资源链接
                </h3>
                <div class="col-sm-12" >
                    <table class="table table-hover table-striped table-condensed">
                        <%
                            sql = "select * from data order by datatime desc";
                            res = stmt.executeQuery(sql);
                            count = 5;
                            while(count>0 && res.next()){
                                String datatime = res.getString(4);      
                                datatime = datatime.substring(0, 11);   
                        %>
                            <tr>
                                <td><a href="<%=res.getString(3)%>" target="_blank"><%=res.getString(2)%></a><span class="date"><%=datatime%></span></td>
                            </tr>
                        <%
                           count--;}
                        %>
                        <tr>
                            <td><a href="data.jsp" style="float: right">更多资源...</a></td>
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
    <span>2016 杭职软件技术协会</span>
</div>
<!-- 模态框 -->
<%@ include file="main/modal.jsp" %>
<% conn.close(); %>
<script src="js/bootstrap.js"></script>
</body>
</html>
