<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	if(request.getParameterValues("id") != null){		
		String[] id = request.getParameterValues("id");
		for(int i = 0; i < id.length; i++){
			String sql = "delete from data where dataid=" + id[i];
			stmt.executeUpdate(sql);																//删除资源
		}
	}
	conn.close();
	out.print("<script>alert('删除成功');location.href = '../data_manager.jsp'; </script>");		//网页跳转回上级页面
%>