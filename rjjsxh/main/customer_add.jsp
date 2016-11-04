<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%-- 新增用户 --%>
<%
	request.setCharacterEncoding("utf-8");
	CustomerService customerservice = new CustomerService();
    Customer customer = new Customer();
	String cusname = request.getParameter("cusname");					//获得用户名

    //检测是否被注册
	if(customerservice.queryBy(cusname)){ 
	  out.print("<script>alert('该用户已经被注册');history.go(-1); </script>");
	  return;
	}

	//注册用户
	String cuspassword = request.getParameter("cuspassword");			//获得密码
	String cusnickname = request.getParameter("cusnickname");			//获得昵称
	String cussex      = request.getParameter("cussex");				//获得性别
	String cusemail    = request.getParameter("cusemail");				//获得电子邮箱
	String custel      = request.getParameter("custel");				//获得电话
	String city        = request.getParameter("city");					//获得市						
	
	customer.setCusname(cusname);
	customer.setCuspassword(cuspassword);
	customer.setCusnickname(cusnickname);
	customer.setCussex(cussex);
	customer.setCusemail(cusemail);
	customer.setCustel(custel);
	customer.setCusaddress(city);

	customerservice.insert(customer);
	out.print("<script>alert('注册成功'); location.href = document.referrer; </script>");

%>
