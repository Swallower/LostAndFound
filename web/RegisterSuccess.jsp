<%@ page language="java" import="dao.BaseDao,java.sql.*" pageEncoding="utf-8"%>


<%
	request.setCharacterEncoding("utf-8");
String username=request.getParameter("username");
String xuehao=request.getParameter("xuehao");
String userpass=request.getParameter("userpass");
String phoneNum=request.getParameter("phoneNum");
String email=request.getParameter("email");

String sql=" insert into t_user (xuehao,username,userpass,phoneNum,email)values(?,?,?,?,?) ";
BaseDao dao = new BaseDao();

Connection conn=dao.getMysqlConn();//获取数据库的链接
PreparedStatement ps =conn.prepareStatement(sql);
ps.setString(1, xuehao);
ps.setString(2, username);
ps.setString(3, userpass);
ps.setString(4, phoneNum);
ps.setString(5, email);
ps.execute();
pageContext.forward("Login.jsp");
%>
