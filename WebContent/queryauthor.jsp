<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<span style="font-size: 12px;"><span style="font-size: 14px;">


		<html>
<head><title>查询作者所著图书</title>

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
		输入作者名字:<br> <input type="text" name="name"> <br> <input
			type="submit" value="确定">
	</form>
	<%
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
		
		String sql = "select *from Author where Name='"+request.getParameter("name")+"'";
		ResultSet rs = statement.executeQuery(sql);
		String tableNameB = "book";
		String sqlB = "SELECT * FROM " + tableNameB;
		
	%>
	<br>
	<br>
	<table align="center">
		<tr>
			<th>作者</th>
			<th>书名</th>
		</tr>

		<%			
		while (rs.next()) {
				Statement statementB = connection.createStatement();
				ResultSet rsB = statementB.executeQuery(sqlB);
				while(rsB.next()){
				if(rs.getString(1).equals(rsB.getString(3))){
		%>
		<tr>
			<td>
				<%
					out.print(rs.getString(2));
				%>
			</td>
			<td>
				<%
					out.print(rsB.getString(2));
				%>
			</td>
			
			
		</tr>
		<%
			}}
				rsB.close();
				statementB.close();
			}
		%>
	</table>
	
	<% 
		rs.close();
		statement.close();
		connection.close();
	%>
	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="返回主页"
			onclick="location='welcome.jsp'">
	</div>

</body>
		</html>