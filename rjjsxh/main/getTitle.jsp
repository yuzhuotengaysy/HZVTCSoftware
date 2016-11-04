<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>

<%-- 获取标题 --%>
<%
	AboutService aboutservice = new AboutService();
	About about = new About();
	List about_list = aboutservice.query();
    String abokeyword     = ((About)about_list.get(0)).getAbokeyword();
    String abocontact     = ((About)about_list.get(0)).getAbocontact();
    String abotel 		  = ((About)about_list.get(0)).getAbotel();
    String aboemail 	  = ((About)about_list.get(0)).getAboemail();
    String aboaddress 	  = ((About)about_list.get(0)).getAboaddress();
    String abodescription = ((About)about_list.get(0)).getAbodescription();
%>
<%=((About)about_list.get(0)).getAbotitle()%>