<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>      
<html>
<head>
    <meta charset="UTF-8">
    <title>丢失信息上传</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style type="text/css">
    #imghead{
      margin-left: 140px;
      margin-bottom: 20px;
    }

    </style>
    <script src="JS/jquery-1.10.1.js"></script>
    <script src="JS/vue.min.js"></script>

    <script>

      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 40; 
          var MAXHEIGHT = 40;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
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
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else{
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }


        $(document).ready(function(){
                $(".btn-danger").click(function (){
                  $("#imghead").attr("src","images/photo_icon.png");  
                });
        });
    </script> 
    <script>    
setInterval("fun(show_time)",1);  
function fun(timeID){   
var date = new Date();  //创建对象    
var y = date.getFullYear();     //获取年份    
var m =date.getMonth()+1;   //获取月份  返回0-11    
var d = date.getDate(); // 获取日    
var w = date.getDay();   //获取星期几  返回0-6   (0=星期天)   
var ww = ' 星期'+'日一二三四五六'.charAt(new Date().getDay()) ;//星期几  
var h = date.getHours();  //时  
var minute = date.getMinutes()  //分  
var s = date.getSeconds(); //秒  
var sss = date.getMilliseconds() ; //毫秒  
if(m<10){  
m = "0"+m;  
}  
if(d<10){  
d = "0"+d;  
}  
if(h<10){  
h = "0"+h;  
}    
if(minute<10){  
minute = "0"+minute;  
}  
  
  
if(s<10){  
s = "0"+s;  
}   
  
if(sss<10){  
sss = "00"+sss;  
}else if(sss<100){  
sss = "0"+sss;  
}    
document.getElementById(timeID.id).innerHTML =  y+"-"+m+"-"+d+"   "+h+":"+minute+":"+s+"  "+ww;  
//document.write(y+"-"+m+"-"+d+"   "+h+":"+minute+":"+s);    
  }  
</script>    
</head>
<body>
    <div class="container" id="box">
        <form role="form" method="post" action="LostUploadSucc.jsp" style="margin-top:100px;">
            <div class="form-group">
                <label for="username">名  称:</label>
                <input type="text" name="title" id="username" class="form-control" placeholder="输入用户名" >
            </div>
            <div class="form-group">
                <label for="miaoshu">描  述:</label>
                <textarea type="text" id="miaoshu" name="miaoshu"class="form-control" placeholder="描述该物品"></textarea>
            </div>
            <div class="form-group">
            <label for="style">类  型:</label>
                <select name="style">
	                <option value="select" selected>请选择</option>
	                <option value="Upan">U盘</option>
	                <option value="xiaoyuanka">校园卡</option>
	                <option value="yaoshi" >钥匙</option>
	                <option value="phone" >手机</option>
	                <option value="keben" >课本</option>
	                <option value="wuping" >物品</option>
            </select>
            </div>
          <div id="addCommodityIndex">

      <%--<!--       <div class="input-group row">--%>
                <%--<div class="col-sm-3">--%>
                    <%--<label >物品图片</label>--%>
                <%--</div>--%>
                <%--<div class="col-sm-9 big-photo">--%>
                    <%--<div id="preview">--%>
                      	<%--<img id="imghead" name="image" border="0"  src="images/photo_icon.png" width="90" height="90" onclick="$('#previewImg').click();" >--%>

                     <%--</div>         --%>
                    <%--<input type="file" onchange="previewImage(this)" style="display: none;"  id="previewImg"  >--%>
                <%--</div>--%>
            <%--</div>--%>
    <%----> --%>
        <%--</div>--%>
        <div class="form-group">
            <label for="place">地 点:</label>
            <select name="place">
                <option value="select" selected>请选择</option>
                <option value="Abuilding">教学A楼</option>
                <option value="Bbuilding">教学B楼</option>
                <option value="Cbuilding" >教学C楼</option>
                <option value="Dbuilding" >教学D楼</option>
                <option value="Playground" >风雨操场</option>
                <option value="Artbuilding" >艺术楼</option>
            </select>
        </div>
        <div style="margin-bottom:20px;">
        <label for="meeting">丢失日期：</label><input name="losttime" id="meeting"  type="datetime-local" value="2019-04-06"/>
        </div>   
        <%--<div id="show_time" style="margin-left: 20%;margin-bottom:20px;" name="updatatime">    --%>

        <%--</div>        --%>
          <div class="form-group">
              <input type="submit" value="添加" class="btn btn-primary">
              <input type="reset" value="重置" class="btn btn-danger">
          </div>
        </form>

        <hr>
       


</body>
<style type="text/css">

</style>
</html>