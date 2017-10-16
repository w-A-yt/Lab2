<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<span style="font-size: 12px;"><span style="font-size: 14px;">


		<html>
<head><title>增加作者</title>

<style type="text/css">
table {
	border: 2px #CCCCCC solid;
	width: 360px;
}

td, th {
	height: 30px;
	border: #CCCCCC 1px solid;
}
</style>

</head>
<body>

	<form>
		输入AuthorID（不超过30个字符）:   <br> <input type="text" name="AuthorID"> <br> 
		输入Name（不超过30个字符）:       <br> <input type="text" name="Name"> <br> 
		输入Age（不超过5个字符）:         <br> <input type="text" name="Age"> <br> 
		输入Country（不超过30个字符）:    <br> <input type="text" name="Country"> <br> 
		<input type="submit" value="确定">
	</form>
	<%
	if(
	request.getParameter("AuthorID")!=null && 
	request.getParameter("Name")!=null && 
	request.getParameter("Age")!=null && 
	request.getParameter("Country")!=null){
		
		//数据库用户名   
		String userName = "kzlyj4xk00";
		//密码   
		String userPasswd = "1300kj2z2xy1144iz1hz0yyzxz203zxlx3i3jx45";
		
		//表名   
		//联结字符串   
		String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_testlib" + "?user=" + userName + "&password=" + userPasswd
				+ "&useSSL=false";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statement = connection.createStatement();
		String addsql = "INSERT  INTO  Author  VALUES("+"'"+request.getParameter("AuthorID")+"',"+"'"+request.getParameter("Name")+"',"+"'"+request.getParameter("Age")+"',"+"'"+request.getParameter("Country")+"'"+")";
		Statement addstatement = connection.createStatement();
		addstatement.executeUpdate(addsql);
		addstatement.close();
	} %>

	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="返回主页"
			onclick="location='welcome.jsp'">
	</div>

</body>
		</html>