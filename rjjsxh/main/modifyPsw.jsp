<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>

<%-- 修改密码 --%>
<%
  	request.setCharacterEncoding("utf-8");
	String psw1 = request.getParameter("password1");	//密码
	String psw2 = request.getParameter("password2");	//确认密码
	String sql = "update customer set cuspassword = " + psw1 + " where cusnickname = '" + session.getAttribute("nickname") +"'";
	stmt.executeUpdate(sql);
	out.print("<script>alert('修改成功');location.href = document.referrer; </script>");

%>
