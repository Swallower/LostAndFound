<%@page import="dao.UserDao"%>
<%@page contentType="text/html; charset=utf-8" import="java.util.*,thingsBean.thingsInformation,userBean.*" %>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
 <head>
     <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
     <title>个人拾得信息上传表</title>
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/paging.css">
    <script src="JS/jquery-1.10.1.js"></script>
    <script src="JS/paging.js"></script>
     <style type="text/css">
        table{

            margin-top: 50px;
            margin-left: 10px;

        }
        td{
            height: 25px;
        }
        td:nth-of-type(1)
        {
            width: 5px;
        }
        th:nth-of-type(2)
        {
            width: 15px;
        }
        th:nth-of-type(3)
        {
            width: 20%;
        }
        td:nth-of-type(4)
        {
            width: 20px;
        }
        td:nth-of-type(5)
        {
            width: 30px;
        }
        th:nth-of-type(6)
        {
            width: 70px;
        }
        td:nth-of-type(7)
        {
            width: 70px;
        }
        td:nth-of-type(8)
        {
            width: 10%;
        }
        td:nth-of-type(9)
        {
            width: 10%;
        }
        img{
            width: 110px;
            height: 70px;

        }
        a{
        	padding-right:10px;
        	font-size:18px;
        	line-height:10px;
     	}
     	input{
     		font-size:15px;
     	}
     </style>
 </head>
 <body>

     <table class="table table-bordered table-hover">
            <caption class="h3 text-info" style="margin-bottom:15px;">个人拾得信息上传表</caption>
            <tr class="text-danger">
                <th class="text-center">序号</th>
                <th class="text-center">名称</th>
                <th class="text-center">描述</th>
                <th class="text-center">类型</th>
                <th class="text-center">图片</th>
                <th class="text-center">丢失时间</th>
                <th class="text-center">更新时间</th>
                <th class="text-center">状态</th>
                <th class="text-center">操作</th>
            </tr>
        <%
        	String xuehao=(String)session.getAttribute("xuehao");
        		UserDao  uDao = new UserDao();
        		String  pages=request.getParameter("strpage");
        		int lastpage=uDao.LastPageLost(10);
        		int pageNum=1;//默认页
        		if(pages!=null){
        	try {
        		  	  pageNum=Integer.parseInt(pages);
        	}catch(Exception e){
        		    	pageNum=1;
        	}
        		}

        		if(pageNum<1){
        	pageNum=1;
        		}
        		if(pageNum>lastpage){
        	pageNum=lastpage;
        		}

        	
            UserDao userDao = new UserDao();
            String state;
            ArrayList<thingsInformation> list=userDao.getUsersByUserIdPick(xuehao, "0","2",pageNum, 10);
        		for(int i=0;i<list.size();i++ ){
        		thingsInformation lost =(thingsInformation)list.get(i);
        		if(lost.getState()==2){
        			state="已送回失主";
        		}else{
        			state="未找到失主";
        		}
        %>
 <tr class="text-center" v-for="item in myData">
    <td><%=lost.getId() %></td>
    <td><%=lost.getTitle() %></td>
    <td><%=lost.getContent() %></td>
    <td><%=lost.getType() %></td>
    <td><img src="images\<%=lost.getImg()%>" alt="图片" /></td>
    <td><%=lost.getLosttime()%></td>
    <td><%=lost.getUpdatetime()%></td>
    <td><input type="button" class="btn btn-primary btn-sm"  style="margin-left:3%;" value="<%= state %>">
    <td>
		 <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#layer" style="margin-left:3%;" href="DeleteInformationPick.jsp?id=<%=lost.getId()%>" target="_blank">删除</a>
     <form action="SelectPick.jsp?id=<%=lost.getId()%>" method="post">
         <button value="2"  class="btn btn-primary btn-sm" style="margin-left:3%;"name="button2">确认找回</button>
     </form>
	</td>
  </tr>

  <%
   }
   %>
   <tr >
    <td colspan="9" align="center" style="padding-top:15px;">
     <a href="UploadPick.jsp">首页</a>
       <a href="UploadPick.jsp?strpage=<%=pageNum-1%>">上一页</a>
       <a href="UploadPick.jsp?strpage=<%=pageNum+1%>">下一页</a>
       <a href="UploadPick.jsp?strpage=<%=uDao.LastPageLost(10) %>">末页</a>
       <form action="UploadPick.jsp" method="get">
       <input type="text" name="strpage" style="width:50px;margin-top:5px;" /><input type="submit" value="跳转" />
       </form>    
    </td>
  </tr>

        </table>

 </body>
 </html>
 
