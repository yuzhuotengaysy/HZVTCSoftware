<%@ page language="java" import="java.util.*, java.sql.*" pageEncoding="utf-8"%>
<%@ include file="../main/connect.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>杭职软协后台管理系统</title>
    <link rel="shortcut icon" href="favicon.ico" > 
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
                            <h5>公告管理</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="搜索..." style="width:20%;float:right">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modal_add">发布公告</button>
                            <button class="btn btn-success" onclick="checked()">全选</button>
                            <button class="btn btn-danger" onclick="judgeDel(2)">批量删除</button>
                            <form action="main/notice_dels.jsp" method="post" id="notice_del" name="notice_del">
                                <table id="table" class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th>公告标题</th>
                                            <th>发布人</th>
                                            <th style="display:none">公告内容</th>
                                            <th>发布时间</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ResultSet res = stmt.executeQuery("select * from notice");
                                            while(res.next()){
                                            String notid = res.getString(1);
                                            String time = res.getString(5);
                                            time = time.substring(0,10);
                                        %>  
                                        <tr class="gradeX">          
                                            <td class='tc'><input name='id' value="<%=notid%>" type='checkbox'></td>
                                            <td><%=notid%></td>
                                            <td><%=res.getString(2)%></td>  
                                            <td><%=res.getString(3)%></td>  
                                            <td style="display:none"><%=res.getString(4)%></td>  
                                            <td><%=time%></td>  
                                            <td>
                                                <input type="button" class="btn btn-primary notice_modify" value="修改">
                                                <input type="button" class="btn btn-danger notice_del" value="删除">
                                            </td>                   
                                        </tr>    
                                        <%
                                            }
                                        %>                            
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="7">
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
    <script src="ckeditor/ckeditor.js"></script>
    <script src="js/content.min.js-v=1.0.0.js"></script>
    <script>
        $(document).ready(function(){$(".footable").footable();$(".footable2").footable()});
    </script>
    <script src="js/script.js"></script>

        <!-- 模态框 -->
    <div class="modal inmodal" id="modal_add" tabindex="-1" role="dialog" aria-hidden="true">
        <div>
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">发布公告</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" name="notice_add" id="notice_add" action="main/notice_add.jsp" method="post" onsubmit="return noticeAdd(this)">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告标题：</label>
                            <div class="col-sm-8">
                                <input id="nottitle" name="nottitle" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">发布人：</label>
                            <div class="col-sm-8">
                                <input id="notauthor" name="notauthor" class="form-control" type="text" value="<%=session.getAttribute("nickname")%>" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告内容：</label>
                            <div class="col-sm-8">
                                <textarea name="notcontent" id="notcontent"></textarea>
                                <script type="text/javascript">CKEDITOR.replace('notcontent');</script>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#notice_add').submit()">确定</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>    

    <div class="modal inmodal" id="modal_modify" tabindex="-1" role="dialog" aria-hidden="true">
        <div>
            <div class="modal-content animated bounceInRight">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                    </button>
                    <h4 class="modal-title">修改公告</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" name="notice_modify" id="notice_modify" action="main/notice_modify.jsp" method="post">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告ID：</label>
                            <div class="col-sm-8">
                                <input id="notid1" name="notid" class="form-control" type="text"  readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告标题：</label>
                            <div class="col-sm-8">
                                <input id="nottitle1" name="nottitle" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">发布人：</label>
                            <div class="col-sm-8">
                                <input id="notauthor1" name="notauthor" class="form-control" type="text" value="<%=session.getAttribute("nickname")%>" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">公告内容：</label>
                            <div class="col-sm-8">
                                <textarea id="notcontent1" name="notcontent"></textarea>
                                <script type="text/javascript">CKEDITOR.replace('notcontent1');</script>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#notice_modify').submit()">确定</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>  
</body>

</html>