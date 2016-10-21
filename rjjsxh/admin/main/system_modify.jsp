<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	//获得信息
	String name = request.getParameter("aboname");
	String title = request.getParameter("abotitle");
	String keyword = request.getParameter("abokeyword");
	String contact = request.getParameter("abocontact");
	String tel = request.getParameter("abotel");
	String email = request.getParameter("aboemail");
	String address = request.getParameter("aboaddress");
	String description = request.getParameter("abodescription");

	String sql = "update about set abotitle=?,abokeyword=?,abocontact=?,abotel=?,aboemail=?,aboaddress=?,abodescription=? where aboname = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, keyword);
	pstmt.setString(3, contact);
	pstmt.setString(4, tel);
	pstmt.setString(5, email);
	pstmt.setString(6, address);
	pstmt.setString(7, description);
	pstmt.setString(8, name);
	pstmt.executeUpdate();																	//修改信息
	conn.close();
	out.print("<script>alert('修改成功');location.href = '../system.jsp'; </script>");		//网页跳转回上级页面
%>