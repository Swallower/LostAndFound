<%@ page language="java" import="dao.BaseDao,java.sql.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传物品图片</title>

</head>
<body>
<h1>上传物品图片</h1>
<form method="post" action="UploadServletLost" enctype="multipart/form-data">
    选择一个文件:
	        <select name="things">
	                <option value="select">请选择</option>
	                <option value="lost">丢失</option>
	                <option value="pick">拾得</option>

            </select>
    <input type="file" name="uploadFile" />
    <br/><br/>
    <input type="submit"  value="上传" />
</form>
</body>
</html>