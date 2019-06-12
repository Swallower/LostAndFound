<%@ page language="java" import="java.util.*,dao.*,userBean.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

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
  <title>用户个人信息</title>
  <style type="text/css">
	.reg_div{
		width: 25%;
		height: 300px;
	}
</style>

</head>
<body>

  <div class="reg_div">
    <p>用户个人信息</p>
      <%
    String userid=(String)session.getAttribute("userID");
    UserDao userDao = new UserDao();
    Users users =userDao.getUsersByxuehao(userid);
  %>
    <ul class="reg_ul">
      <li>
          <span>姓名：</span>
          <span><%=users.getUsername()%></span>

      </li>
      <li>
          <span>学号：</span>
           <span><%=users.getXuehao()%></span>
          
      </li>
      <li>
          <span>手机号：</span>
           <span><%=users.getPhoneNum() %></span>
        
      </li>
      <li>
          <span style="margin-right:20px;">邮箱：</span>
          <span><%=users.getEmail() %></span>
        
      </li>
    </ul>

  </div>
  
  <script type="text/javascript" src="JS/jquery-1.10.1.js" charset="UTF-8"></script>
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
<body>



</body>
</html>