<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%
	session.invalidate(); 
	out.print("<script>alert('安全退出!');location.href =  window.location.href='../index.jsp';</script>");		//网页跳转回上级页面
%>