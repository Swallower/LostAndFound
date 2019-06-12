<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<%@ include file="CheckLogin.jsp"%>
<meta charset="utf-8">
<title>我的信息</title>

<a style="position:absolute;left: 20%;top: -30%;" href="OutLogin.jsp" >退出</a>
<link rel="stylesheet" href="css/stylle.css" type="text/css" media="all"/>
<style type="text/css">
a{  
    display: block;
    margin-top: 20%;
}
a:hover{
    color: #F80C0C;
}
</style>
</head>

<body style="background:#f5f5f5;">

<script src="JS/jquery-1.10.1.js"></script>
<script type="text/javascript" src="JS/function.js"></script>
<script type="text/javascript">
$(function() {
    $("#cardArea").cardArea()
});
</script>

<ul id="cardArea" class="card-area clearfix">
    <li class="card-item">
        <div class="card">
            <div class="card-title title-even">
                <div class="content"><h1>丢失</h1></div>
            </div>
            <div class="card-content content-first">
                <div style="padding:50px;">移动至此可以上传自己丢失的物品，还可以看到全校的丢失信息表哦~</div>
            </div>
            <div class="card-content content-second">
                <div class="main-info">
                    <ul>                        
                        <li>
                            <div class="left">
                                <p class="tit">我要上传</p>
                                <p class="hys">我丢了东西，我要上传，希望能找到</p>
                            </div>
                            <div class="right">
                               <a href="LostUpload.jsp" target="__blank">查看详情</a>
                            </div>
                        </li>
                        <li>
                            <div class="left">
                                <p class="tit">丢失信息表</p>
                                <p class="hys">全校丢失信息表详见</p>
                            </div>
                            <div class="right">
                                
                                <a href="LostInformation.jsp" target="__blank">查看详情</a>
                            </div>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
    </li>
    <li class="card-item active">
        <div class="card">
            <div class="card-title title-even">
                <div class="content"><h1>我的个人信息</h1></div>
            </div>
            <div class="card-content content-first">
                <div style="padding:50px;">点击查看我的个人信息</div>
            </div>

            <div class="card-content content-second">
                <div class="main-info">
                    <ul>
                        <li>
                            <div class="left">
                                <p class="tit">个人信息</p>
                                <p class="hys">个人信息详见，可更改自己的信息</p>
                            </div>
                            <div class="right">
                               <a href="MyInformation.jsp" target="__blank">查看详情</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </li>
    <li class="card-item">
        <div class="card">
            <div class="card-title title-even">
                <div class="content"><h1>拾到</h1></div>
            </div>
            <div class="card-content content-first">
                <div style="padding:50px;">全校所有的拾到信息在放在这了，你有拾到什么嘛？</div>
            </div>

            <div class="card-content content-second">
                <div class="main-info">
                    <ul>
                        <li>
                            <div class="left">
                                <p class="tit">我要上传</p>
                                <p class="hys">我拾到东西了，希望失主可以联系我</p>
                            </div>
                            <div class="right">
                               <a href="PickUpload.jsp" target="__blank">查看详情</a>
                            </div>
                        </li>
                        <li>
                            <div class="left">
                                <p class="tit">拾到信息表</p>
                                <p class="hys">全校拾到物品信息表详见</p>
                            </div>
                            <div class="right">
                                <a href="PickInformation.jsp" target="__blank">查看详情</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </li>
</ul>


</body>
</html>

