<%@ page language="java" import="dao.BaseDao,java.sql.*" pageEncoding="utf-8"%>
<%@ include file="CheckLogin.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
request.setCharacterEncoding("utf-8");
String title=request.getParameter("title");
String miaoshu=request.getParameter("miaoshu");
String style=request.getParameter("style");
String image=request.getParameter("image");
String losttime=request.getParameter("losttime");
String xuehao=(String)session.getAttribute("xuehao");
String filePath=(String)session.getAttribute("filePath");
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
//java.util.Date date = format.parse(obj.getString("losttime").toString());
String date = format.format(format.parse(losttime));
String place=request.getParameter("place");
String sql=" insert into t_lost (userId,state,title,content,type,img,losttime,updatetime,place) values(?,?,?,?,?,?,?,?,?) ";
//String sqll=" insert into t_allInformation (userId,state,title,content,type,img,losttime,updatetime) values(?,?,?,'1',?,?,now(),now()) ";
BaseDao dao = new BaseDao();
//out.print("<script>alert('必须登录才能访问主页')</script>");
Connection conn=dao.getMysqlConn();//获取数据库的链接
PreparedStatement ps =conn.prepareStatement(sql);
ps.setString(1, xuehao);
ps.setString(2, "0");
ps.setString(3, title);
ps.setString(4, miaoshu);
ps.setString(5, style);
ps.setString(6, "1");
//ps.setString(7,place);
ps.setString(7, date);
ps.setString(8, date);
ps.setString(9,place);

//ps.setTimestamp(7,new Timestamp(new Date().getTime()));
//ps.setString(7, date);
ps.execute();


%>
<% 
	out.print("<script>alert('恭喜您，上传成功！希望可以尽快联系您！');</script>");
	pageContext.forward("upload.jsp");
%>