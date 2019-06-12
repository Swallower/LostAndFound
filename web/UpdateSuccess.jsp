<%@ page language="java" import="userBean.*,dao.*,java.sql.*" pageEncoding="utf-8"%>

<%
request.setCharacterEncoding("utf-8");
Users u = new Users();
u.setXuehao(request.getParameter("xuehao"));
u.setEmail(request.getParameter("email"));
u.setPhoneNum(request.getParameter("phoneNum"));
u.setUsername(request.getParameter("username"));
u.setUserpass(request.getParameter("userpass"));
UserDao dao = new UserDao();
int i = dao.updateUsersByXuehao(u);
if(i>0){
out.print("<script>alert('修改成功！');location.href='MyInformation.jsp?id="+request.getParameter("username")+"';</script>");
}else{
out.print("<script>alert('修改失败	！');location.href='MyInformation.jsp'</script>");
}
%>
