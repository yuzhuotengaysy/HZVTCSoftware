<%@ page language="java" import="java.util.*,service.*" pageEncoding="utf-8"%>

<%
	DataService dataservice = new DataService();
	String[] id = request.getParameterValues("id");
	dataservice.deletes(id);																		//批量删除
	out.print("<script>alert('删除成功');location.href = '../data_manager.jsp'; </script>");		//网页跳转回上级页面
%>