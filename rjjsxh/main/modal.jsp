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
                  <select id="province" runat="server" onchange="selectprovince(this);" name="province"></select>
                  <select id="city" runat="server" name="city"></select>
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

        var list1 = new Array;
    var list2 = new Array;
    list1[list1.length] = "北京市";
    list1[list1.length] = "天津市";
    list1[list1.length] = "河北省";
    list1[list1.length] = "山西省";
    list1[list1.length] = "内蒙古";
    list1[list1.length] = "辽宁省";
    list1[list1.length] = "吉林省";
    list1[list1.length] = "黑龙江省";
    list1[list1.length] = "上海市";
    list1[list1.length] = "江苏省";
    list1[list1.length] = "浙江省";
    list1[list1.length] = "安徽省";
    list1[list1.length] = "福建省";
    list1[list1.length] = "江西省";
    list1[list1.length] = "山东省";
    list1[list1.length] = "河南省";
    list1[list1.length] = "湖北省";
    list1[list1.length] = "湖南省";
    list1[list1.length] = "广东省";
    list1[list1.length] = "广西自治区";
    list1[list1.length] = "海南省";
    list1[list1.length] = "重庆市";
    list1[list1.length] = "四川省";
    list1[list1.length] = "贵州省";
    list1[list1.length] = "云南省";
    list1[list1.length] = "西藏自治区";
    list1[list1.length] = "陕西省";
    list1[list1.length] = "甘肃省";
    list1[list1.length] = "青海省";
    list1[list1.length] = "宁夏回族自治区";
    list1[list1.length] = "新疆维吾尔自治区";
    list1[list1.length] = "香港特别行政区";
    list1[list1.length] = "澳门特别行政区";
    list1[list1.length] = "台湾省";
    list1[list1.length] = "其它";

    list2[list2.length] = new Array("北京", "东城区", "西城区", "崇文区", "宣武区", "朝阳区", "丰台区", "石景山区", " 海淀区（中关村）", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云县", "延庆县", " 其他");
    list2[list2.length] = new Array("和平区", "河东区", "河西区", "南开区", "红桥区", "塘沽区", "汉沽区", "大港区",
            "西青区", "津南区", "武清区", "蓟县", "宁河县", "静海县", "其他");
    list2[list2.length] = new Array("石家庄市", "张家口市", "承德市", "秦皇岛市", "唐山市", "廊坊市", "衡水市",
            "沧州市", "邢台市", "邯郸市", "保定市", "其他");
    list2[list2.length] = new Array("太原市", "朔州市", "大同市", "长治市", "晋城市", "忻州市", "晋中市", "临汾市",
            "吕梁市", "运城市", "其他");
    list2[list2.length] = new Array("呼和浩特市", "包头市", "赤峰市", "呼伦贝尔市", "鄂尔多斯市", "乌兰察布市",
            "巴彦淖尔市", "兴安盟", "阿拉善盟", "锡林郭勒盟", "其他");
    list2[list2.length] = new Array("沈阳市", "朝阳市", "阜新市", "铁岭市", "抚顺市", "丹东市", "本溪市", "辽阳市",
            "鞍山市", "大连市", "营口市", "盘锦市", "锦州市", "葫芦岛市", "其他");
    list2[list2.length] = new Array("长春市", "白城市", "吉林市", "四平市", "辽源市", "通化市", "白山市", "延边朝鲜族自治州", "其他");
    list2[list2.length] = new Array("哈尔滨市", "七台河市", "黑河市", "大庆市", "齐齐哈尔市", "伊春市", "佳木斯市",
            "双鸭山市", "鸡西市", "大兴安岭地区(加格达奇)", "牡丹江", "鹤岗市", "绥化市　", "其他");
    list2[list2.length] = new Array("黄浦区", "卢湾区", "徐汇区", "长宁区", "静安区", "普陀区", "闸北区", "虹口区",
            "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县", "其他");
    list2[list2.length] = new Array("南京市", "徐州市", "连云港市", "宿迁市", "淮安市", "盐城市", "扬州市", "泰州市",
            "南通市", "镇江市", "常州市", "无锡市", "苏州市", "其他");
    list2[list2.length] = new Array("杭州市", "湖州市", "嘉兴市", "舟山市", "宁波市", "绍兴市", "衢州市", "金华市",
            "台州市", "温州市", "丽水市", "其他");
    list2[list2.length] = new Array("合肥市", "宿州市", "淮北市", "亳州市", "阜阳市", "蚌埠市", "淮南市", "滁州市",
            "马鞍山市", "芜湖市", "铜陵市", "安庆市", "黄山市", "六安市", "巢湖市", "池州市", "宣城市", "其他");
    list2[list2.length] = new Array("福州市", "南平市", "莆田市", "三明市", "泉州市", "厦门市", "漳州市", "龙岩市", "宁德市", "其他");
    list2[list2.length] = new Array("南昌市", "九江市", "景德镇市", "鹰潭市", "新余市", "萍乡市", "赣州市", "上饶市",
            "抚州市", "宜春市", "吉安市", "其他");
    list2[list2.length] = new Array("济南市", "聊城市", "德州市", "东营市", "淄博市", "潍坊市", "烟台市", "威海市",
            "青岛市", "日照市", "临沂市", "枣庄市", "济宁市", "泰安市", "莱芜市", "滨州市", "菏泽市", "其他");
    list2[list2.length] = new Array("郑州市", "三门峡市", "洛阳市", "焦作市", "新乡市", "鹤壁市", "安阳市", "濮阳市",
            "开封市", "商丘市", "许昌市", "漯河市", "平顶山市", "南阳市", "信阳市", "周口市", "驻马店市", "其他");
    list2[list2.length] = new Array("武汉市", "十堰市", "襄樊市", "荆门市", "孝感市", "黄冈市", "鄂州市", "黄石市",
            "咸宁市", "荆州市", "宜昌市", "随州市", "恩施土家族苗族自治州", "仙桃市", "天门市", "潜江市", "神农架林区", "其他");
    list2[list2.length] = new Array("长沙市", "张家界市", "常德市", "益阳市", "岳阳市", "株洲市", "湘潭市", "衡阳市",
            "郴州市", "永州市", "邵阳市", "怀化市", "娄底市", "湘西土家族苗族自治州", "其他");
    list2[list2.length] = new Array("广州市", "清远市市", "韶关市", "河源市", "梅州市", "潮州市", "汕头市", "揭阳市",
            "汕尾市", " 惠州市", "东莞市", "深圳市", "珠海市", "中山市", "江门市", "佛山市", "肇庆市", "云浮市",
            "阳江市", "茂名市", "湛江市", " 其他");
    list2[list2.length] = new Array("南宁市", "桂林市", "柳州市", "梧州市", "贵港市", "玉林市", "钦州市", "北海市",
            "防城港市", "崇左市", "百色市", "河池市", "来宾市", "贺州市", "其他");
    list2[list2.length] = new Array("海口市", "三亚市", "其他");
    list2[list2.length] = new Array("渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区",
            "万盛区", "双桥区", "渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区", "合川市", "永川市",
            "江津市", "南川市", "綦江县", "潼南县", "铜梁县", "大足县", "璧山县", "垫江县", "武隆县", "丰都县",
            "城口县", "开县", "巫溪县", "巫山县", "奉节县", "云阳县", "忠县", "石柱土家族自治县", "彭水苗族土家族自治县",
            "酉阳土家族苗族自治县", "秀山土家族苗族自治县", "其他");
    list2[list2.length] = new Array("成都市", "广元市", "绵阳市", "德阳市", "南充市", "广安市", "遂宁市",
            "内江市", "乐山市", "自贡市", "泸州市", "宜宾市", "攀枝花市", "巴中市", "资阳市", "眉山市", "雅安",
            "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州县", "其他");
    list2[list2.length] = new Array("贵阳市", "六盘水市", "遵义市", "安顺市", "毕节地区", "铜仁地区",
            "黔东南苗族侗族自治州", "黔南布依族苗族自治州", "黔西南布依族苗族自治州", "其他");
    list2[list2.length] = new Array("昆明市", "曲靖市", "玉溪市", "保山市", "昭通市", "丽江市", "普洱市",
            "临沧市", "宁德市", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "楚雄彝族自治州", "红河哈尼族彝族自治州",
            "文山壮族苗族自治州", "大理白族自治州", "迪庆藏族自治州", "西双版纳傣族自治州", "其他");
    list2[list2.length] = new Array("拉萨市", "那曲地区", "昌都地区", "林芝地区", "山南地区", "日喀则地区", "阿里地区", "其他");
    list2[list2.length] = new Array("西安市", "延安市", "铜川市", "渭南市", "咸阳市", "宝鸡市", "汉中市", "安康市", "商洛市", "其他");
    list2[list2.length] = new Array("兰州市 ", "嘉峪关市", "金昌市", "白银市", "天水市", "武威市", "酒泉市",
            "张掖市", "庆阳市", "平凉市", "定西市", "陇南市", "临夏回族自治州", "甘南藏族自治州", "其他");
    list2[list2.length] = new Array("西宁市", "海东地区", "海北藏族自治州", "黄南藏族自治州", "玉树藏族自治州",
            "海南藏族自治州", "果洛藏族自治州", "海西蒙古族藏族自治州", "其他");
    list2[list2.length] = new Array("银川市", "石嘴山市", "吴忠市", "固原市", "中卫市", "其他");
    list2[list2.length] = new Array("乌鲁木齐市", "克拉玛依市", "喀什地区", "阿克苏地区", "和田地区", "吐鲁番地区",
            "哈密地区", "塔城地区", "阿勒泰地区", "克孜勒苏柯尔克孜自治州", "博尔塔拉蒙古自治州",
            "昌吉回族自治州伊犁哈萨克自治州", "巴音郭楞蒙古自治州", "河子市", "阿拉尔市", "五家渠市", "图木舒克市", "其他");
    list2[list2.length] = new Array("香港", "其他");
    list2[list2.length] = new Array("澳门", "其他");
    list2[list2.length] = new Array("台湾", "其他");

    var ddlProvince = document.getElementById("province");
    var ddlCity = document.getElementById("city");
    for(var i =0;i<list1.length; i++)
    {
        var option = document.createElement("option");
        option.appendChild(document.createTextNode(list1[i]));
        option.value = list1[i];
        ddlProvince.appendChild(option);
        //city initialize
        var firstprovince = list2[0];
        for (var j = 0; j < firstprovince.length; j++) {
            var optioncity = document.createElement("option");
            optioncity.appendChild(document.createTextNode(firstprovince[j]));
            optioncity.value = firstprovince[j];
            ddlCity.appendChild(optioncity);
        }
    }
    function indexof(obj,value)
    {
        var k=0;
        for(;k<obj.length;k++)
        {
            if(obj[k] == value)
                return k;
        }
        return k;
    }
    function selectprovince(obj) {
        ddlCity.options.length = 0;//clear
        var index = indexof(list1,obj.value);
        var list2element = list2[index];
        for(var i =0;i<list2element.length; i++)
        {
            var option = document.createElement("option");
            option.appendChild(document.createTextNode(list2element[i]));
            option.value = list2element[i];
            ddlCity.appendChild(option);
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
