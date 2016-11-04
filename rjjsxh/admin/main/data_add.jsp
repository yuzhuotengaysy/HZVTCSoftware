<%@ page language="java" import="java.util.*,com.*,service.*,com.jspsmart.upload.*,java.text.*" pageEncoding="utf-8"%>

<%-- 发布资源 --%>
<%
	request.setCharacterEncoding("utf-8");
    DataService dataservice = new DataService();
    Data data = new Data();
    SmartUpload su = new SmartUpload();				//实例化
    su.setAllowedFilesList("rar,zip");				//设定允许上传的文件
	//发布资源
	try{
		su.initialize(config, request, response);	//初始化
		su.upload();
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
		String datalink = new SimpleDateFormat("yyyyMMddhhmmss").format(Calendar.getInstance().getTime());
		datalink = datalink + "." + file.getFileExt();				//获得附件名字

		String dataname = su.getRequest().getParameter("dataname");	//获得资源名
		if(dataservice.queryBy(dataname)){ 							//检测该资源是否存在
		  out.print("<script>alert('该资源已经存在');history.go(-1); </script>");
		  return;
		}
		
		file.saveAs("/download/" + datalink);		//上传资源	
		data.setDataname(dataname);					
		data.setDatalink(datalink);
		dataservice.insert(data);					//存入数据库
		out.print("<script>alert('发布成功');location.href = '../data_manager.jsp'; </script>");
	} catch (Exception e){
		out.print("<script>alert('上传失败(请上传rar,zip格式的文件)');location.href = document.referrer;</script>");//返回
	}
%>