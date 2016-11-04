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
                            <h5>资源管理</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="搜索..." style="width:20%;float:right">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modal_add">发布资源</button>
                            <button class="btn btn-success" onclick="checked()">全选</button>
                            <button class="btn btn-danger" onclick="judgeDel(3)">批量删除</button>
                            <form action="main/data_dels.jsp" method="post" id="data_del" name="data_del">
                                <table id="table" class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th>资源名称</th>
                                            <th>资源链接</th>
                                            <th>发布时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            DataService dataservice = new DataService();
                                            Data data = new Data();
                                            List data_list = dataservice.query();
                                            int count = data_list.size(), i = 0;
                                            while(count-- > 0){
                                                int dataid = ((Data)data_list.get(i)).getDataid();
                                                String time = ((Data)data_list.get(i)).getDatatime();
                                                time = time.substring(0, 11);    
                                        %>  
                                        <tr class="gradeX">          
                                            <td class='tc'><input name='id' value="<%=dataid%>" type='checkbox'></td>
                                            <td><%=dataid%></td>
                                            <td><%=((Data)data_list.get(i)).getDataname()%></td>  
                                            <td><%=((Data)data_list.get(i)).getDatalink()%></td>  
                                            <td><%=time%></td>  
                                            <td>
                                                <input type="button" class="btn btn-primary data_modify" value="修改">
                                                <input type="button" class="btn btn-danger data_del" value="删除">
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


    <!-- 模态框 -->
    <div class="modal inmodal" id="modal_add" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">发布资源</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" name="data_add" id="data_add" action="main/data_add.jsp" method="post" onsubmit="return dataAdd(this)" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">资源名称：</label>
                            <div class="col-sm-8">
                                <input id="dataname" name="dataname" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">附件：</label>
                            <div class="col-sm-8">
                                <input id="datalink" name="datalink" class="form-control" type="file">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#data_add').submit()">确定</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>    

    <div class="modal inmodal" id="modal_modify" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">修改资源</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" name="data_modify" id="data_modify" action="main/data_modify.jsp" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">资源ID：</label>
                            <div class="col-sm-8">
                                <input id="dataid1" name="dataid" class="form-control" type="text" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">资源名称：</label>
                            <div class="col-sm-8">
                                <input id="dataname1" name="dataname" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">当前附件：</label>
                            <div class="col-sm-8">
                                <input id="datafile1" name="datafile" class="form-control" type="text" readonly=true>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">更换附件：</label>
                            <div class="col-sm-8">
                                <input id="datalink1" name="datalink" class="form-control" type="file">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#data_modify').submit()">确定</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>    
</body>

</html>