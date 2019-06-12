<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-hans-cn">
<head>
    <meta charset="UTF-8">
    <meta name="Author" content="Rin">
    <title>我的个人中心</title>
    <link rel="stylesheet" href="css/asidenav.css">
</head>
<body style="background: black;">
<div>
    <svg width="0" height="0">
        <defs>
            <filter id="goo">
                <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur"></feGaussianBlur>
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo"></feColorMatrix>
                <feComposite in="SourceGraphic" in2="goo" operator="atop"></feComposite>
            </filter>
        </defs>
    </svg>
    <div class="aside-nav bounceInUp animated" id="aside-nav">
        <label for="" class="aside-menu" title="按住拖动">菜单</label>

        <a href="Information.jsp" target="_blank" title="显示我的个人信息" class="menu-item menu-line menu-first">我的<br>信息</a>
        <a href="UpdateInformation.jsp" target="_blank" title="可在此修改个人信息" class="menu-item menu-line menu-second">修改个<br>人信息</a>
        <a href="UploadLost.jsp" target="_blank" title="查看我的上传记录" class="menu-item  menu-line menu-third">上传<br>记录</a>
        <a href="UploadPick.jsp"  target="_blank" title="查看我的拾得记录" class="menu-item menu-line menu-fourth">拾得<br>记录</a>
    </div>
</div>    
<script src="JS/jquery-1.10.1.js"></script>
<script src="JS/asidenav.js">
</script>
</body>
</html>