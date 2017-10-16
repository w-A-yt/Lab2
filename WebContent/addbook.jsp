<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<span style="font-size: 12px;"><span style="font-size: 14px;">


		<html>
<head><title>增加图书</title>

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
		输入ISBN（不超过20个字符）:       <br> <input type="text" name="ISBN"> <br> 
		输入Title（不超过30个字符）:      <br> <input type="text" name="Title"> <br> 
		输入AuthorID（不超过30个字符）:   <br> <input type="text" name="AuthorID"> <br> 
		输入Publisher（不超过30个字符）:  <br> <input type="text" name="Publisher"> <br> 
		输入PublishDate（不超过30个字符）:<br> <input type="text" name="PublishDate"> <br> 
		输入Price（不超过20个字符）:      <br> <input type="text" name="Price"> <br> 
	
		<input type="submit" value="确定">
	</form>
	<%
	if(request.getParameter("ISBN")!=null && 
	request.getParameter("Title")!=null && 
	request.getParameter("AuthorID")!=null && 
	request.getParameter("Publisher")!=null && 
	request.getParameter("PublishDate")!=null && 
	request.getParameter("Price")!=null){
	
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
		
		String sql = "select *from Author where AuthorID='"+request.getParameter("AuthorID")+"'";
		ResultSet rs = statement.executeQuery(sql);
		String addsql = "INSERT  INTO  book  VALUES("+"'"+request.getParameter("ISBN")+"',"+"'"+request.getParameter("Title")+"',"+"'"+request.getParameter("AuthorID")+"',"+"'"+request.getParameter("Publisher")+"',"+"'"+request.getParameter("PublishDate")+"',"+"'"+request.getParameter("Price")+"'"+")";
		Statement addstatement = connection.createStatement();
		addstatement.executeUpdate(addsql);
		addstatement.close();
		
	%>

		<%
		if (rs.next() == false) {
			rs.close();
			statement.close();
			connection.close();
		%>
		<br>
		<br>
		<br>
		<b>请点击此处,刚才输入的作者ID为<%=request.getParameter("AuthorID") %></b>
		<br>
		<div>
		<button onclick="location='addauthor.jsp'">继续完善作者信息</button>
	    </div>
		
		<%	
			
		}
		
		}
	%>
	<div
		style="position: relative; float: left; margin-left: 30px; margin-top: 20px;">
		<input class="button green" type="button" value="返回主页"
			onclick="location='welcome.jsp'">
	</div>

</body>
		</html>