<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	//获得信息
	String id = request.getParameter("dataid");
	String dataname = request.getParameter("dataname");
	String datalink = request.getParameter("datalink");


	String sql = "update data set dataname=?,datalink=? where dataid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, dataname);
	pstmt.setString(2, datalink);
	pstmt.setString(3, id);
	pstmt.executeUpdate();																			//修改用户信息
	conn.close();
	out.print("<script>alert('修改成功');location.href = '../data_manager.jsp'; </script>");		//网页跳转回上级页面
%>