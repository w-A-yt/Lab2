<%@ page language="java" import="java.sql.*,java.io.*,java.util.*"
	contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<html>
<head>
<title>更新</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<form>
		输入要更新书本的ISBN:（必填）<br> <input type="text" name="ISBN"> <br> 
		将出版社更新为:（选填）      <br> <input type="text" name="Publisher"> <br>
		将出版日期更新为:（选填）    <br> <input type="text" name="PublishDate"> <br>
		将价格更新为:（选填）        <br> <input type="text" name="Price"> <br>
		将作者ID更新为:（选填）      <br> <input type="text" name="AuthorID"> <br>
		<input type="submit" value="确定">
	</form>

<%
	if(request.getParameter("ISBN")!=null && request.getParameter("ISBN")!=""){
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
		
		if(request.getParameter("Publisher")!=""){
			Statement statement = connection.createStatement();
			String s = "UPDATE book SET Publisher = "+"'"+request.getParameter("Publisher")+"'"+"WHERE ISBN = '"+request.getParameter("ISBN")+"'";
			statement.executeUpdate(s);
			statement.close();
		}
		if(request.getParameter("PublishDate")!=""){
			Statement statement = connection.createStatement();
			String s = "UPDATE book SET PublishDate = "+"'"+request.getParameter("PublishDate")+"'"+"WHERE ISBN = '"+request.getParameter("ISBN")+"'";
			statement.executeUpdate(s);
			statement.close();
		}
		if(request.getParameter("Price")!=""){
			Statement statement = connection.createStatement();
			String s = "UPDATE book SET Price = "+"'"+request.getParameter("Price")+"'"+"WHERE ISBN = '"+request.getParameter("ISBN")+"'";
			statement.executeUpdate(s);
			statement.close();
		}
		if(request.getParameter("AuthorID")!=""){
			Statement statementA = connection.createStatement();
			String sqlA = "select *from Author where AuthorID='"+request.getParameter("AuthorID")+"'";
			ResultSet Ars = statementA.executeQuery(sqlA);
			if(Ars.next()!=false){
				Statement statement = connection.createStatement();
				String s = "UPDATE book SET AuthorID = "+"'"+request.getParameter("AuthorID")+"'"+"WHERE ISBN = '"+request.getParameter("ISBN")+"'";
				statement.executeUpdate(s);
				statement.close();
			}
			else{
				Statement statement = connection.createStatement();
				String s = "UPDATE book SET AuthorID = "+"'"+request.getParameter("AuthorID")+"'"+"WHERE ISBN = '"+request.getParameter("ISBN")+"'";
				statement.executeUpdate(s);
				statement.close();
				%>
				
				<br>
		<br>
		<br>
		<b>请点击此处,刚才输入的作者ID为<%=request.getParameter("AuthorID") %></b>
		<br>
				<button onclick="location='addauthor.jsp'">完善作者信息</button>
				<%
			}
		}
		
	} %>
</body>
</html>