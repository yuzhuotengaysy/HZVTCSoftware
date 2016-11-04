<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="main/connect.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
<title><%@ include file="main/getTitle.jsp" %></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="huaji.ico"/>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/login.js"></script>

</head>
<body>

<script src="js/bootstrap.js"></script>
<script type="text/javascript">
var res = "北京市温州市";
alert(res);
var i = res.indexOf("省")+1;
alert(i);
if(i == 0) i = res.indexOf("市")+1;
alert(res.substring(i,res.length));

</script>
</body>
</html>
