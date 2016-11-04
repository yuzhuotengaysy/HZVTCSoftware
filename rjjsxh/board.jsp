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
        <div class="container mainsection">
            <div class="row">
                <button class="btn btn-default" id="changeboard" onclick="location.href = 'rollboard.jsp'"> 弹 幕 留 言</button>
                <table class="board table">
                  <%
                      MessageService messageservice = new MessageService();
                      Message message = new Message();
                      List message_list = messageservice.query();
                      int pages = 1;                                                //当前页码
                      try{
                          pages = Integer.parseInt(request.getParameter("pages")); 
                      } catch(Exception e){}
                      int pageSize = 10;                                            //一页显示的数量    
                      int pageCount = (message_list.size()%pageSize==0)?(message_list.size()/pageSize):(message_list.size()/pageSize+1);  //总页数

                      for(int i = (pages-1)*pageSize; i < pages*pageSize && i < message_list.size(); i++){
                          int id = ((Message)message_list.get(i)).getMesid();
                          String nickname = ((Message)message_list.get(i)).getMesnickname();
                          String time = ((Message)message_list.get(i)).getMestime(); 
                          time = time.substring(0, 16);
                          String img = "";
                          if(nickname.equals("管理员")){       
                            AdminService adminservice = new AdminService();
                            Admin admin = new Admin();
                            admin = adminservice.queryByName("admin");
                            img = admin.getAdmpic();
                          } else {
                            CustomerService customerservice = new CustomerService();
                            Customer customer = new Customer();
                            customer = customerservice.queryByNickName(nickname);
                            img = customer.getCuspic();
                          }
                  %>  
                      <tr>  
                          <td><img src="upload/<%=img%>" width="100" height="100"><span <%if(nickname.equals("管理员")) {out.print("style='color:red'");}%>><%=nickname%></span></td>  
                          <td>
                            <p style="height:80px"><%=((Message)message_list.get(i)).getMestext()%></p>
                            <p style="text-align:right"><a href="javascript:reply(<%=id%>)">回复</a> <%=id%>楼 <%=time%></p>
                            <textarea class="form-control" rows="5" name="reply" id="<%=id%>" style="width:50%;float:right;resize:none;display:none">讲道理 这功能还没实现 不要看了</textarea>
                            
                          </td>  
                      </tr>  
                  <%  
                      } 
                  %>       
                </table>
                <form action="main/message.jsp" method="post" onsubmit="return textCheck()">
                    <textarea id="mestext" class="form-control" rows="5" name="message" id="messageBox"<% if(session.getAttribute("username") == null){out.print("placeholder='请登录后再留言~~~' disabled ");}
                    else{out.print("placeholder='请输入留言~~~'");}%> ></textarea>
                    <input type="submit" id="publish" value=" 提 交 留 言 " <% if(session.getAttribute("username") == null){out.print("disabled");} %>>
                </form>
                 <!-- 换页 -->
                  <nav id="paging">
                    <ul class="pagination">
                      <li  <% if(pages == 1){out.print("class='disabled'");}%> >
                        <a href="board.jsp?pages=1">
                          <span aria-hidden="true">首页</span>
                        </a>
                      </li>
                      <li  <% if(pages == 1){out.print("class='disabled'");}%> >
                        <a href="board.jsp?pages=<%=pages==1?1:pages-1 %>">
                          <span aria-hidden="true">上一页</span>
                        </a>
                      </li>
                      <li  <% if(pages == pageCount){out.print("class='disabled'");}%> >
                        <a href="board.jsp?pages=<%=pages==pageCount?pageCount:pages+1%>" >
                          <span aria-hidden="true">下一页</span>
                        </a>
                      </li>
                      <li  <% if(pages == pageCount){out.print("class='disabled'");}%> >
                        <a href="board.jsp?pages=<%=pageCount%>">
                          <span aria-hidden="true">尾页</span>
                        </a>
                      </li>
                    </ul>
                     <div><%=(message_list.size()-(pages-1)*pageSize>10)?10:message_list.size()-(pages-1)*pageSize%>条 <%=pages%> / <%=pageCount%> 页</div>
                  </nav>

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
  function reply(i){
      var replyid = document.getElementById(i);
      if(replyid.style.display=="none"){
          replyid.style.display="block";
      } else{
          replyid.style.display="none";
      }
  }

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
