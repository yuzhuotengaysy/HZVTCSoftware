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
                            <h5>软协成员</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="搜索..." style="width:20%;float:right">
                            <table id="table" class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>职务</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>系院</th>
                                        <th>班级</th>
                                        <th>电话</th>
                                        <th>寝室</th>
                                        <th>会费</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        RosterService rosterservice = new RosterService();
                                        Roster roster = new Roster();
                                        List roster_list = rosterservice.query();
                                        int count = roster_list.size(), i = 0;
                                        while(count-- > 0){
                                    %>  
                                    <tr class="gradeX">       
                                        <td class="rosterid"><%=((Roster)roster_list.get(i)).getId()%></td>
                                        <td><%=((Roster)roster_list.get(i)).getJob()%></td>  
                                        <td><%=((Roster)roster_list.get(i)).getName()%></td>  
                                        <td><%=((Roster)roster_list.get(i)).getSex()%></td>  
                                        <td><%=((Roster)roster_list.get(i)).getDepartment()%></td>  
                                        <td><%=((Roster)roster_list.get(i)).getClassess()%></td>  
                                        <td><%=((Roster)roster_list.get(i)).getTel()%></td> 
                                        <td><%=((Roster)roster_list.get(i)).getDormitory()%></td>      
                                        <td><%
                                            if(((Roster)roster_list.get(i)).getFee() == 0){
                                                out.print("<input type='button' class='btn btn-primary roster_get' value='确认'>");
                                            } else{
                                                out.print("已缴纳");
                                            }
                                            %>
                                        </td>   
                                    </tr>   
                                    <%
                                            i++;
                                        }
                                    %>                           
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="10">
                                            <ul class="pagination pull-right"></ul>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
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
    <script type="text/javascript">
        $(".roster_get").click(function(e){
        var id = $(this).parent().parent().find(".rosterid").text();
        swal({
            title: "确定该会员已经缴费?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            closeOnConfirm: false
        }, function () {
            window.location.href="main/roster_get.jsp?id="+id;
        });
        return;
    });
    </script>
</body>

</html>