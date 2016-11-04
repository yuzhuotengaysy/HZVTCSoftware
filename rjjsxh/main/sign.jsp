<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%-- 登录注销等按钮 --%>
<%  if(session.getAttribute("username") == null){  %>
		<li>
			<button class="btn btn-primary navbar-btn" id="signIn">登 录</button>
      <button class="btn btn-primary navbar-btn" id="register">注 册</button>

		</li>
<%  
    } else {  
        String headpic = ""; //头像图片
        if(session.getAttribute("username").equals("admin")){ 
          AdminService adminservice = new AdminService();
          Admin admin = new Admin();
          admin = adminservice.queryByName("admin");
          headpic = admin.getAdmpic();
        } else {
          String username = (String)session.getAttribute("username");
          CustomerService customerservice = new CustomerService();
          Customer customer = new Customer();
          customer = customerservice.queryByName(username);
          headpic = customer.getCuspic();
        }
%>
		<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding:0 15px">
            <img src="upload/<%=headpic%>" width="50" height="50"> <%=session.getAttribute("nickname")%>
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="javascript:0" id="modifyPic">修改头像</a></li>
            <li><a href="javascript:0" id="modifyPsw">修改密码</a></li>
            <li class="divider"></li>
            <li><a href="javascript:0" id="signOut" onclick="location='main/logout.jsp'">退出</a></li>
          </ul>
        </li>  
<%	}  %>
