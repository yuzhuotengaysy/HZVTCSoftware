<%@ page language="java" import="java.util.*,service.*" pageEncoding="utf-8"%>

<%
    MessageService messageservice = new MessageService();
	String id = request.getParameter("id");
	messageservice.delete(id);																	//删除留言
	out.print("<script>alert('删除成功');location.href = '../message_manager.jsp'; </script>");	//网页跳转回上级页面
%>