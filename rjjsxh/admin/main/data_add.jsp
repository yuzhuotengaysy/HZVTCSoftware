<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>

<%-- 发布资源 --%>
<%
  	request.setCharacterEncoding("utf-8");
	//最大ID
    ResultSet res = stmt.executeQuery("select max(dataid) from data");
    res.next();
    int maxId = res.getInt("max(dataid)") + 1;

	String dataname = request.getParameter("dataname");				//获得资源名
	ResultSet nameCheck = stmt.executeQuery("select * from data where dataname='" + dataname + "'");
	if(nameCheck.next()){ 
	  out.print("<script>alert('该资源已经存在');history.go(-1); </script>");
	  return;
	}
	String datalink = request.getParameter("datalink");				//获得资源链接
	String sql = "insert into data(dataid, dataname, datalink) values('" + maxId + "','" + dataname + "','" + datalink + "')";
	stmt.executeUpdate(sql);
	conn.close();
	out.print("<script>alert('发布成功');location.href = '../data_manager.jsp'; </script>");

%>