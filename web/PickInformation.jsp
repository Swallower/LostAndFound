<%@page import="dao.UserDao"%>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*,thingsBean.thingsInformation" %>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
 <head>
     <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
     <title>失物招领信息表</title>
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
        td:nth-of-type(6)
        {
            width: 30px;
        }
        th:nth-of-type(7)
        {
            width: 70px;
        }
        td:nth-of-type(8)
        {
            width: 70px;
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
            <caption class="h3 text-info" style="margin-bottom:15px;">拾得信息表</caption>
         <div class="box1">
             <label for="place">地 点:</label>
             <select name="place" id="sel">
                 <option value="select" selected>请选择</option>
                 <option value="Abuilding">教学A楼</option>
                 <option value="Bbuilding">教学B楼</option>
                 <option value="Cbuilding">教学C楼</option>
                 <option value="Dbuilding">教学D楼</option>
                 <option value="Artbuilding">艺术楼</option>
                 <option value="Playground">风雨操场</option>
             </select>
             <label for="time">丢失时间:</label><input name="losttime" id="meeting"   type="date" value="2019-04-06"/>
         </div>
            <tr class="text-danger">
                <th class="text-center">序号</th>
                <th class="text-center">名称</th>
                <th class="text-center">描述</th>
                <th class="text-center">类型</th>
                <th class="text-center">图片</th>
                <th class="text-center">地点</th>
                <th class="text-center">丢失时间</th>
                <th class="text-center">更新时间</th>
                <th class="text-center">联系</th>
            </tr>
        <%
        	UserDao  uDao = new UserDao();
        		String  pages=request.getParameter("strpage");
        		int lastpage=uDao.LastPagePick(10);
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

        		ArrayList<thingsInformation> list =uDao.getListByPagePick(pageNum, 10);
        		for(int i=0;i<list.size();i++ ){
        		thingsInformation  pick=(thingsInformation)list.get(i);
        		session.setAttribute("userID", pick.getUserId());
        %>
 <tr class="text-center" v-for="item in myData">
    <td><%=pick.getId() %></td>
    <td><%=pick.getTitle() %></td>
    <td><%=pick.getContent() %></td>
    <td><%=pick.getType() %></td>
    <td><img src="images\<%=pick.getImg()%>" alt="图片" /></td>
    <td><%=pick.getPlace()%></td>
    <td><%=pick.getLosttime()%></td>
    <td><%=pick.getUpdatetime()%></td>
    <td>
		 <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#layer" style="margin-right:100%;" href="Connection.jsp" target="_blank">联系</a>
	</td>
  </tr>

  <%
   }
   %>
   <tr >
    <td colspan="8" align="center" style="padding-top:15px;">
     <a href="PickInformation.jsp">首页</a>
       <a href="PickInformation.jsp?strpage=<%=pageNum-1%>">上一页</a>
       <a href="PickInformation.jsp?strpage=<%=pageNum+1%>">下一页</a>
       <a href="PickInformation.jsp?strpage=<%=uDao.LastPagePick(10) %>">末页</a>
       <form action="PickInformation.jsp" method="get">
       <input type="text" name="strpage" style="width:50px;margin-top:5px;" /><input type="submit" value="跳转" />
       </form>    
    </td>
  </tr>
        </table>
 </body>
 </html>
 