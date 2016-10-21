<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>

<%-- 新增用户 --%>
<%
	request.setCharacterEncoding("utf-8");
	//最大ID
    ResultSet res = stmt.executeQuery("select max(id) from roster");
    res.next();
    int maxId = res.getInt("max(id)") + 1;

	String nickname = request.getParameter("nickname");					//获得名字
	ResultSet nameCheck = stmt.executeQuery("select * from roster where name='" + nickname + "'");
	if(nameCheck.next()){ 
	  out.print("<script>alert('该姓名已经存在');history.go(-1); </script>");
	  return;
	}
	String sex         = request.getParameter("sex");					//获得性别
	String classess    = request.getParameter("classess");				//获得班级
	String tel         = request.getParameter("tel");					//获得电话
	String dormitory   = request.getParameter("dormitory");				//获得寝室							
	String sql = "insert into roster(Id, name, sex, classess, tel, dormitory) values('" + maxId + "','" + nickname + "','" + sex + "','" + classess + "','" + tel + "','" + dormitory + "')";
	stmt.executeUpdate(sql);
	conn.close();
	out.print("<script>alert('提交成功');location.href = document.referrer; </script>");

%>
