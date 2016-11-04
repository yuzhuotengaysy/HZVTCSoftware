<%@ page language="java" import="java.util.*,service.*" pageEncoding="utf-8"%>

<%
    NoticeService noticeservice = new NoticeService();
    String id = request.getParameter("id");
	noticeservice.delete(id);																	//删除公告
	out.print("<script>alert('删除成功');location.href = '../notice_manager.jsp'; </script>");	//网页跳转回上级页面
%>