<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	//获得信息
	String id = request.getParameter("cusid");
	String password = request.getParameter("cuspassword");
	String nickname = request.getParameter("cusnickname");
	String sex = request.getParameter("cussex");
	String email = request.getParameter("cusemail");
	String telephone = request.getParameter("custel");

	String sql = "update customer set cuspassword=?,cusnickname=?,cussex=?,cusemail=?,custel=? where cusid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, password);
	pstmt.setString(2, nickname);
	pstmt.setString(3, sex);
	pstmt.setString(4, email);
	pstmt.setString(5, telephone);
	pstmt.setString(6, id);
	pstmt.executeUpdate();																			//修改用户信息
	conn.close();
	out.print("<script>alert('修改成功');location.href = '../user_manager.jsp'; </script>");		//网页跳转回上级页面
%>