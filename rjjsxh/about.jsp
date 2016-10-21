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
        <li><a href="index.jsp">首页</a></li>
        <li><a href="noticelist.jsp">公告</a></li>
        <li><a href="data.jsp">资源</a></li>
        <li><a href="board.jsp">留言</a></li>
        <li class="active"><a href="#">关于</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
            <%@ include file="main/sign.jsp" %>    
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- 主体内容 -->
<div id="main">
    <div class="banner">
      <div class="container"> <span><%@ include file="main/getTime.jsp" %></span> </div>
    </div>
    <section>
      <div class="container bc">
        <ol class="breadcrumb">
          <li> <a href="index.jsp">首页</a> </li>
          <li class="active">关于</li>
        </ol>
      </div>
      <div class="container mainsection">
        <div class="col-sm-12">
          <div class="jumbotron about">
            <p>本站关键字:<%=abokeyword%></p>      
            <p>联系人:<%=abocontact%></p>
            <p>电话:<%=abotel%></p>
            <p>站长邮箱:<%=aboemail%></p>
            <p>地址:<%=aboaddress%></p>
            <p>对访客的话:<%=abodescription%></p>
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
<%@ include file="main/modal.jsp" %>
<% conn.close(); %>
<script src="js/bootstrap.js"></script>
</body>
</html>
