<%@ page language="java" import="dao.BaseDao,java.sql.*" pageEncoding="utf-8"%>
<%@ include file="CheckLogin.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
//    Class.forName("com.mysql.jdbc.Driver");
//    String url="jdbc:mysql://localhost:3306/project3";
//    String username="root";
//    s
    request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String state1=request.getParameter("button1");
    System.out.print("state1:"+state1+",id:"+id);

    String sql=" update t_lost set state=? where id=? ";

    BaseDao dao = new BaseDao();

    Connection conn=dao.getMysqlConn();
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setString(1,state1);
    ps.setString(2,id);
    boolean flag=ps.execute();
    System.out.print(state1);
//    System.out.print("flag:"+flag);



%>

<%
    pageContext.forward("UploadLost.jsp");
%>