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
        <li class="active"><a href="#">公告</a></li>
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
  <section id="list">
    <div class="container bc">
      <ol class="breadcrumb">
        <li> <a href="index.jsp">首页</a> </li>
        <li class="active">系统公告</li>
      </ol>
    </div>
    <div class="container mainsection">
      <div class="col-sm-12">
        <table class="table table-hover table-striped table-condensed">
          <thead>
            <tr>
              <th>
                  <span class="glyphicon glyphicon-list" aria-hidden="true"><span>公告标题</span></span> <span class="glyphicon glyphicon-calendar" aria-hidden="true"><span>发表时间</span></span>
              </th>
            </tr>
          </thead>
          <tbody>
            <%
                int PAGESIZE = 10;  
                int pageCount;  
                int curPage = 1;  
                String sql = "SELECT * FROM notice order by nottime desc";  
                PreparedStatement stat = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);  
                ResultSet res = stat.executeQuery();  
                res.last();  
                int size = res.getRow();  
                pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);  
                String tmp = request.getParameter("curPage");  
                if(tmp==null){  
                    tmp="1";  
                }  
                curPage = Integer.parseInt(tmp);  
                if(curPage>=pageCount) curPage = pageCount;  
                boolean flag = res.absolute((curPage-1)*PAGESIZE+1);          
                int count = 0;  
                do{  
                    if(count==PAGESIZE)break;  
                    String time = res.getString(5);      
                    time = time.substring(0, 11);
                    count++;  
            %>  
                <tr>
                    <td><a href="noticedetail.jsp?id=<%=res.getString(1)%>"><%=res.getString(2)%></a> <span class="date"><%=time%></span></td>
                </tr>
            <%  
                }while(res.next());
            %>  
          </tbody>
        </table>
      </div>
    </div>
  </section>
  <!-- 换页 -->
   <nav id="paging">
    <ul class="pagination">
      <li  <% if(curPage == 1){out.print("class='disabled'");}%> >
        <a href="noticelist.jsp?curPage=1">
          <span aria-hidden="true">首页</span>
        </a>
      </li>
      <li  <% if(curPage == 1){out.print("class='disabled'");}%> >
        <a href="noticelist.jsp?curPage=<%=curPage==1?1:curPage-1 %>">
          <span aria-hidden="true">上一页</span>
        </a>
      </li>
      <li  <% if(curPage == pageCount){out.print("class='disabled'");}%> >
        <a href="noticelist.jsp?curPage=<%=curPage+1%>" >
          <span aria-hidden="true">下一页</span>
        </a>
      </li>
      <li  <% if(curPage == pageCount){out.print("class='disabled'");}%> >
        <a href="noticelist.jsp?curPage=<%=pageCount%>">
          <span aria-hidden="true">尾页</span>
        </a>
      </li>
    </ul>
     <div><%=count%> 条 <%=curPage%> / <%=pageCount%> 页</div>
  </nav>
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
