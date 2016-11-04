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
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>留言管理</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="搜索..." style="width:20%;float:right">
                            <button class="btn btn-success" onclick="checked()">全选</button>
                            <button class="btn btn-danger" onclick="judgeDel(4)">批量删除</button>
                            <form action="main/message_dels.jsp" method="post" id="message_del" name="message_del">
                                <table class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th>用户昵称</th>
                                            <th>留言内容</th>
                                            <th>留言时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            MessageService messageservice = new MessageService();
                                            Message message = new Message();
                                            List message_list = messageservice.query();
                                            int count = message_list.size(), i = 0;
                                            while(count-- > 0){
                                                int mesid = ((Message)message_list.get(i)).getMesid();
                                                String time = ((Message)message_list.get(i)).getMestime(); 
                                                time = time.substring(0, 11);   
                                        %>  
                                        <tr class="gradeX">          
                                            <td class='tc'><input name='id' value="<%=mesid%>" type='checkbox'></td>
                                            <td><%=mesid%></td>
                                            <td><%=((Message)message_list.get(i)).getMesnickname()%></td>  
                                            <td><%=((Message)message_list.get(i)).getMestext()%></td>  
                                            <td><%=time%></td> 
                                            <td>
                                                <input type="button" class="btn btn-danger message_del" value="删除">
                                            </td>                   
                                        </tr>      
                                        <%
                                                i++;
                                            }
                                        %>                           
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">
                                                <ul class="pagination pull-right"></ul>
                                            </td>
                                        </tr>
                                    </tfoot>
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
    <script src="js/script.js"></script>
</body>

</html>