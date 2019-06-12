<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/23
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

</head>>
<body>
    <select onchange="fun()">
    <option value="0"></option>
    <option value="1"></option>
    <option value="2"></option>
    </select>
    <script src="JS/jquery-1.10.1.js">
        function func(){
            //获取被选中的option标签
            var vs = $('select  option:selected').val();
        }
    </script>



</body>
</html>
