<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%-- 发布公告 --%>
<%
	request.setCharacterEncoding("utf-8");
    NoticeService noticeservice = new NoticeService();
    Notice notice = new Notice();
	String nottitle = request.getParameter("nottitle");					//获得资源名

    //检测该公告是否存在
	if(noticeservice.queryBy(nottitle)){ 
	  out.print("<script>alert('该公告已经存在');history.go(-1); </script>");
	  return;
	}

	//发布公告
	String notauthor  = request.getParameter("notauthor");			
	String notcontent = request.getParameter("notcontent");		
	
	notice.setNottitle(nottitle);
	notice.setNotauthor(notauthor);
	notice.setNotcontent(notcontent);

	noticeservice.insert(notice);
	out.print("<script>alert('发布成功');location.href = '../notice_manager.jsp'; </script>");

%>