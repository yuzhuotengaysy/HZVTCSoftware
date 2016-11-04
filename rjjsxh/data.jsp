<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

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
        <li class="active"><a href="#">资源</a></li>
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
        <li class="active">资源链接</li>
      </ol>
    </div>
    <div class="container mainsection">
      <div class="col-sm-12">
        <table class="table table-hover table-striped table-condensed">
          <thead>
            <tr>
              <th> <span class="glyphicon glyphicon-list" aria-hidden="true"><span>资源名称</span></span> <span class="glyphicon glyphicon-calendar" aria-hidden="true"><span>发表时间</span></span> </th>
            </tr>
          </thead>
          <tbody>
            <%
                DataService dataservice = new DataService();
                Data data = new Data();
                List data_list = dataservice.queryDesc();
                int pages = 1;                                                //当前页码
                try{
                    pages = Integer.parseInt(request.getParameter("pages")); 
                } catch(Exception e){}
                int pageSize = 10;                                            //一页显示的数量    
                int pageCount = (data_list.size()%pageSize==0)?(data_list.size()/pageSize):(data_list.size()/pageSize+1);  //总页数

                for(int i = (pages-1)*pageSize; i < pages*pageSize && i < data_list.size(); i++){
                    String datatime = ((Data)data_list.get(i)).getDatatime(); //资源发布时间   
                    datatime = datatime.substring(0, 11);  
            %>  
                <tr>  
                    <td><a href="download/<%=((Data)data_list.get(i)).getDatalink()%>" target="_blank"><%=((Data)data_list.get(i)).getDataname()%></a><span class="date"><%=datatime%></span></td>
                </tr>  
            <%  
                }
            %>      
          </tbody>
        </table>
      </div>
    </div>
  </section>
   <!-- 换页 -->
  <nav id="paging">
    <ul class="pagination">
      <li  <% if(pages == 1){out.print("class='disabled'");}%> >
        <a href="data.jsp?pages=1">
          <span aria-hidden="true">首页</span>
        </a>
      </li>
      <li  <% if(pages == 1){out.print("class='disabled'");}%> >
        <a href="data.jsp?pages=<%=pages==1?1:pages-1 %>">
          <span aria-hidden="true">上一页</span>
        </a>
      </li>
      <li  <% if(pages == pageCount){out.print("class='disabled'");}%> >
        <a href="data.jsp?pages=<%=pages==pageCount?pageCount:pages+1%>" >
          <span aria-hidden="true">下一页</span>
        </a>
      </li>
      <li  <% if(pages == pageCount){out.print("class='disabled'");}%> >
        <a href="data.jsp?pages=<%=pageCount%>">
          <span aria-hidden="true">尾页</span>
        </a>
      </li>
    </ul>
     <div><%=(data_list.size()-(pages-1)*pageSize>10)?10:data_list.size()-(pages-1)*pageSize%>条 <%=pages%> / <%=pageCount%> 页</div>
  </nav>
</div>



<!-- 尾部 -->
<div id="footer">
    <span><a href="http://www.hzvtc.edu.cn/" target="_blank">©HZVTC</a> <a href="http://weibo.com/yuzhuoteng" target="_blank">@余卓腾</a></span>
    <span>2016 杭职软件技术协会</span>
</div>


<!-- 模态框 -->
<%@ include file="main/modal.jsp" %>
<script src="js/bootstrap.js"></script>
</body>
</html>
