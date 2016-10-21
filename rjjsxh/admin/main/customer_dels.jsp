<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	if(request.getParameterValues("id") != null){		
		String[] id = request.getParameterValues("id");
		for(int i = 0; i < id.length; i++){
			String sql = "delete from customer where cusid=" + id[i];
			stmt.executeUpdate(sql);																//删除用户
		}
	}
	conn.close();
	out.print("<script>alert('删除成功');location.href = '../user_manager.jsp'; </script>");		//网页跳转回上级页面
%>