<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%
	String username = request.getParameter("username");							//获取用户名
	String password = request.getParameter("password");							//获取密码
	String code = (String)request.getParameter("code");							//获取输入的验证码
	String rcode = (String)session.getAttribute("rcode");						//获取生成的验证码

	/* 验证码验证 */
	if(!code.equals(rcode)){
		out.print("<script>alert('验证码错误');history.go(-1);</script>");
		return;
	} 

	/* 登录验证 */
	AdminService adminService = new AdminService();
	Admin admin = new Admin();
	try {
		admin = adminService.queryBy(username, password);						//验证帐号密码
		if(admin.getAdmname() != null){											//验证成功
			session.setAttribute("username", username);							//管理员帐号存入session			
			session.setAttribute("nickname", admin.getAdmnickname());			//管理员昵称存入session
			out.print("<script>alert('登录成功');location.href = '../index.jsp';</script>");//进入后台
		} else {
			out.print("<script>alert('帐号密码不匹配');location.href = document.referrer;</script>");
		}
	} catch (Exception e) {
		out.print("<script>alert('帐号密码不匹配！');location.href = document.referrer;</script>");
	}	

%>
