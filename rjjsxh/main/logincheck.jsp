<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
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
	/* 发送sql语句 */
	String sql = "select * from customer where cusname = ? and cuspassword = ?";
	pstmt = conn.prepareStatement(sql);											
	pstmt.setString(1, username);
	pstmt.setString(2, password);
	ResultSet res = pstmt.executeQuery();										
	try{
		if(res.next()){		
			session.setAttribute("username", username);							//用户名存入session			
			session.setAttribute("nickname", res.getString("cusnickname"));		//将用户昵称存入session
			out.print("<script>alert('登录成功');location.href = document.referrer;</script>");//进入后台
		}else {
			out.print("<script>alert('帐号密码不匹配');location.href = document.referrer;</script>");
		}
	} catch (SQLException sqle){
		System.err.println("Erro with connection:" + sqle);
		out.print("<script>alert('帐号密码不匹配!!!');</script>");
	}
	conn.close();
%>
