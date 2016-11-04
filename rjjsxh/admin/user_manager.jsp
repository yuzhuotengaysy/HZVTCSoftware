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
                            <h5>用户管理</h5>
                        </div>
                        <div class="ibox-content">
                            <input type="text" class="form-control input-sm m-b-xs" id="filter" placeholder="搜索..." style="width:20%;float:right">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modal_add">新增用户</button>
                            <button class="btn btn-success" onclick="checked()">全选</button>
                            <button class="btn btn-danger" onclick="judgeDel(1)">批量删除</button>
                            <form action="main/customer_dels.jsp" method="post" id="customer_del" name="customer_del">
                                <table id="table" class="footable table table-stripped" data-page-size="8" data-filter=#filter>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th>用户帐户</th>
                                            <th>用户密码</th>
                                            <th>用户昵称</th>
                                            <th>性别</th>
                                            <th>电子邮箱</th>
                                            <th>电话号码</th>
                                            <th>地址</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            CustomerService customerservice = new CustomerService();
                                            Customer customer = new Customer();
                                            List customer_list = customerservice.query();
                                            int count = customer_list.size(), i = 0;
                                            while(count-- > 0){
                                                int cusid = ((Customer)customer_list.get(i)).getCusid();
                                        %>  
                                        <tr class="gradeX">       
                                            <td class='tc'><input name='id' value="<%=cusid%>" type='checkbox'></td>
                                            <td><%=cusid%></td>
                                            <td><%=((Customer)customer_list.get(i)).getCusname()%></td>  
                                            <td><%=((Customer)customer_list.get(i)).getCuspassword()%></td>  
                                            <td><%=((Customer)customer_list.get(i)).getCusnickname()%></td>  
                                            <td><%=((Customer)customer_list.get(i)).getCussex()%></td>  
                                            <td><%=((Customer)customer_list.get(i)).getCusemail()%></td>  
                                            <td><%=((Customer)customer_list.get(i)).getCustel()%></td>  
                                            <td><%=((Customer)customer_list.get(i)).getCusaddress()%></td>  
                                            <td>
                                                <input type="button" class="btn btn-primary customer_modify" value="修改">
                                                <input type="button" class="btn btn-danger customer_del" value="删除">
                                            </td>       
                                        </tr>   
                                        <%
                                                i++;
                                            }
                                        %>                           
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="11">
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
                    <h4 class="modal-title">新增用户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" name="customer_add" id="customer_add" action="main/customer_add.jsp" method="post" onsubmit="return customerAdd(this)">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户名：</label>
                            <div class="col-sm-8">
                                <input id="cusname" name="cusname" class="form-control" type="text" placeholder="请输入十位学号作为用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">密码：</label>
                            <div class="col-sm-8">
                                <input id="cuspassword" name="cuspassword" class="form-control" type="password" placeholder="请输入不小于六位数的密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">昵称：</label>
                            <div class="col-sm-8">
                                <input id="cusnickname" name="cusnickname" class="form-control" type="text"  placeholder="请输入昵称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" checked="" value="男" id="man" name="cussex">男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="女" id="woman" name="cussex">女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">E-mail：</label>
                            <div class="col-sm-8">
                                <input id="cusemail" name="cusemail" class="form-control" type="email"  placeholder="请输入电子邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话号码：</label>
                            <div class="col-sm-8">
                                <input id="custel" name="custel" class="form-control" type="text"  placeholder="请输入电话号码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">地址：</label>
                            <div class="col-sm-8">
                                <%@ include file="../main/connect.jsp" %>
                                <select name="province" id="province" onchange="set_city(this, document.getElementById('city'));"> 
                                  <option value=0>请选择</option> 
                                <%
                                  String sql = "select * from city where keyword = 0";
                                  ResultSet res = stmt.executeQuery(sql);
                                  while(res.next()){
                                    String province = res.getString("name");
                                %>
                                    <option value=<%=province%>><%=province%></option> 
                                <%
                                  }
                                %>
                                </select> 
                                <select id="city" name="city"> 
                                  <option value=0>请选择</option> 
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#customer_add').submit()">确定</button>
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
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal m-t" name="customer_modify" id="customer_modify" action="main/customer_modify.jsp" method="post">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户ID：</label>
                            <div class="col-sm-8">
                                <input id="cusid1" name="cusid" class="form-control" type="text" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户名：</label>
                            <div class="col-sm-8">
                                <input id="cusname1" name="cusname" class="form-control" type="text" value="" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">密码：</label>
                            <div class="col-sm-8">
                                <input id="cuspassword1" name="cuspassword" class="form-control" type="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">昵称：</label>
                            <div class="col-sm-8">
                                <input id="cusnickname1" name="cusnickname" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input type="radio" checked="" value="男" id="man1" name="cussex">男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="女" id="woman1" name="cussex">女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">E-mail：</label>
                            <div class="col-sm-8">
                                <input id="cusemail1" name="cusemail" class="form-control" type="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话号码：</label>
                            <div class="col-sm-8">
                                <input id="custel1" name="custel" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">地址：</label>
                            <div class="col-sm-8">
                                <select name="province" id="province1" onchange="set_city(this, document.getElementById('city1'));"> 
                                  <option value=0>请选择</option> 
                                <%
                                  sql = "select * from city where keyword = 0";
                                  res = stmt.executeQuery(sql);
                                  while(res.next()){
                                    String province = res.getString("name");
                                %>
                                    <option value=<%=province%>><%=province%></option> 
                                <%
                                  }
                                %>
                                </select> 
                                <select id="city1" name="city"> 
                                  <option value=0>请选择</option> 
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#customer_modify').submit()">确定</button>
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
cities = new Object(); 
<%
  ResultSet res1 = stmt.executeQuery(sql);
  int c = 1;
  while(res1.next()){    
    String sql2 = "select * from city where keyword = 1 and provinceid="+c;
    Statement stmt2 = conn.createStatement();  //创建Statement对象
    ResultSet res2 = stmt2.executeQuery(sql2);
    res2.last();
    int counts = res2.getRow();
    res2 = stmt2.executeQuery(sql2);
%>
    cities['<%=res1.getString("name")%>']=new Array(
<%
      for(int j = 0; j < counts-1; j++){
        res2.next();
%>
        '<%=res2.getString("name")%>',
<%
      }
      res2.next();
%>  
      '<%=res2.getString("name")%>'
    ); 
<%
   c++;
 }
%>

function set_city(province, city) { 
  var pv, cv; 
  var i, ii; 
  pv=province.value; 
  cv=city.value; 
  city.length=1; 
  if(pv=='0') return; 
  if(typeof(cities[pv])=='undefined') return; 
  for(i=0; i<cities[pv].length; i++){ 
    ii = i+1; 
    city.options[ii] = new Option(); 
    city.options[ii].text = cities[pv][i]; 
    city.options[ii].value = cities[pv][i]; 
  } 
} 
</script>
<%conn.close();%>
</body>

</html>