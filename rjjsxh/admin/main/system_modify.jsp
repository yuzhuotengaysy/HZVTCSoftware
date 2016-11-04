<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	AboutService aboutservice = new AboutService();
    About about = new About();

	//获得信息
	String name = request.getParameter("aboname");
	String title = request.getParameter("abotitle");
	String keyword = request.getParameter("abokeyword");
	String contact = request.getParameter("abocontact");
	String tel = request.getParameter("abotel");
	String email = request.getParameter("aboemail");
	String address = request.getParameter("aboaddress");
	String description = request.getParameter("abodescription");

	//存入信息
	about.setAboname(name);
	about.setAbotitle(title);
	about.setAbokeyword(keyword);
	about.setAbocontact(contact);
	about.setAbotel(tel);
	about.setAboemail(email);
	about.setAboaddress(address);
	about.setAbodescription(description);
	aboutservice.update(about);																//更新信息
	out.print("<script>alert('修改成功');location.href = '../system.jsp'; </script>");		//网页跳转回上级页面
%>