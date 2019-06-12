-<%@ page language="java" import="dao.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.net.URLEncoder" %>

<%
request.setCharacterEncoding("utf-8");
String xuehao=request.getParameter("xuehao");
String userpass=request.getParameter("password");

UserDao uDao = new UserDao();
boolean b = uDao.login(xuehao, userpass);
String username=uDao.username(xuehao);
if(b==true){
	
	session.setAttribute("xuehao", xuehao);
	session.setAttribute("username", username);

	Cookie cookie1 = new Cookie("xuehao",URLEncoder.encode(xuehao, "UTF-8"));
	Cookie cookie2 = new Cookie("upass",URLEncoder.encode(userpass, "UTF-8"));
	response.addCookie(cookie1);
	response.addCookie(cookie2);

//session.setMaxInactiveInterval(200);
//	out.print("<script>alert('恭喜您，登录成功！');</script>");
	if(username.equals("admin")){
		//用于测试
		//out.print("<script>alert(12345);</script>");
		response.sendRedirect("indexAdmin.jsp");
	}else{
		//用于测试
		//out.print("<script>alert(username);</script>");
		response.sendRedirect("index.jsp");
	}
}else{
	out.print("<script>alert('很抱歉，登录失败，请检查您的用户名和密码！');location.href='Login.jsp';</script>");
}
%>
