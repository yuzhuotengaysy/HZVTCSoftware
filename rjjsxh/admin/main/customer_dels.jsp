<%@ page language="java" import="java.util.*,service.*" pageEncoding="utf-8"%>

<%
	CustomerService customerservice = new CustomerService();
	String[] id = request.getParameterValues("id");
	customerservice.deletes(id);																	//批量删除
	out.print("<script>alert('删除成功');location.href = '../user_manager.jsp'; </script>");		//网页跳转回上级页面
%>