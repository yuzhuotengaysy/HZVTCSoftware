<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%-- 修改密码 --%>
<%
  	request.setCharacterEncoding("utf-8");
  	CustomerService customerservice = new CustomerService();
    Customer customer = new Customer();
  	String username = (String)session.getAttribute("username");	//获取用户名
	  String password = request.getParameter("password1");		    //获取密码

	  //修改密码
    customer.setCusname(username);
    customer.setCuspassword(password);
    customerservice.modify(customer);

	out.print("<script>alert('修改成功');location.href = document.referrer; </script>");

%>
