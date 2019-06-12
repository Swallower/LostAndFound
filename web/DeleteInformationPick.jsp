<%@ page language="java" import="dao.*,java.sql.*" pageEncoding="utf-8"%>

<%
request.setCharacterEncoding("utf-8");
String id =request.getParameter("id");
int num = Integer.parseInt(id);
UserDao uDao = new UserDao();
int  b = uDao.deleteByIdPick(num);
//System.out.print(b);
if(b>0){
out.print("<script>alert('删除成功！');location.href='UploadPick.jsp';</script>");
}else{
out.print("<script>alert('删除失败	！');location.href='UploadPick.jsp'</script>");
}
%>
