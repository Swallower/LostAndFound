<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 重置文件 -->
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/style.css">
    <title>注册</title>

</head>
<body>
<div class="reg_div">
    <p>注册</p>
    <form method="post" action="RegisterSuccess.jsp" >
        <ul class="reg_ul">
            <li>
                <span>姓名：</span>
                <input type="text" name="username" value="" placeholder="输入用户名(中文)" class="reg_user">
                <span class="user_hint"></span>
            </li>
            <li>
                <span>学号：</span>
                <input type="xuehao" name="xuehao" value="" placeholder="输入正确的学号" class="reg_xuehao">
                <span class="xuehao_hint"></span>
            </li>
            <li>
                <span>密码：</span>
                <input type="password" name="userpass" value="" placeholder="6-16位密码" class="reg_password">
                <span class="password_hint"></span>
            </li>
            <li>
                <span>确认密码：</span>
                <input type="password" name="" value="" placeholder="确认密码" class="reg_confirm">
                <span class="confirm_hint"></span>
            </li>
            <li>
                <span>手机号：</span>
                <input type="text" name="phoneNum" value="" placeholder="手机号" class="reg_mobile">
                <span class="mobile_hint"></span>
            </li>
            <li>
                <span>邮箱：</span>
                <input type="text" name="email" value="" placeholder="邮箱地址" class="reg_email">
                <span class="mobile_hint"></span>
            </li>
            <li>
                <span>验证：</span>
                <input type="text" name="verification" value="" placeholder="验证" class="reg_verification">
                <span class="mobile_hint"></span>
            </li>
            <li>
                <button type="submit" name="button" class="red_button">注册</button>
            </li>
        </ul>
    </form>
</div>

<script type="text/javascript" src="JS/jquery-1.10.1.js" charset="UTF-8"></script>
<script type="text/javascript" src="JS/JavaScript.js" charset="UTF-8"></script>
<style>
    html,body {
        margin:0;
        overflow:hidden;
        width:100%;
        height:100%;
        cursor:none;
        background:black;
        background:linear-gradient(to bottom,#000000 0%,#5788fe 100%);
    }
    .filter {
        width:100%;
        height:100%;
        position:absolute;
        top:0;
        left:0;
        background:#fe5757;
        animation:colorChange 30s ease-in-out infinite;
        animation-fill-mode:both;
        mix-blend-mode:overlay;
    }
    @keyframes colorChange {
        0%,100% {
            opacity:0;
        }
        50% {
            opacity:.9;
        }
    }.landscape {
         position:absolute;
         bottom:0px;
         left:0;
         width:100%;
         height:100%;

         background-image:url('images/xkbg.png');
         background-size:1000px 250px;
         background-repeat:repeat-x;
         background-position:center bottom;
     }
</style>
</head>
</body>



</body>
</html>