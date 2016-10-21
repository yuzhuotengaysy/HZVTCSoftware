<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	if(request.getParameterValues("id") != null){		
		String[] id = request.getParameterValues("id");
		for(int i = 0; i < id.length; i++){
			String sql = "delete from message where mesid=" + id[i];
			stmt.executeUpdate(sql);																//删除留言
		}
	}
	conn.close();
	out.print("<script>alert('删除成功');location.href = '../message_manager.jsp'; </script>");		//网页跳转回上级页面
%>