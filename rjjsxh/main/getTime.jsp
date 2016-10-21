<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>

<%	
		String datetime = new SimpleDateFormat("HH").format(Calendar.getInstance().getTime()); //获取系统时间 
		int showtime = Integer.parseInt(datetime);
		if(showtime>=6 && showtime<12  ) {
			out.print("早上好！ ");
		} else if(showtime >= 12 && showtime <18){
			out.print("下午好！ ");
		} else {
			out.print("晚上好！ ");
		}
		if(session.getAttribute("username") == null){
			out.print("同学");
		} else {
			out.print(session.getAttribute("nickname"));
		}
		out.print(",欢迎您访问本站点！");

%>