<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<span style="font-size: 12px;"><span style="font-size: 14px;">

		<html>
		
		<meta name="Author" content="Sigma">

<meta name="Description" content="http://www.g8up.cn">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<style type="text/css">
#expandMore {
	cursor: pointer;
}

#briefInfo {
	height: 20px;
	overflow: hidden;
}
</style>
<head><title>显示详情</title>
<style type="text/css">
#expandMore {
	cursor: pointer;
}

#briefInfo {
	height: 20px;
	overflow: hidden;
}
</style>
</head>
<body>

	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="返回主页面"
			onclick="location='welcome.jsp'">
	</div>

	<%
		//驱动程序名   
		String driverName = "com.mysql.jdbc.Driver";
		//数据库用户名   
		//数据库用户名   
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
		
		String sqlB = "SELECT * FROM " + tableNameB;
		String sqlA = "SELECT * FROM " + tableNameA;
		ResultSet rsB = statementB.executeQuery(sqlB);
	%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<b>姓名</b>
	<br>

	<%
		int i = 0;
		while (rsB.next()) {
			Statement statementA = connection.createStatement();
			ResultSet rsA = statementA.executeQuery(sqlA);
			
	%>

	<p hidden>
	图书信息：
	<br>ISBN (PK):  <%=rsB.getString(1)%>
	<br>Title:  <%=rsB.getString(2)%>
	<br>AuthorID (FK):  <%=rsB.getString(3)%>
	<br>Publisher:  <%=rsB.getString(4)%>
	<br>PublishDate:  <%=rsB.getString(5)%>
	<br>Price:  <%=rsB.getString(6)%>
	<%
	while (rsA.next()) {
		if(rsB.getString(3).equals(rsA.getString(1))){
			
	%>
	<br>作者信息：
	<br>AuthorID (PK):  <%=rsA.getString(1)%>
	<br>Name:  <%=rsA.getString(2)%>
	<br>Age:  <%=rsA.getString(3)%>
	<br>Country:  <%=rsA.getString(4)%>
	<% 
	
		}	
	} 
	
	rsA.close();
	statementA.close();
	%>
	
	</p>
	<button>书名：<%=rsB.getString(2)%></button>
	<br>
	<br>

	<script type="text/javascript">
		$(document).ready(function() {
			$("button:eq(<%=i%>)").click(function() {
				$("p:eq(<%=i%>)").toggle(1000);
			});
		});
	</script>
	<%
		i++;
		}
		rsB.close();
		statementB.close();
		connection.close();
	%>


</body>
		</html>