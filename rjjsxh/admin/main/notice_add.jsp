<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>

<%-- 发布资源 --%>
<%
  	request.setCharacterEncoding("utf-8");
	//最大ID
    ResultSet res = stmt.executeQuery("select max(notid) from notice");
    res.next();
    int maxId = res.getInt("max(notid)") + 1;

	String nottitle = request.getParameter("nottitle");					//获得公告名
	ResultSet nameCheck = stmt.executeQuery("select * from notice where nottitle='" + nottitle + "'");
	if(nameCheck.next()){ 
	  out.print("<script>alert('该公告已经存在');history.go(-1); </script>");
	  return;
	}

	String notcontent = request.getParameter("notcontent");				//获得公告内容
	String sql = "insert into notice(notid, nottitle, notauthor, notcontent) values('" + maxId + "','" + nottitle + "','" + session.getAttribute("nickname") + "','" + notcontent + "')";
	stmt.executeUpdate(sql);
	conn.close();
	out.print("<script>alert('发布成功');location.href = '../notice_manager.jsp'; </script>");
%>