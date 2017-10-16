<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<span style="font-size: 12px;"><span style="font-size: 14px;">
<html>
<head><title>首页</title>

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
		<input class="button green" type="button" value="详情"
			onclick="location='showdetails.jsp'">
	</div>


	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="删除"
			onclick="location='delete.jsp'">
	</div>


	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="查询"
			onclick="location='queryauthor.jsp'">
	</div>

    <div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="新增"
			onclick="location='addbook.jsp'">
	</div>
	
	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="更新"
			onclick="location='refresh.jsp'">
	</div>

	<%
		
		//联结字符串   
		String userName = "kzlyj4xk00";
		//密码   
		String userPasswd = "1300kj2z2xy1144iz1hz0yyzxz203zxlx3i3jx45";
		
		//表名   
		String tableNameA = "Author";
		String tableNameB = "book";
		//联结字符串   
		String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_testlib" + "?user=" + userName + "&password=" + userPasswd
				+ "&useSSL=false";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statementB = connection.createStatement();
		String sqlA = "SELECT * FROM " + tableNameA;
		String sqlB = "SELECT * FROM " + tableNameB;
		ResultSet rsB = statementB.executeQuery(sqlB);
	%>
	<br>
	<br>
	<table align="center">
		<tr>
			<th>书名</th>
			<th>作者ID</th>
			<th>作者</th>
		</tr>

		<%
			while (rsB.next()) {
				Statement statementA = connection.createStatement();
				ResultSet rsA = statementA.executeQuery(sqlA);
		%>
		<tr>
			<td>
				<%
					out.print(rsB.getString(2));
				%>
			</td>
			
			<td>
				<%
					out.print(rsB.getString(3));
				%>
			</td>
			
			<td>
			<%
			while (rsA.next()) {
				if(rsB.getString(3).equals(rsA.getString(1))){
					out.print(rsA.getString(2));
				}	
			} 
			rsA.close();
			statementA.close();
			%>
			</td>
		</tr>
		<%
			}
		%>
	</table>

	<%
		rsB.close();
		statementB.close();
		connection.close();
	%>

</body>
		</html>