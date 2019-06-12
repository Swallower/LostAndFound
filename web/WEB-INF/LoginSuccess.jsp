<%@ page language="java" import="dao.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>

<%
request.setCharacterEncoding("utf-8");
String username=request.getParameter("username");
String userpass=request.getParameter("userpass");

UserDao uDao = new UserDao();
boolean b = uDao.login(username, userpass);
if(b==true){
session.setAttribute("username", username);

// 为自动登录服务，先用Cookie保存用户名密码
Cookie cookie1 = new Cookie("uname",URLEncoder.encode(username, "UTF-8"));
Cookie cookie2 = new Cookie("upass",URLEncoder.encode(userpass, "UTF-8"));
response.addCookie(cookie1);
response.addCookie(cookie2);

//session.setMaxInactiveInterval(200);
out.print("<script>alert('登录成功！');</script>");
}else{
out.print("<script>alert('登录失败	！');</script>");
}
%>
