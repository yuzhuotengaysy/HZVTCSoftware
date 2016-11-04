<%@ page language="java" import="java.util.*,service.*" pageEncoding="utf-8"%>

<%
	MessageService messageservice = new MessageService();
	String[] id = request.getParameterValues("id");
	messageservice.deletes(id);																		//批量删除
	out.print("<script>alert('删除成功');location.href = '../message_manager.jsp'; </script>");		//网页跳转回上级页面
%>