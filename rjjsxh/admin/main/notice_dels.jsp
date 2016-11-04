<%@ page language="java" import="java.util.*,service.*" pageEncoding="utf-8"%>

<%
	NoticeService noticeservice = new NoticeService();
	String[] id = request.getParameterValues("id");
	noticeservice.deletes(id);																		//批量删除
	out.print("<script>alert('删除成功');location.href = '../notice_manager.jsp'; </script>");		//网页跳转回上级页面
%>