<%@ page contentType="text/html; charset=utf-8" import="java.util.*,com.jspsmart.upload.*,java.sql.*"%>
<%@ include file="connect.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	SmartUpload mySmartUpload = new SmartUpload();	//类实例化一个对象
	try{
		mySmartUpload.initialize(config, request, response);	//初始化
		mySmartUpload.upload();
		com.jspsmart.upload.File myfile = mySmartUpload.getFiles().getFile(0);
		mySmartUpload.save("/upload");
		//out.print(myfile.getFileName());
		String img = myfile.getFileName();
		String sql = "update customer set cuspic='"+img+"' where cusnickname = '" + session.getAttribute("nickname") + "'";
		stmt.executeUpdate(sql);
		out.print("<script>alert('上传头像成功');location.href = document.referrer;</script>");		//网页跳转回上级页面
	} catch (Exception e){
		out.print("<br>Unable to upload the file.<br>" + e);
	}
%>
