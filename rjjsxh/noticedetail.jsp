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
                <li class="active"><a href="noticelist.jsp">公告</a></li>
                <li><a href="data.jsp">资源</a></li>
                <li><a href="board.jsp">留言</a></li>
                <li><a href="about.jsp">关于</a></li>
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
        <div class="container">
            <span><%@ include file="main/getTime.jsp" %></span>
        </div>
    </div>
    <section  id="noticeDetail">
        <div class="container">
            <ol class="breadcrumb">
                <li>
                    <a href="index.jsp">首页</a>
                </li>
                <li>
                    <a href="noticelist.jsp">系统公告</a>
                </li>
                <li class="active">公告详情</li>
            </ol>
        </div>
        
        <div class="container mainsection">
            <div class="row">
                <div class="col-sm-8 col-sm-push-4">
                    <%
                        String id = request.getParameter("id");             //获取公告的ID
                        String sql = "select * from notice where notid = " + id;
                        ResultSet res = stmt.executeQuery(sql);
                        res.next();
                        String noticetime = res.getString(5); 
                        noticetime = noticetime.substring(0,10);
                    %>
                    <h3><%=res.getString(2)%></h3>
                    <div class="noticeDate">
                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"><span>发布时间:<%=noticetime%></span></span> 
                        <span class="glyphicon glyphicon-user" aria-hidden="true"><span>发布人:<%=res.getString(3)%></span></span>
                    </div>
                    <div class="noticeContent">
                        <p><%=res.getString(4)%></p>
                    </div>
                </div>
                <div class="well col-sm-4 col-sm-pull-8 ">
                    <table class="table table-condensed">
                        <thead>
                        <tr>
                            <th>
                                <span class="glyphicon glyphicon-list" aria-hidden="true"><span>最新公告</span></span>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            res = stmt.executeQuery("select * from notice order by nottime desc");
                            int count = 8;
                            while(count>=0 && res.next()){
                                String time = res.getString(5);      
                                time = time.substring(0, 11);
                        %>
                            <tr>
                                <td><a href="noticedetail.jsp?id=<%=res.getInt(1)%>"><%=res.getString(2)%></a></td>
                            </tr>
                        <%
                            count--;}
                        %>
                        <tr>
                            <td><a href="noticelist.jsp" style="float: right">更多公告...</a></td>
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
<%@ include file="main/modal.jsp" %>
<% conn.close(); %>
<script src="js/bootstrap.js"></script>
</body>
</html>
