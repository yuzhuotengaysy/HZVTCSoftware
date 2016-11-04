<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	CustomerService customerservice = new CustomerService();
    Customer customer = new Customer();

	//获得信息
	String id 		   = request.getParameter("cusid");
	String cuspassword = request.getParameter("cuspassword");			//获得密码
	String cusnickname = request.getParameter("cusnickname");			//获得昵称
	String cussex      = request.getParameter("cussex");				//获得性别
	String cusemail    = request.getParameter("cusemail");				//获得电子邮箱
	String custel      = request.getParameter("custel");				//获得电话
	String city        = request.getParameter("city");					//获得市	

	//修改信息
	customer.setCuspassword(cuspassword);
	customer.setCusnickname(cusnickname);
	customer.setCussex(cussex);
	customer.setCusemail(cusemail);
	customer.setCustel(custel);
	customer.setCusaddress(city);
	customer.setCusid(Integer.parseInt(id));
	customerservice.update(customer);																//修改用户信息
	out.print("<script>alert('修改成功');location.href = '../user_manager.jsp'; </script>");		//网页跳转回上级页面
%>