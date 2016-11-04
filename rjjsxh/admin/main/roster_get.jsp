<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	RosterService rosterservice = new RosterService();
    Roster roster = new Roster();
	String id = request.getParameter("id");	
	
	roster.setId(Integer.parseInt(id));
	rosterservice.update(roster);																	//确认缴费
	out.print("<script>alert('确认成功');location.href = '../roster_manager.jsp'; </script>");		//网页跳转回上级页面
%>