<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
    NoticeService noticeservice = new NoticeService();
    Notice notice = new Notice();

	//获得信息
	String id = request.getParameter("notid");
	String title = request.getParameter("nottitle");
	String content = request.getParameter("notcontent");

	//修改信息
	notice.setNottitle(title);
	notice.setNotcontent(content);
	notice.setNotid(Integer.parseInt(id));
	noticeservice.update(notice);																		//修改资源信息
	out.print("<script>alert('修改成功');location.href = '../notice_manager.jsp'; </script>");			//网页跳转回上级页面
%>