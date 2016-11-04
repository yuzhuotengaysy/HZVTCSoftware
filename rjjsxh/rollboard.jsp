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
        <li><a href="data.jsp">资源</a></li>
        <li class="active"><a href="#">留言</a></li>
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
                <li class="active">留言板</li>
            </ol>
        </div>
        <div class="mainsection" id="main">
            <div class="">
                <button class="btn btn-default" id="changeboard" onclick="location.href = 'board.jsp'"> 普 通 留 言</button>
                <div class="rollboard">
                    <%
                      MessageService messageservice = new MessageService();
                      Message message = new Message();
                      List message_list = messageservice.query();
                      for(int i = 0; i < message_list.size(); i++){
						            String text = ((Message)message_list.get(i)).getMestext(); //用户留言    
                        int top = (int)(Math.random()*50+48);            //距离顶部百分比
                        int speed = (int)(Math.random()*15+5);           //文字经过速度
                        int color = (int)(Math.random()*899999+100000);  //字体颜色
                        int font = (int)(Math.random()*10+14);           //字体大小
                        if(text.equals("")){
                            continue;
                        } else {
                            out.print( "<marquee direction='left' width='100%' onmouseover=this.stop() onmouseout=this.start() style='top:"+top+"%;color:#"+color+";font-size:"+font+"px'  scrollamount="+speed+">"+text+"</marquee>");
                        }
                      }
                    %>
                </div>
                <form action="main/message.jsp" method="post" onsubmit="return textCheck()">
                    <textarea id="mestext" class="form-control" rows="5" name="message" id="messageBox"<% if(session.getAttribute("username") == null){out.print("placeholder='请登录后再留言~~~' disabled ");}
                    else{out.print("placeholder='请输入留言~~~'");}%> ></textarea>
                    <input type="submit" id="publish" value=" 提 交 留 言 " <% if(session.getAttribute("username") == null){out.print("disabled");} %>>
                </form>
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
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
  function textCheck(){
    if(document.getElementById('mestext').value == ""){
      document.getElementById('mestext').focus();
      alert("留言不能为空");
      return false;
    }
    return true;
  }
</script>
</body>
</html>
