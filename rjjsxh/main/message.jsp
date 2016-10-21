<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>

<%
  	request.setCharacterEncoding("utf-8");
	String text = request.getParameter("message");	//获取留言
	//最大ID
	int maxId = 0;
    ResultSet res = stmt.executeQuery("select max(mesid) from message");
    res.next();
    maxId = res.getInt(1) + 1;

	String sql = "insert into message(mesid, mesnickname, mestext) values('" + maxId + "' , '" + session.getAttribute("nickname") + "' , '" + text+ "')";
	stmt.execute(sql);
	out.print("<script>location.href = document.referrer; </script>");
%>