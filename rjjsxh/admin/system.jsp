<%@ page language="java" import="java.util.*,com.*,service.*" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>杭职软协后台管理系统</title>
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="css/bootstrap.min.css-v=3.3.5.css" rel="stylesheet">
    <link href="css/font-awesome.min.css-v=4.4.0.css" rel="stylesheet">
    <link href="css/plugins/footable/footable.core.css" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css-v=4.0.0.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>网站设置</h5>
                        </div>
                        <div class="ibox-content">
                                <form class="form-horizontal m-t" name="system_modify" id="system_modify" action="main/system_modify.jsp" method="post" onsubmit="return checkAbo()">  
                                    <table class="table table-bordered">
                                        <%
                                            AboutService aboutservice = new AboutService();
                                            About about = new About();
                                            List about_list = aboutservice.query();
                                        %>
                                        <tr>
                                            <td width="10%" style="font-weight:bolder">域名：</td>
                                            <td>
                                                <div class="col-sm-9"> 
                                                    <input type="hidden" name="aboname" class="form-control"  value="<%=((About)about_list.get(0)).getAboname()%>">
                                                    <span class="help-block m-b-none">www.thomasyzt.cn:888</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight:bolder">网站标题：</td>
                                            <td>    
                                                <div class="col-sm-9">
                                                    <input type="text" name="abotitle" class="form-control" placeholder="请输入标题" value="<%=((About)about_list.get(0)).getAbotitle()%>">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight:bolder"> 关键字：</td>    
                                            <td>
                                                <div class="col-sm-9">
                                                    <input type="text" name="abokeyword" class="form-control" placeholder="请输入关键字" value="<%=((About)about_list.get(0)).getAbokeyword()%>">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight:bolder">联系人：</td>
                                            <td>    
                                                <div class="col-sm-9">
                                                    <input type="text" name="abocontact" class="form-control" placeholder="请输入联系人" value="<%=((About)about_list.get(0)).getAbocontact()%>">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight:bolder">联系电话：</td> 
                                            <td>   
                                                <div class="col-sm-9">
                                                    <input id="tel" type="text" name="abotel" class="form-control" placeholder="请输入电话号码" value="<%=((About)about_list.get(0)).getAbotel()%>">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight:bolder">联系邮箱：</td>
                                            <td>
                                                <div class="col-sm-9">
                                                    <input type="email" name="aboemail" class="form-control" placeholder="请输入邮箱" value="<%=((About)about_list.get(0)).getAboemail()%>">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight:bolder">地址：</td>
                                            <td>
                                                <div class="col-sm-9">
                                                    <input type="text" name="aboaddress" class="form-control" placeholder="请输入地址" value="<%=((About)about_list.get(0)).getAboaddress()%>">
                                                </div>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td style="font-weight:bolder">网站描述：</td>
                                            <td>
                                                <div class="col-sm-9">
                                                    <textarea name="abodescription"  class="form-control" rows="8"><%=((About)about_list.get(0)).getAbodescription()%></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td><input type="submit" class="btn btn-primary" value="更新" style="margin-left:15px"></td>
                                        </tr>
                                    </table>  
                                </form>
                          </div>  
                    </div>
                </div>
            </div>
        </div>
    <script src="js/jquery.min.js-v=2.1.4.js"></script>
    <script src="js/bootstrap.min.js-v=3.3.5.js"></script>
    <script src="js/plugins/footable/footable.all.min.js"></script>
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="js/content.min.js-v=1.0.0.js"></script>
    <script>
        $(document).ready(function(){$(".footable").footable();$(".footable2").footable()});
    </script>
    <script type="text/javascript">
        function checkAbo(){
            if(document.getElementById("tel").value.length != 11){
                swal("电话号码长度不对!");
                document.getElementById("tel").focus();
                return false;
            }
            return true;
        }
    </script>
</body>

</html>