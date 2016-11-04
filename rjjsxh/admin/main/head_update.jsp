<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.io.*,java.text.*,java.Data.*,com.jspsmart.upload.*,java.sql.*"%>
<%@ include file="../../main/connect.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String name = (String)session.getAttribute("username");
	SmartUpload su = new SmartUpload();				//实例化
	su.setAllowedFilesList("jpg,jpeg,png,gif");		//设定允许上传的文件
	try{
		su.initialize(config, request, response);	//初始化
		su.upload();
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
		String datetime = new SimpleDateFormat("yyyyMMddhhmmss").format(Calendar.getInstance().getTime());
		String img = datetime + (int)(Math.random()*999)+"."+file.getFileExt();//生成随机文件名
		file.saveAs("/upload/" + img);
		String sql = "update admin set admpic=? where admname = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, img);
		pstmt.setString(2, name);
		pstmt.executeUpdate();
		out.print("<script>alert('上传头像成功');location.href = document.referrer;</script>");//返回
	} catch (Exception e){
		out.print("<script>alert('上传头像失败(请上传jpg,jpeg,png,gif格式的图片)');location.href = document.referrer;</script>");//返回
	}
%>
