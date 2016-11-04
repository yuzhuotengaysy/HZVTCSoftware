<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%
  	request.setCharacterEncoding("utf-8");
  	MessageService messageservice = new MessageService();
  	Message message = new Message();
	String text = request.getParameter("message");				//获取留言
	String nickname = (String)session.getAttribute("nickname");	//获取用户昵称

	//发表留言
	message.setMesnickname(nickname);
	message.setMestext(text);
	messageservice.insert(message);
	out.print("<script>alert('留言成功');location.href = document.referrer; </script>");
%>