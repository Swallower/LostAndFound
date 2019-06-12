<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String username=(String)session.getAttribute("username");

if(username==null){
out.print("<script>alert('必须登录才能访问主页');location.href='Login.jsp';</script>");
}else{
out.print("<font color='grey' size='4'>"+""+"欢迎"+"<img src='images/ico.png' style='width:50px;height:50px;'>"+username+"    "+"进入失物招领系统！"+"</font>");
}
 %>