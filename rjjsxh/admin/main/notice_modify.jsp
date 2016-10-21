<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	//获得信息
	String id = request.getParameter("notid");
	String title = request.getParameter("nottitle");
	String content = request.getParameter("notcontent");

	String sql = "update notice set nottitle=?,notcontent=? where notid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, id);
	pstmt.executeUpdate();																			//修改用户信息
	conn.close();
	out.print("<script>alert('修改成功');location.href = '../notice_manager.jsp'; </script>");		//网页跳转回上级页面
%>