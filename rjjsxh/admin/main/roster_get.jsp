<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	//获得信息
	String id = request.getParameter("id");	
	String sql = "update roster set fee=1 where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();																			//修改会员信息
	conn.close();
	out.print("<script>alert('确认成功');location.href = '../roster_manager.jsp'; </script>");		//网页跳转回上级页面
%>