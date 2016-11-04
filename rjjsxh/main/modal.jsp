<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%-- 模态框 --%>
<!-- 登录模态框 -->
<div class="modal fade" id="signModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
		    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
	      <form action="main/logincheck.jsp" method="post" onsubmit="return signCheck()">
          <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
            <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名...">
          </div>
          <div class="input-group" >
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码...">
          </div>   
          <div class="input-group" >      
            <span class="input-group-addon"><span class="glyphicon glyphicon-barcode" aria-hidden="true"></span></span>
            <input type="text" id="code" name="code" class="form-control code" maxLength="4" placeholder="请输入验证码">
            <img border = 0 src="main/image.jsp" id="barcode" onclick="recode();" style="cursor:pointer">
          </div>
          <input type="submit" class="btn btn-default signBtn" value="登录" /> 
        </form>   
      </div>
    </div>
  </div>
</div>
<!-- 注册模态框 -->
<div class="modal fade" id="registerModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>
        <form  name="customer_add" id="customer_add" action="main/customer_add.jsp" method="post" onsubmit="return customerAdd(this)">
          <div class="form-group">
              
              <div>
                  <label class="control-label">用户名：</label>
                  <input id="cusname" name="cusname" class="form-control" type="text" placeholder="请输入十位学号作为用户名">
              </div>
          </div>
          <div class="form-group">
              
              <div>
                  <label class="control-label">密码：</label>
                  <input id="cuspassword" name="cuspassword" class="form-control" type="password" placeholder="请输入不小于六位数的密码">
              </div>
          </div>
          <div class="form-group">          
              <div>
                <label class="control-label">昵称：</label>
                  <input id="cusnickname" name="cusnickname" class="form-control" type="text"  placeholder="请输入昵称">
              </div>
          </div>
          <div class="form-group">
              <div>
                <label class="control-label">性别：</label>
                  <label class="radio-inline">
                      <input type="radio" checked="" value="男" id="man" name="cussex">男
                  </label>
                  <label class="radio-inline">
                      <input type="radio" value="女" id="woman" name="cussex">女
                  </label>
              </div>
          </div>
          <div class="form-group">
              <div>
                  <label class="control-label">E-mail：</label>
                  <input id="cusemail" name="cusemail" class="form-control" type="email"  placeholder="请输入电子邮箱">
              </div>
          </div>
          <div class="form-group">
              <div>
                  <label class="control-label">电话号码：</label>
                  <input id="custel" name="custel" class="form-control" type="text"  placeholder="请输入电话号码">
              </div>
          </div>
          <div class="form-group">
              
              <div>
                <label class="control-label">地址：</label>
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
          <button type="button" class="btn btn-primary" onclick="$('#customer_add').submit()">注册</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<!-- 修改密码模态框 -->
<div class="modal fade" id="modifyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>		
        <form action="main/modifyPsw.jsp" method="post" id="subCheck" onsubmit="return modifyCheck()">
          <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input type="password" id="password1" name="password1" class="form-control" placeholder="请输入新密码...">
          </div>
          <div class="input-group" style="margin-bottom:40px">
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input type="password" id="password2" name="password2" class="form-control" placeholder="请再输入新密码...">
          </div>
          <input type="submit" class="btn btn-default subModify" value="修改" /> 
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 修改头像模态框 -->
<div class="modal fade" id="picModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><br>    
        <form id="adadd" method="post" action="main/upload.jsp" enctype="multipart/form-data">
          <div class="form-group">       
                <label class="control-label" for="preview">头像预览</label>    
                <div id="preview">
                    <img id="imghead" height=270 border=0 src='images/defaul.jpeg'>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label"  for="picture">图片上传</label>
                <div>
                    <input id="picture" type="file" name="myFile"  onchange="previewImage(this)">
                </div>
            </div> 
            <div class="form-group">
                <div>
                    <button class="btn btn-primary" type="submit">上传</button>
                </div>
            </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
    function recode(){
        var image = document.getElementById("barcode");
        var myDate = new Date();
        image.src = "main/image.jsp?time="+myDate.getTime();
    }
    //图片上传预览    IE是用了滤镜。
    function previewImage(file)
    {
        var MAXWIDTH  = 520;
        var MAXHEIGHT = 270;
        var div = document.getElementById('preview');
        if (file.files && file.files[0])
        {
            div.innerHTML ='<img id=imghead>';
            var img = document.getElementById('imghead');
            img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
            }
            var reader = new FileReader();
            reader.onload = function(evt){img.src = evt.target.result;}
            reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
    }
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight )
        {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if( rateWidth > rateHeight )
            {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else
            {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }

        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }

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

    function customerAdd(fm){
      var reemail = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
      var retel = /^1\d{10}$/;
      if(fm.cusname.value == ""){
        alert("请输入用户名");
        fm.cusname.focus();
        return false;
      } else if(fm.cusname.value.length != 10){
        alert("请输入10位学号作为用户名");
        document.getElementById("cusname").focus();
        return false;
      } else if(fm.cuspassword.value == ""){
        alert("请输入密码");
        fm.cuspassword.focus();
        return false;
      } else if(fm.cuspassword.value.length < 6){
        alert("密码长度不得小于6位");
        fm.cuspassword.focus();
        return false;
      } else if(fm.cusnickname.value == ""){
        alert("请输入昵称");
        fm.cusnickname.focus();
        return false;
      } else if(!reemail.test(fm.cusemail.value)){
        alert("请输入正确的邮箱格式");
        fm.cusemail.focus();
        return false;
      }  else if(!retel.test(fm.custel.value)){
        alert("请输入正确的电话");
        fm.custel.focus();
        return false;
      } else{
        return true;
      }
    }
</script>
<%conn.close();%>
