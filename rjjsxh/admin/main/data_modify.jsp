<%@ page language="java" import="java.util.*,com.*,service.*,java.text.*,com.jspsmart.upload.*" pageEncoding="utf-8"%>


<%
	request.setCharacterEncoding("utf-8");
    DataService dataservice = new DataService();
    Data data = new Data();
    SmartUpload su = new SmartUpload();				//实例化
	
    try{
		su.initialize(config, request, response);	//初始化
		su.upload();
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
		
		String link = "";
		if (file.isMissing()) {						//如果没有附件
			link =  su.getRequest().getParameter("datafile");
		} else {
			link = new SimpleDateFormat("yyyyMMddhhmmss").format(Calendar.getInstance().getTime());
			link = link + "." + file.getFileExt();
			file.saveAs("/download/" + link);		//上传资源	
		}
		

		//获得信息
		String id = su.getRequest().getParameter("dataid");
		String name = su.getRequest().getParameter("dataname");

		//修改信息
		data.setDataname(name);
		data.setDatalink(link);
		data.setDataid(Integer.parseInt(id));
		dataservice.update(data);																		//修改资源信息
		out.print("<script>alert('修改成功');location.href = '../data_manager.jsp'; </script>");		//网页跳转回上级页面
	}	catch (Exception e){
		out.print("<script>alert('上传失败(请上传rar,zip格式的文件)');location.href = document.referrer;</script>");//返回
	}
%>