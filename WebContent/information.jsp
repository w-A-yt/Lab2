<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>说明</title>
</head>
<body>
<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="返回首页"
			onclick="location='welcome.jsp'">
	</div>
<br>
<br>
<br>
<br>
<br>

<br>
修改一下
首页：展示所有图书及作者，作者ID<br>
详情：进入后点击按钮后查看本书详情信息<br>
删除：删除图书<br>
查询：输入作者名称后点击确定，显示作者及该作者所有图书<br>
新增：输入新增图书信息，<b>并暂时记住输入的AuthorID</b>，如果作者不在库中，将进一步输入作者信息，将用到AuthorID<br>
更新：更新图书部分信息，若更新作者，且作者不在库中，将继续完善作者信息
</body>
</html>