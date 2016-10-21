<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>

<%-- 新增用户 --%>
<%
	request.setCharacterEncoding("utf-8");
	//最大ID
    ResultSet res = stmt.executeQuery("select max(cusid) from customer");
    res.next();
    int maxId = res.getInt("max(cusid)") + 1;

	String cusname = request.getParameter("cusname");					//获得用户名
	ResultSet nameCheck = stmt.executeQuery("select * from customer where cusname='" + cusname + "'");
	if(nameCheck.next()){ 
	  out.print("<script>alert('该用户已经被注册');history.go(-1); </script>");
	  return;
	}
	String cuspassword = request.getParameter("cuspassword");			//获得密码
	String cusnickname = request.getParameter("cusnickname");			//获得昵称
	String cussex      = request.getParameter("cussex");				//获得性别
	String cusemail    = request.getParameter("cusemail");				//获得电子邮箱
	String custel      = request.getParameter("custel");				//获得电话
	String province    = request.getParameter("province");				//获得省
	String city        = request.getParameter("city");					//获得市
	String cusaddress  = province + city;								
	String sql = "insert into customer values('" + maxId + "','" + cusname + "','" + cuspassword + "','" + cusnickname + "','" + cussex + "','" + cusemail + "','" + custel + "','" + cusaddress + "','default.jpg')";
	stmt.executeUpdate(sql);
	conn.close();
	out.print("<script>alert('注册成功'); location.href = document.referrer; </script>");

%>
