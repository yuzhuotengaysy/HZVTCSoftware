<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%--连接数据库--%>
<%
  request.setCharacterEncoding("utf-8");
  Class.forName("com.mysql.jdbc.Driver");	//加载驱动
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thomas2?useUnicode=true&characterEncoding=utf-8","root","123456");	//连接数据库
  Statement stmt = conn.createStatement();	//创建Statement对象
  PreparedStatement pstmt = null;			//创建PreparedStatement对象
%>