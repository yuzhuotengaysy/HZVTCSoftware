<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%-- 获取标题 --%>
<%
	request.setCharacterEncoding("utf-8");
    ResultSet about = stmt.executeQuery("select * from about");
    about.next();
    String abokeyword     = about.getString(3);
    String abocontact     = about.getString(4);
    String abotel 		  = about.getString(5);
    String aboemail 	  = about.getString(6);
    String aboaddress 	  = about.getString(7);
    String abodescription = about.getString(8);
%>
<%=about.getString("abotitle")%>