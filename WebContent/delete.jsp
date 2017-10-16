<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<span style="font-size: 12px;"> <span style="font-size: 14px;">
		<html>
<head>
<title>删除</title>

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

	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="返回"
			onclick="location='welcome.jsp'">
	</div>

	<%
	//联结字符串   
			String userName = "kzlyj4xk00";
			//密码   
			String userPasswd = "1300kj2z2xy1144iz1hz0yyzxz203zxlx3i3jx45";
			//联结字符串   
			String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_testlib" + "?user=" + userName + "&password=" + userPasswd
					+ "&useSSL=false";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
	%>
<br>
<br>
<br>
<br>
<br>
    <form>
		输入要删除图书的ISBN:<br> <input type="text" name="ISBN"> <br> <input
			type="submit" value="确定">
	</form>
	<%
	Statement delstate = connection.createStatement();
	String deletesql = "delete from book where ISBN='" + request.getParameter("ISBN") + "'";
	delstate.executeUpdate(deletesql);
	delstate.close();
	connection.close();
	%>
	

</body>
		</html>