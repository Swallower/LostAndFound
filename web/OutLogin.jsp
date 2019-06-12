<%@ page language="java"  pageEncoding="utf-8"%>
<%
session.removeAttribute("username");
session.invalidate();
response.sendRedirect("Login.jsp");

%>
