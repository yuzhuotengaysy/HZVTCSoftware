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
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="css/style.min.css-v=4.0.0.css" rel="stylesheet">

    <script type="text/javascript">
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
    </script>

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">

        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>头像上传</h5>
                    </div>
                    <div class="ibox-content">
                        <ul class="nav nav-tabs" id="avatar-tab">
                            <li class="active" id="upload"><a href="javascript:0">本地上传</a>
                            </li>
                            <li id="webcam"><a href="javascript:0" onclick="swal('未完成')">视频拍照</a>
                            </li>
                        </ul>
                        <div class="m-t m-b">
                            <form id="adadd" method="post" action="main/head_update.jsp" class="form-horizontal m-t" enctype="multipart/form-data">
                              <div class="form-group">       
                                    <label class="col-sm-3 control-label" for="preview">图片预览</label>    
                                    <div class="col-sm-8" id="preview">
                                        <img id="imghead" height=270 border=0 src='img/defaul.jpeg'>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"  for="picture">图片上传</label>
                                    <div class="col-sm-8">
                                        <input id="picture" type="file" class="form-control" name="myFile"  onchange="previewImage(this)">
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-3">
                                        <button class="btn btn-primary" type="submit">上传</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js-v=2.1.4.js"></script>
    <script src="js/bootstrap.min.js-v=3.3.5.js"></script>
    <script src="js/content.min.js-v=1.0.0.js"></script>
    <script type="text/javascript" src="plugins/fullavatareditor/scripts/swfobject.js"></script>
    <script type="text/javascript" src="plugins/fullavatareditor/scripts/fullAvatarEditor.js"></script>
    <script type="text/javascript" src="plugins/fullavatareditor/scripts/jQuery.Cookie.js"></script>
    <script type="text/javascript" src="plugins/fullavatareditor/scripts/test.js"></script>
    <script src="js/plugins/sweetalert/sweetalert.min.js"></script>
</body>

</html>